//
//  TimeDateUtils.m
//
//  Created by Liudq on 14-10-11.
//  Copyright 2014 _KY_. All rights reserved.
//

#import "TimeDateUtils.h"
 
@implementation TimeDateUtils

#pragma mark - 时间对比方法
#pragma mark 获取系统时间 格式:HH:mm:ss
+(NSString *)getSystemTimeByFormatterHHmm{
    //获得系统时间
    NSDate * senddate=[NSDate date];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"HH:mm:ss"];
    NSString * locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}

#pragma mark 比较两个时间
/**
 *@param  nowDate
 *@param  beforeDate
 *
 *@return NSString
 */
+ (NSString *)intervalBetweenNow: (NSString *) nowDate andBefore: (NSString *) beforeDate
{
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"HH:mm:ss"];
    NSDate *d=[date dateFromString:beforeDate];
    
    NSTimeInterval late=[d timeIntervalSince1970]*1;
    
    
    NSDate* dat = [date dateFromString:nowDate];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";
    
    NSTimeInterval cha=now-late;
    
    if (cha <= 120 ) {
        timeString = [NSString stringWithFormat:@"%f", cha];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@秒钟", timeString];
        
    }
    if (cha > 120 && cha/3600<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        timeString = [timeString substringToIndex:timeString.length-5];
        timeString=[NSString stringWithFormat:@"%@分钟", timeString];
        
    }
    if (cha/3600>1&&cha/86400<1) {
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        timeString = [timeString substringToIndex:timeString.length-7];
        timeString=[NSString stringWithFormat:@"%@小时", timeString];
    }
    //    if (cha/86400>1)
    //    {
    //        timeString = [NSString stringWithFormat:@"%f", cha/86400];
    //        //timeString = [timeString substringToIndex:timeString.length-7];
    //        timeString=[NSString stringWithFormat:@"%@天前", timeString];
    //
    //    }
    return timeString;
}

#pragma mark 获取系统时间 格式:yyyy-MM-dd HH:mm:ss
+(NSString *)getSystemTimeByFormatterYYYYMMdd{
    NSDate *dates = [NSDate date];
    NSDateFormatter *formatter =  [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/beijing"];
    [formatter setTimeZone:timeZone];
    NSString *loctime = [formatter stringFromDate:dates];
    return loctime;
}

#pragma mark 获取时间 格式:yyyy-MM-dd HH:mm:ss
+(NSString *)getTimeBySecond:(NSString *)string{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [inputFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSDate* inputDate = [inputFormatter dateFromString:string];
    DLog(@"date = %@", inputDate);
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setLocale:[NSLocale currentLocale]];
    [outputFormatter setDateFormat:@"yyyy年MM月dd日 HH时mm分ss秒"];
    NSString *str = [outputFormatter stringFromDate:inputDate];
    DLog(@"testDate:%@", str);
    return str;
}

#pragma mark 装换NSString格式:yyyy-MM-dd HH:mm:ss 成NSDate
+(NSDate *) stringToDate:(NSString *)string{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}

#pragma mark 比较两个时间 返回 天数
/**
 *@param  startDate
 *@param  endDate
 *
 *@return NSInteger
 */
+(NSInteger)daysWithinEraFromDate:(NSDate *) startDate toDate:(NSDate *) endDate
{
    int days = 0;
//    if(IOS8_OR_LATER){
//        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//        unsigned int unitFlags = NSCalendarUnitDay;
//        NSDateComponents *comps = [gregorian components:unitFlags fromDate:startDate  toDate:endDate  options:0];
//        days = (int)[comps day];
//    }else{ 
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        unsigned int unitFlags = NSDayCalendarUnit;
        NSDateComponents *comps = [gregorian components:unitFlags fromDate:startDate  toDate:endDate  options:0];
        days = [comps day];
//    }
    return days;
}


@end
