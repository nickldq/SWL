//
//  ShareUploadRequestService.h
//
//  Created by Liudq on 14-6-9.


#import <Foundation/Foundation.h>
#import "RequestHelper.h"
#import "RequestSeviceCommon.h"
#import "ShareUserUploadModel.h"
#import "ShareUserResultModel.h"

/**
 *  @Author Liudongqi, 14-10-16 11:10:33
 *
 *  分享内容上传协议
 */
@protocol ShareUploadRequestServiceDelegete <NSObject>

/**
 *  @Author Liudongqi, 14-10-16 11:10:51
 *
 *  上传成功协议
 *
 *  @param body
 */
-(void)shareUploadFinished:(id)body;

/**
 *  @Author Liudongqi, 14-10-16 11:10:25
 *
 *  上传失败协议
 *
 *  @param body
 */
- (void)shareUploadFailed:(id)body;

@end

@interface ShareUploadRequestService : RequestSeviceCommon

@property (nonatomic, strong) id delegate;

+(ShareUploadRequestService *) sharedInstance;

#pragma mark 分享内容上传模块
- (void)shareUploadRequestServiceByShareModel:(ShareUserUploadModel *)shareModel
                          success:(void (^)(ShareUserResultModel *shareUserResultModel))success
                          failure:(void (^)(NSError *error))failure;

#pragma mark 分享内容上传模块 - 官方api
- (void)shareUploadRequestRestApiServiceByShareModel:(ShareUserUploadModel *)shareModel
                                      success:(void (^)(ShareUserResultModel *shareUserResultModel))success
                                      failure:(void (^)(NSError *error))failure;
@end
