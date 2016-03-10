//
//  GetCityShopService.h
//
//  Created by Liudq on 14-6-9.


#import <Foundation/Foundation.h>
#import "RequestHelper.h"
#import "RequestSeviceCommon.h"

@interface GetCityShopService : RequestSeviceCommon

@property (nonatomic, strong) id delegate;

+(GetCityShopService *) sharedInstance;

#pragma mark 获取地区接口
- (void)getAllCityRequestService:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;


#pragma mark 获取门店名称接口
- (void)getAllShopByCityRequestService:(NSString *)cityName success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
