//
//  XSControl.h
//  Babylon
//
//  Created by fx on 14-2-29.
//  Copyright (c) 2014年 FS. All rights reserved.
//

#import "BMUtil.h"

@implementation BMUtil

/**
 *check NSNULL返回id
 */
+(id)checkNSNull:(id)obj{
    if (obj == [NSNull null])
        obj=nil;
    return obj;
}

//字符串转北京时间
+(NSDate *)dateFromString:(NSString *)dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    NSTimeInterval secondsPerDay1 = 8*60*60;
    NSDate*locationDate=[destDate dateByAddingTimeInterval:secondsPerDay1];
    return locationDate;
}

+ (NSString *) appDirDoc
{
    static NSString *dirStr = nil;
    if (dirStr == nil) {
        dirStr = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    }
    return dirStr;
}

+(BOOL)isIOS7 {
    return NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1;
}


+ (NSString *)stringFromDate:(NSDate *)date
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    
    NSString *destDateString = [dateFormatter stringFromDate:date];

    return destDateString;
    
}

#pragma mark 把数字转换为星期
+(NSString*)GetConvertWeek:(int)wk
{
    NSString*strweek=@"";
    switch (wk) {
        case 0:
            strweek=@"周六";
            break;
        case 1:
            strweek=@"周日";
            break;
        case 2:
            strweek=@"周一";
            break;
        case 3:
            strweek=@"周二";
            break;
        case 4:
            strweek=@"周三";
            break;
        case 5:
            strweek=@"周四";
            break;
        case 6:
            strweek=@"周五";
            break;
        default:
            strweek=@"日期异常";
            break;
    }
    return strweek;
}

#pragma mark 把月份英文的字符转换为数字
+(NSString*)GetConvertmonth:(NSString*)month
{
    NSString* months=0;
    if([month isEqualToString:@"Jan"])
    {
        months=@"01";
    }else if([month isEqualToString:@"Feb"])
    {
        months=@"02";
    }else if([month isEqualToString:@"Mar"])
    {
        months=@"03";
    }else if([month isEqualToString:@"Apr"])
    {
        months=@"04";
    }else if([month isEqualToString:@"May"])
    {
        months=@"05";
    }else if([month isEqualToString:@"Jun"])
    {
        months=@"06";
    }else if([month isEqualToString:@"Jul"])
    {
        months=@"07";
    }else if([month isEqualToString:@"Aug"])
    {
        months=@"08";
    }else if([month isEqualToString:@"Sep"])
    {
        months=@"09";
    }else if([month isEqualToString:@"Oct"])
    {
        months=@"10";
    }else if([month isEqualToString:@"Nov"])
    {
        months=@"11";
    }else if([month isEqualToString:@"Dec"])
    {
        months=@"12";
    }
    return months;
}


+(NSString*)convertByteDisplay:(unsigned long long)longsize
{
    const double intStandard=1024;
    NSArray *array=[[NSArray alloc]initWithObjects:@"B",@"KB",@"M",@"G",@"TG",nil];
    
    double dbsize=longsize;
    int count=0;
    while (dbsize>=intStandard)
    {
    	dbsize=dbsize/intStandard;
    	count++;
    }
    [array objectAtIndex:count];
    if (count>[array count])
    {
        return @"To big";
    }
    NSString* strResult=[[NSString alloc] initWithFormat:@"%0.2f%@",dbsize,[array objectAtIndex:count]] ;
    return strResult;
    
}







+(UIActivityIndicatorView*) buildUIActivityIndicatorView:(UIView*)view
{
    UIActivityIndicatorView* activityIndicatorView=
    [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    
    
    //创建一个UIActivityIndicatorView对象：_activityIndicatorView，并初始化风格。
    activityIndicatorView.frame = CGRectMake(160, 230, 0, 0);
    //设置对象的位置，大小是固定不变的。WhiteLarge为37 * 37，White为20 * 20
    activityIndicatorView.color = [UIColor blackColor];
    //设置活动指示器的颜色
    activityIndicatorView.hidesWhenStopped = NO;
    //hidesWhenStopped默认为YES，会隐藏活动指示器。要改为NO
    [view addSubview:activityIndicatorView];
    
    return activityIndicatorView;
    
}



+(NSString*)removeFileSuffix:(NSString*)filePath
{
    NSString * fileName;//文件名
    NSRange range = [filePath rangeOfString:@"." options:NSBackwardsSearch];
    if (range.length>0)
        fileName=[filePath substringToIndex:NSMaxRange(range)];
    return fileName;
}
























+(UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset {
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset * 2.0f, image.size.height - inset * 2.0f);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}







#pragma mark 检测设备名
+(bool)checkDevice:(NSString*)name
{
    NSString* deviceType = [UIDevice currentDevice].model;
//    NSLog(@"deviceType = %@", deviceType);
    
    NSRange range = [deviceType rangeOfString:name];
    return range.location != NSNotFound;
}




+(NSInteger)getMonth:(NSDate*)date;
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
    
//    NSInteger day = [components day];
    
    NSInteger month= [components month];
    
//    NSInteger year= [components year];
    return month;
}





///返回日期星期几
+(NSString*)getDateWeekStr:(NSDate*)date
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSWeekdayCalendarUnit fromDate:date];
    
//    NSInteger day = [components day];
    
    NSInteger weekday= [components weekday];
    
    //    NSInteger year= [components year];
    
    NSString *weekStr=@"";
    switch (weekday) {
        case 1:
            weekStr=@"日";
            break;
        case 2:
            weekStr=@"一";
            break;
        case 3:
            weekStr=@"二";
            break;
        case 4:
            weekStr=@"三";
            break;
        case 5:
            weekStr=@"四";
            break;
        case 6:
            weekStr=@"五";
            break;
        case 7:
            weekStr=@"六";
            break;

        default:
            break;
    }
    NSString *strDate=[NSString stringWithFormat:@"星期%@",weekStr];
    
    
    return strDate;
}

//返回时间
+(NSString*)getTime:(NSDate*)date
{
    NSDateFormatter *df=[[NSDateFormatter alloc] init];
    [df setDateFormat:@"HH:mm"];
    
    return  [df stringFromDate:date];
   
}

#define DocumentsDir [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) lastObject]

+(NSString*)createFloder:(NSString*)folderName
{
//    NSString *urlStr = [baseparam.paramDic objectForKey:ksourceUrl];
//    NSString *folderName=[baseparam.paramDic objectForKey:kFolderName];
//    NSString *fileName=[baseparam.paramDic objectForKey:kFileName];
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    //创建文件夹
    folderName=[DocumentsDir stringByAppendingPathComponent:folderName];
    BOOL isDir = NO;
    
    BOOL existed = [fileManager fileExistsAtPath:folderName isDirectory:&isDir];
    if ( !(isDir == YES && existed == YES) )
    {
        [fileManager createDirectoryAtPath:folderName withIntermediateDirectories:YES attributes:nil error:nil];
    }
//    NSString *strTargetPath =[folderName stringByAppendingPathComponent:fileName];
    return folderName;
}

+(NSString*)getFilePath:(NSString*)foldername
          fileName:(NSString*)filename
{
    foldername = [BMUtil createFloder:foldername];
    NSString *strTargetPath =[foldername stringByAppendingPathComponent:filename];
    return strTargetPath;
}


+(NSString*)gen_uuid
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    CFRelease(uuid_string_ref);
    return uuid;
}
@end
