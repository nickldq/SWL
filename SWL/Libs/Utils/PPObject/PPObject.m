//
//  PPObject.m
//  TaoTaoJing
//
//  Created by Ping on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PPObject.h"
#import <objc/runtime.h>

static id DynamicDictionaryGetter(id self, SEL _cmd)
{
	PPObject *object = (PPObject *)self;
	NSString *key = NSStringFromSelector(_cmd);
	if([key isEqualToString:@"uniqueId"])
		key = @"id";
	else if([key isEqualToString:@"desc"])
		key = @"description";
#ifdef CONVERT_UNDERSCORE
	key = [key underscore];
#endif
	id value = [object.data objectForKey:key];

    if (!value) {
        return @"";
    }
    
    
    if ([value isKindOfClass:[NSNull class]]) {
        return @"";
    }
    
	if([value isKindOfClass:[NSString class]] && ([value isEqualToString:@"<null>"] || [value isEqualToString:@"null"]))
        return @"";
	else
		return value;
}

static NSString *PropertyNameFromSetter(NSString *setterName)
{
	setterName = [setterName substringFromIndex:3];		// Remove "set"
	NSString *firstChar = [[setterName substringToIndex:1] lowercaseString];
	NSString *tail = [setterName substringFromIndex:1];
	tail = [tail substringToIndex:[tail length] - 1];	// Remove ":"
	return [firstChar stringByAppendingString:tail];	// Convert first char to lowercase.
}

static void DynamicDictionarySetter(id self, SEL _cmd, id value)
{
	NSString *key = PropertyNameFromSetter(NSStringFromSelector(_cmd));
#ifdef CONVERT_UNDERSCORE
	key = [key underscore];
#endif
	PPObject *object = (PPObject *)self;
	if (value == nil)
	{
		[object.data removeObjectForKey:key];
	}
	else
	{
		[object.data setObject:value forKey:key];
	}
}


@implementation PPObject

@synthesize data = _data;

#pragma mark -

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
	NSString *selStr = NSStringFromSelector(sel);
	// Only handle selectors with no colon.
	if ([selStr rangeOfString:@":"].location == NSNotFound)
	{
		return class_addMethod(self, sel, (IMP)DynamicDictionaryGetter, @encode(id(*)(id, SEL)));
	}
	else if ([selStr hasPrefix:@"set"] &&
			 [selStr hasSuffix:@":"] &&
			 [selStr rangeOfString:@":" options:0 range:NSMakeRange(0, [selStr length] - 1)].location == NSNotFound &&
			 [selStr length] >= 5)
	{
		return class_addMethod(self, sel, (IMP)DynamicDictionarySetter, @encode(id(*)(id, SEL, id)));
	}
	else
	{
		return [super resolveInstanceMethod:sel];
	}
}

#pragma mark -
#pragma mark init

- (id)init
{
	self = [super init];
	if(self)
	{
		self.data = [NSMutableDictionary dictionaryWithCapacity:32];
	}
	return self;
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(self)
	{
		self.data = [NSMutableDictionary dictionaryWithCapacity:32];
		
		// filter '<null>'
		NSArray *keys = [dictionary allKeys];
		for(id key in keys)
		{
			id value = [dictionary objectForKey:key];
                        
            if (value) {
                if ([value isKindOfClass:[NSNull class]]) {
                    [self.data setObject:@"" forKey:key];
                } 
                else if (value && !([value isKindOfClass:[NSString class]] && [value isEqualToString:@"<null>"]))
                {
                    [self.data setObject:value forKey:key];
                }
            } else {
                [self.data setObject:@"" forKey:key];
            }
            
		}

		[self.data addEntriesFromDictionary:dictionary];
	}
	return self;
}

+ (id)objectWithDictionary:(NSDictionary *)dictionary
{
	return [[[self class] alloc] initWithDictionary:dictionary];
}

- (void)dealloc
{
	self.data = nil;
}

@end
