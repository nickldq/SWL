//
//  UtilRequestService.h
//  SouthMedia
//
//  Created by Liudq on 14-7-31.
//  Copyright (c) 2014年 pandoranews. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilRequestService : NSObject

/**
 *  @Author Liudongqi, 14-10-16 11:10:56
 *
 *  通过新浪短域名接口 获取到一串URL的短域名
 *
 *  @param longUrl NSString
 *
 *  @return NSString
 */
+(NSString *)sendSinaShortURLRequest:(NSString *)longUrl;
@end
