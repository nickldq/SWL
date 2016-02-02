//
//  SaveUserInfo.h
//  HZXS_IOS
//
//  Created by sam.l on 13-10-17.
//  Copyright (c) 2013年 hzxs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"
@interface SaveUserInfo : NSObject
{
    UserInfoModel*usermodel;
}
+(UserInfoModel *)loadCustomObjectWithKey;
+(void)saveCustomObject:(UserInfoModel *)mo;

@end
