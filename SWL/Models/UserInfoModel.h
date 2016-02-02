//
//  UserInfoModel.h
//  YMProject
//
//  Created by sam.l on 14-10-28.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoModel : NSObject<NSCoding>

@property (nonatomic, strong) NSString *userId;// 用户id
@property (nonatomic, strong) NSString *area;// 用户所在地区
@property (nonatomic, strong) NSString *email;// 邮箱
@property (nonatomic, strong) NSString *nick;// 用户昵称
@property (nonatomic, strong) NSString *birthday;// 用户生日
@property (nonatomic, strong) NSString *card;// 卡号
@property (nonatomic, strong) NSString *cover;// 头像
@property (nonatomic, strong) NSString *level;// 用户级别（1=普通会员，2=VIP）
@property (nonatomic, strong) NSString *name;// 用户登录名
@property (nonatomic, strong) NSString *phone;// 手机号
@property (nonatomic, strong) NSString *score;// 积分
@property (nonatomic, strong) NSString *sex;// 性别（1=男，0=女）
@property (nonatomic, strong) NSString *source;// 用户来源
@property (nonatomic, strong) NSString *status;// 用户状态（1=正常，0=被屏蔽）
@property (nonatomic, strong) NSString *lastLoginTime;// 最后一次登录时间
@property (nonatomic, strong) NSString *password;// 密码

@property (nonatomic, strong) NSString *addScore;// 签到应得积分

- (instancetype)initWithAttributes:(NSDictionary *)attributes;


@end
