//
//  GetCityShopService.m
//
//  Created by Liudq on 14-6-9.
//

#import "GetCityShopService.h"

@implementation GetCityShopService

static GetCityShopService *sharedInstance = nil;
+ (GetCityShopService *)sharedInstance
{
    @synchronized(self) {
        if (!sharedInstance) {
            sharedInstance = [[GetCityShopService alloc]init];
            RequestHelper *tempRequest = [RequestHelper sharedInstance];
            sharedInstance.requestHelper = tempRequest;
        }
        
        sharedInstance.requestHelper.delegate = self;
        return sharedInstance;
    }}


#pragma mark 获取地区接口
- (void)getAllCityRequestService:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        NSString *urlString = [NSString stringWithFormat:@"%@/%@",REQUEST_PATH , PHP_GetAllCity];
        
        [manager POST:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            NSLog(@"Success: %@", responseObject);
            success(responseObject);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"Error: %@", error);
            failure(error);
        }];
}


#pragma mark 获取门店名称接口
- (void)getAllShopByCityRequestService:(NSString *)cityName success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        
        NSString *urlString = [[NSString stringWithFormat:@"%@/%@%@",REQUEST_PATH , PHP_GetAllShopByCity, cityName] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [manager POST:urlString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            NSLog(@"Success: %@", responseObject);
            success(responseObject);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"Error: %@", error);
            failure(error);
        }];
}


-(void)dealloc{
    self.requestHelper.delegate = nil;
    self.requestHelper = nil;
}

@end