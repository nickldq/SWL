//
//  UserInfoModel.m
//  YMProject
//
//  Created by sam.l on 14-10-28.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel

- (id)initWithCoder: (NSCoder *)coder
{
    if (self = [super init])
    {
        self.userId = [coder decodeObjectForKey:@"id"];
        self.area = [coder decodeObjectForKey:@"area"];
        self.birthday = [coder decodeObjectForKey:@"birthday"];
        self.cover = [coder decodeObjectForKey:@"cover"];
        self.email = [coder decodeObjectForKey:@"email"];
        self.card = [coder decodeObjectForKey:@"card"];
        self.lastLoginTime = [coder decodeObjectForKey:@"lastLoginTime"];
        self.level = [coder decodeObjectForKey:@"level"];
        self.name = [coder decodeObjectForKey:@"name"];
        self.nick = [coder decodeObjectForKey:@"nick"];
        self.phone = [coder decodeObjectForKey:@"phone"];
        self.score = [coder decodeObjectForKey:@"score"];
        self.sex = [coder decodeObjectForKey:@"sex"];
        self.source = [coder decodeObjectForKey:@"source"];
        self.status = [coder decodeObjectForKey:@"status"];
        self.addScore = [coder decodeObjectForKey:@"addScore"];
        self.password = [coder decodeObjectForKey:@"password"];
    }
    return self;
}
- (void)encodeWithCoder: (NSCoder *)coder
{
    [coder encodeObject:self.userId forKey:@"id"];
    [coder encodeObject:self.area forKey:@"area"];
    [coder encodeObject:self.birthday forKey:@"birthday"];
    [coder encodeObject:self.cover forKey:@"cover"];
    [coder encodeObject:self.email forKey:@"email"];
    [coder encodeObject:self.card forKey:@"card"];
    [coder encodeObject:self.lastLoginTime forKey:@"lastLoginTime"];
    [coder encodeObject:self.level forKey:@"level"];
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.nick forKey:@"nick"];
    [coder encodeObject:self.phone forKey:@"phone"];
    [coder encodeObject:self.score forKey:@"score"];
    [coder encodeObject:self.sex forKey:@"sex"];
    [coder encodeObject:self.source forKey:@"source"];
    [coder encodeObject:self.status forKey:@"status"];
    [coder encodeObject:self.addScore forKey:@"addScore"];
    [coder encodeObject:self.password forKey:@"password"];
}

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.userId =[NSString stringWithFormat:@"%@",[Common checkNSNull:[attributes valueForKeyPath:@"id"]]];
    self.area =[Common checkNSNull:[attributes valueForKeyPath:@"area"]];
    self.birthday =[Common checkNSNull:[attributes valueForKeyPath:@"birthday"]];
    self.cover =[Common checkNSNull:[attributes valueForKeyPath:@"cover"]];
    self.email =[Common checkNSNull:[attributes valueForKeyPath:@"email"]];
    self.card =[Common checkNSNull:[attributes valueForKeyPath:@"card"]];
    self.lastLoginTime =[Common checkNSNull:[attributes valueForKeyPath:@"lastLoginTime"]];
    self.level =[Common checkNSNull:[attributes valueForKeyPath:@"level"]];
    self.name =[Common checkNSNull:[attributes valueForKeyPath:@"name"]];
    self.nick =[Common checkNSNull:[attributes valueForKeyPath:@"nick"]];
    self.phone =[Common checkNSNull:[attributes valueForKeyPath:@"phone"]];
    self.score =[Common checkNSNull:[attributes valueForKeyPath:@"score"]];
    self.sex =[Common checkNSNull:[attributes valueForKeyPath:@"sex"]];
    self.source =[Common checkNSNull:[attributes valueForKeyPath:@"source"]];
    self.status =[Common checkNSNull:[attributes valueForKeyPath:@"status"]];
    self.addScore = [Common checkNSNull:[attributes valueForKeyPath:@"addScore"]];
    self.password = [Common checkNSNull:[attributes valueForKeyPath:@"password"]];
    return self;
}

@end
