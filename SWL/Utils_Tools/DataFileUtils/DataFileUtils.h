//
//  DataFileUtils
//  
//
//  Created by Liudongqi on 14-10-11.
//  Copyright 2014 __KY__. All rights reserved.
//hexadecimal 十六进制

#import <Foundation/Foundation.h>


@interface DataFileUtils : NSObject {

}

#pragma mark - 应用首次启动
/**
 *@param  fileName
 *
 *@return void
 */
+(BOOL)isFirstOpen:(NSString *)fileName;

#pragma mark 判断文件是否存在
/**
 *@param  (NSString *)fileName
 *
 *@return BOOL
 */
+(void)firstOpened:(NSString *)fileName;

#pragma mark 返回默认NSDocumentDirectory的完成路径
/**
 *@param  (NSString *)fileName
 *
 *@return NSString
 */
+(NSString *)dataFilePathWithFileName:(NSString *)fileName;

#pragma mark - 保存图片
/**
 *@param  (UIImage *)image //保存的图片
 *
 *@param  (NSString *)imageName //保存为的图片名
 *
 *@return void
 */
+(void) saveImage:(UIImage *)image withFileName:(NSString *)imageName;
+(void) saveDataFile:(NSData *)data withFileName:(NSString *)fileName;

#pragma mark - 通过路径打开图片
/**
 *@param  (NSString *)fileName //图片文件名
 *
 *@return UIImage
 */
+(UIImage *) loadImage:(NSString *)fileName;
+(NSString *) loadFile:(NSString *)fileName;

#pragma mark -通过路径返回URL
/**
 *@param  (NSString *)fileName
 *
 *@return NSString
 */
+ (NSURL *) fileToURL:(NSString *)filename;
@end
