//
//  NewsRequestSevice.h
//  Pandoranews
//
//  Created by liudq on 14-05-13.
//  Copyright (c) 2014年 liudq. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RequestHeader.h" 
  
@interface RequestHelper : NSObject{
	
//	id <RequestDaoDelegate> delegate;
    
	SEL requestFinishedSelector;
	SEL requestFailedSelector;
}

@property (nonatomic, strong) id delegate;

@property (assign) SEL requestFinishedSelector;
@property (assign) SEL requestFailedSelector;

/**
 *  @Author Liudongqi, 14-10-16 11:10:38
 *
 *  单例
 *
 *  @return RequestHelper
 */
+(RequestHelper *) sharedInstance;

#pragma mark -
#pragma mark 根据服务编号、内容、委托发送数据请求-Post
-(void)postRequest:(NSString *)serviceMethod
        jsonDictionary:(NSDictionary *)dictionary;

#pragma mark -
#pragma mark 根据服务编号、内容、委托发送数据请求-Get
-(void)getRequest:(NSString *)serviceMethod;

#pragma mark - 检测网络连接
- (void)reach;

#pragma mark - Session 下载
- (void)sessionDownload:(NSString *)urlString;

#pragma mark - POST上传
- (void)postUpload:(NSString *)urlString filename:(NSString *)filename;
@end
