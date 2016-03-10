//
//  TimeDateUtils.h
//  
//
//  Created by Liudongqi on 14-10-11.
//  Copyright 2014 __KY__. All rights reserved.
//hexadecimal 十六进制

#import <Foundation/Foundation.h>


@interface TimeDateUtils : NSObject {

}

#pragma mark 获取系统时间 格式:HH:mm
+(NSString *)getSystemTimeByFormatterHHmm;

#pragma mark 比较两个时间
/**
 *@param  nowDate
 *@param  beforeDate
 *
 *@return NSString
 */
+ (NSString *)intervalBetweenNow: (NSString *) nowDate andBefore: (NSString *) beforeDate;

#pragma mark 获取系统时间 格式:yyyy-MM-dd HH:mm:ss
/**
 *  @Author Liudongqi, 14-10-16 11:10:44
 *
 *  获取系统时间
 *
 *  @return YYYYMMdd
 */
+(NSString *)getSystemTimeByFormatterYYYYMMdd;

#pragma mark 获取时间 格式:yyyy-MM-dd HH:mm:ss
/**
 *  @Author Liudongqi, 14-10-16 11:10:01
 *
 *  通过秒数获取时间格式yyyyMMddHHmmss
 *
 *  @param string <#string description#>
 *
 *  @return yyyyMMddHHmmss
 */
+(NSString *)getTimeBySecond:(NSString *)string;

#pragma mark 转换NSString格式:yyyy-MM-dd HH:mm:ss 成NSDate
+(NSDate *) stringToDate:(NSString *)string;

#pragma mark 比较两个时间 返回 天数
/**
 *@param  startDate
 *@param  endDate
 *
 *@return NSInteger
 */
+(NSInteger)daysWithinEraFromDate:(NSDate *) startDate toDate:(NSDate *) endDate;

@end
