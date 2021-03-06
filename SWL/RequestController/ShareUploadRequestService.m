//
//  ShareUploadRequestService.m
//
//  Created by Liudq on 14-6-9.
//

#import "ShareUploadRequestService.h"

@implementation ShareUploadRequestService

static ShareUploadRequestService *sharedInstance = nil;
+ (ShareUploadRequestService *)sharedInstance
{
    @synchronized(self) {
        if (!sharedInstance) {
            sharedInstance = [[ShareUploadRequestService alloc]init];
            RequestHelper *tempRequest = [RequestHelper sharedInstance];
            sharedInstance.requestHelper = tempRequest;
        }
        
        sharedInstance.requestHelper.delegate = self;
        return sharedInstance;
    }
}

#pragma mark 分享内容上传模块
- (void)shareUploadRequestServiceByShareModel:(ShareUserUploadModel *)shareModel
                                      success:(void (^)(ShareUserResultModel *shareUserResultModel))success
                                      failure:(void (^)(NSError *error))failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *parameters = [shareModel toDictionary];
    
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * locationString=[dateformatter stringFromDate:senddate];
    
    NSString *urlString = [[NSString stringWithFormat:@"%@/%@?%@",REQUEST_PATH , PHP_UPLOAD, [shareModel toURLParamString]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [manager POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:shareModel.imageFormKey name:@"imageFormKey" fileName:[NSString stringWithFormat:@"%@.jpg", locationString] mimeType:@"image/jpeg"];
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        DLog(@"Success: %@", responseObject);
        ShareUserResultModel *shareUserResultModel = [ShareUserResultModel new];
        [shareUserResultModel fromDic:(NSDictionary *)responseObject];
        success(shareUserResultModel);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        DLog(@"Error: %@", error);
        failure(error);
    }];
    
}

#pragma mark 分享内容上传模块 - 客户api
- (void)shareUploadRequestRestApiServiceByShareModel:(ShareUserUploadModel *)shareModel \
            success:(void (^)(ShareUserResultModel *shareUserResultModel))success \
            failure:(void (^)(NSError *error))failure{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *parameters = [shareModel toDictionary];
    
    //NSString *urlString = [NSString stringWithFormat:@"%@/%@",REQUEST_PATH_RestApi_TEST , Api_Certs_Create];
    NSString *urlString = [NSString stringWithFormat:@"%@/%@",REQUEST_PATH_RestApi , Api_Certs_Create];//正式
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
                
    [manager POST:urlString\
        parameters:parameters \
        constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                    
                }\
         progress:nil\
          success:^(NSURLSessionDataTask *task, id responseObject) {
              DLog(@"Success: %@", responseObject);
              NSHTTPURLResponse *r = (NSHTTPURLResponse *)task.response;
              DLog(@"StatusCode:%d" ,(int)[r statusCode]);
                    ShareUserResultModel *shareUserResultModel = [ShareUserResultModel new];
                    [shareUserResultModel fromRestApiDic:(NSDictionary *)responseObject];
              shareUserResultModel.status = [NSString stringWithFormat:@"%d", (int)[r statusCode]];
                    success(shareUserResultModel);
                }\
          failure:^(NSURLSessionDataTask *task, NSError *error) {
                    DLog(@"Error: %@", error);
                    failure(error);
                }];
    
}

-(void)dealloc{
    self.requestHelper.delegate = nil;
    self.requestHelper = nil;
}

@end