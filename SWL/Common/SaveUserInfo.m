//
//  SaveUserInfo.m
//  HZXS_IOS
//
//  Created by sam.l on 13-10-17.
//  Copyright (c) 2013年 hzxs. All rights reserved.
//

#import "SaveUserInfo.h"

@implementation SaveUserInfo

#pragma mark 从NSUserDefaults把用户信息取出来
+(UserInfoModel *)loadCustomObjectWithKey
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [defaults objectForKey:userinfokey];
    UserInfoModel *obj = (UserInfoModel *)[NSKeyedUnarchiver unarchiveObjectWithData: myEncodedObject];
    return obj;
}

#pragma mark 把登录信息写入NSUserDefaults
+(void)saveCustomObject:(UserInfoModel *)mo
{
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:mo];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:myEncodedObject forKey:userinfokey];
    [defaults synchronize];
}


@end
