//
//  MainRequestService.h
//  SouthMedia
//
//  Created by Liudq on 14-6-9.
//  Copyright (c) 2014年 pandoranews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestHelper.h"
#import "RequestSeviceCommon.h"

/**
 *  @Author Liudongqi, 14-10-16 11:10:33
 *
 *  本代码只是个例子
 */
@protocol MainRequestServiceDelegate <NSObject>

/**
 *  @Author Liudongqi, 14-10-16 11:10:51
 *
 *  获取成功协议
 *
 *  @param body
 */
-(void)getMainDataFinished:(id)body;

/**
 *  @Author Liudongqi, 14-10-16 11:10:25
 *
 *  获取失败协议
 *
 *  @param body
 */
- (void)getMainDataFailed:(id)body;

@end
#pragma mark 首页展示模块
@interface MainRequestService : RequestSeviceCommon

@property (nonatomic, strong) id delegate;

+(MainRequestService *) sharedInstance;

#pragma mark 获得首页数据列表
- (void)getMainDataRequestSeviceByBlock:(int)block;

- (void)getMainDataRequestSeviceByStarttime:(NSString *)starttime flag:(int)flag;
@end
