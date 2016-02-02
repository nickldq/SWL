//
//  XSControl.h
//  Babylon
//
//  Created by fx on 14-2-29.
//  Copyright (c) 2014年 FS. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  @brief 常用的一些公用方法的类
 */
@interface BMUtil : NSObject

/**
 *  @brief 获取当前程序的Doc目录
 *
 *  @return 是否成功获取
 */
+ (NSString *) appDirDoc;

/**
 *  @brief 是否是ios7
 *
 *  @return 是否是ios7
 */
+(BOOL)isIOS7;

/**
 *  @brief 文件大小显示格式化
 *
 *  @param longsize 文件大小
 *
 *  @return 格式化后的文件大小显示
 */
+(NSString*)convertByteDisplay:(unsigned long long)longsize;

/**
 *  @brief NSString 转换为 NSData
 *
 *  @param dateString 以string显示的时间
 *
 *  @return 转换后的NSData
 */
+ (NSDate *)dateFromString:(NSString *)dateString;

/**
 *  @brief NSData  转换为 NSString
 *
 *  @param date显示的时间
 *
 *  @return 转换后的date
 */
+(NSString *)stringFromDate:(NSDate *)date;

/**
 *  @brief 图片圆化
 *
 *  @param image 输入图片
 *  @param inset 圆化大小
 *
 *  @return 圆化后的图片
 */
+(UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset;


/**
 *  @brief 移除文件后缀
 *
 *  @param filePath 文件名或文件path
 *
 *  @return 文件名
 */
+(NSString*)removeFileSuffix:(NSString*)filePath;

/**
 *  @brief 检查对象是否为nsnull
 *
 *  @param obj 输入对象
 *
 *  @return 输出对象
 */
+(id)checkNSNull:(id)obj;

/**
 *  @brief 把int 转换为星期
 *
 *  @param wk 输入星期几int 类型
 *
 *  @return 格式化的星期几
 */
+(NSString*)GetConvertWeek:(int)wk;



/**
 *  @brief 转化月份
 *
 *  @param month 输入月份
 *
 *  @return 输入英文月份
 */
+(NSString*)GetConvertmonth:(NSString*)month;




















/**
 *  @brief 
 *
 *  @param name <#name description#>
 *
 *  @return <#return value description#>
 */
+(bool)checkDevice:(NSString*)name;



/**
 *  @brief 获取当前的日期的月份
 *
 *  @param date 当前输入日期
 *
 *  @return 返回输入月份
 */
+(NSInteger)getMonth:(NSDate*)date;


///返回日期星期几

/**
 *  @brief 返回日期星期几
 *
 *  @param date 输入日期
 *
 *  @return 返回星期几
 */
+(NSString*)getDateWeekStr:(NSDate*)date;


/**
 *  @brief 返回时间 格式为 "HH:mm"
 *
 *  @param date 输入日期
 *
 *  @return 输出时间
 */
+(NSString*)getTime:(NSDate*)date;


+(NSString*)createFloder:(NSString*)folderName;
+(NSString*)getFilePath:(NSString*)foldername
               fileName:(NSString*)filename;

+(NSString*)gen_uuid;
@end
