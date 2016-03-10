//
//  MainRequestService.m
//  SouthMedia
//
//  Created by Liudq on 14-6-9.
//  Copyright (c) 2014年 pandoranews. All rights reserved.
//

#import "MainRequestService.h"

@implementation MainRequestService

static MainRequestService *sharedInstance = nil;
+ (MainRequestService *)sharedInstance
{
    @synchronized(self) {
        if (!sharedInstance) {
            sharedInstance = [[MainRequestService alloc]init];
            RequestHelper *tempRequest = [RequestHelper sharedInstance];
            sharedInstance.requestHelper = tempRequest;
        }
        
        sharedInstance.requestHelper.delegate = self;
        return sharedInstance;
    }
}

- (void)getMainDataRequestSeviceByBlock:(int)block
{
    NSString *urlStr = [NSString stringWithFormat:@"%d", block];
    
    self.requestHelper.delegate = self;
    [self.requestHelper setRequestFinishedSelector:@selector(getMainDataFinished:)];
    [self.requestHelper setRequestFailedSelector:@selector(getMainDataFailed:)];
//    [self.requestHelper sendRequest:urlStr requestMethod:kRequestMethodGet];
}

#pragma mark 获得所有栏目列表成功

/**
 *  getMainDataFinished:
 *
 *    用到的 Model
 *    RootViewModel.h
 *    ArticleModel.h
 *    ArticleBlockModel.h
 *  @param body  (json Dictionary)
 */
- (void)getMainDataFinished:(NSDictionary *)body
{
    if (body.count > 0) {
            if (_delegate && [_delegate respondsToSelector:@selector(getMainDataFailed:)]) {
                [_delegate performSelector:@selector(getMainDataFailed:) withObject:body];
            }
    } else {
        if (_delegate && [_delegate respondsToSelector:@selector(getMainDataFailed:)]) {
            [_delegate performSelector:@selector(getMainDataFailed:) withObject:body];
        }
    }
}

#pragma mark 获得所有栏目列表失败

- (void)getMainDataFailed:(NSDictionary *)body
{
    if (body.count > 0) {
            if (_delegate && [_delegate respondsToSelector:@selector(getMainDataFailed:)]) {
                [_delegate performSelector:@selector(getMainDataFailed:) withObject:body];
            }
    } else {
        if (_delegate && [_delegate respondsToSelector:@selector(getMainDataFailed:)]) {
            [_delegate performSelector:@selector(getMainDataFailed:) withObject:body];
        }
    }
}


-(void)dealloc{
	self.requestHelper.delegate = nil;
	self.requestHelper = nil;
}

@end