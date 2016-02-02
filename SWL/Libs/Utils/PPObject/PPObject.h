//
//  PPObject.h
//  TaoTaoJing
//
//  Created by Ping on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PPObject : NSObject {
	NSMutableDictionary			*_data;
}

@property (nonatomic,retain) NSMutableDictionary *data;

- (id)init;
- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (id)objectWithDictionary:(NSDictionary *)dictionary;

@end
