//
//  NewsRequestSevice.h
//  Pandoranews
//
//  Created by liudq on 14-05-13.
//  Copyright (c) 2014年 liudq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "kConstants.h"

@interface RequestHeader : NSObject {
    
	NSString *version;		// 版本号
	NSString *origin;       // 下载来源
	NSString *model;		// 机器型号
	NSString *deviceId;		// 机器编码
	NSString *deviceToken;		//应用推送token
	NSString *customNo;		// 客户编号
	NSString *token;		// 系统交互时的密钥
	NSArray  *resolution;	// 分辨率
	NSString  *resize;      // 图片大小
	NSString *QRToken;		// 二维码的密钥
	NSString *msaleTunn;	// 媒体通道
	NSString *msaleGb;		// 媒体区分
	NSString *msaleCode;	// 频道区分
	NSString *msaleDCode;	// 频道细分
	NSString *sign;			// 签名
	NSString *serviceId;	// 接口编号
	NSString *_showStat;     // 判断用户类型
}

@property (nonatomic,copy)  NSString *showStat;
@property (nonatomic, copy) NSString *version;
@property (nonatomic, copy) NSString *origin;
@property (nonatomic, copy) NSString *model;
@property (nonatomic, copy) NSString *deviceId;
@property (nonatomic, copy) NSString *deviceToken;
@property (nonatomic, copy) NSString *customNo;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, strong) NSArray *resolution;
@property (nonatomic, strong) NSString  *resize;
@property (nonatomic, copy) NSString *QRToken;
@property (nonatomic, copy) NSString *msaleTunn;
@property (nonatomic, copy) NSString *msaleGb;
@property (nonatomic, copy) NSString *msaleCode;
@property (nonatomic, copy) NSString *msaleDCode;
@property (nonatomic, copy) NSString *sign;
@property (nonatomic, copy) NSString *serviceId;

-(NSDictionary*)packageHeader;

@end
