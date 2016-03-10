//
//  DataFileUtils
//
//  Created by Liudq on 14-10-11.
//  Copyright 2014 _KY_. All rights reserved.
//

#import "DataFileUtils.h"
 
@implementation DataFileUtils

#pragma mark - 应用首次启动
/**
 *@param  fileName
 *
 *@return void
 */
+(void)firstOpened:(NSString *)fileName{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *DocumentDirectory = [paths objectAtIndex:0];
    [fileManager changeCurrentDirectoryPath:[DocumentDirectory stringByExpandingTildeInPath]];
    [fileManager removeItemAtPath:fileName error:nil];
    NSString *path = [DocumentDirectory stringByAppendingPathComponent:fileName];
    NSMutableData  *writer = [[NSMutableData alloc] init];
    [writer appendData:nil];
    [writer writeToFile:path atomically:YES];
}

#pragma mark 判断文件是否存在
/**
 *@param  (NSString *)fileName
 *
 *@return BOOL
 */
+(BOOL)isFirstOpen:(NSString *)fileName{//判断文件是否存在
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSCachesDirectory,  NSUserDomainMask,  YES) ;
    NSString *documentsDirectory =  [paths objectAtIndex:0] ;
    NSString *file = [documentsDirectory stringByAppendingPathComponent:fileName] ;
    if ([[NSFileManager defaultManager]  fileExistsAtPath:file]) {
        return NO ;
    }
    return YES ;
}

#pragma mark 返回默认NSDocumentDirectory的完成路径
/**
 *@param  (NSString *)fileName
 *
 *@return NSString
 */
+(NSString *)dataFilePathWithFileName:(NSString *)fileName {
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *DocumentDirectory = [paths objectAtIndex:0];
    NSString *path = [DocumentDirectory stringByAppendingPathComponent:fileName];
    return path;
}

#pragma mark - 打开图片文件
/**
 *@param  (NSString *)fileName
 *
 *@param  (NSString *)extension //扩展名
 *
 *@param  (NSString *)directoryPath //路径
 *
 *@return NSString
 */
+(UIImage *) loadImage:(NSString *)fileName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    UIImage * result = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.%@", directoryPath, fileName, extension]];
    return result;
}

#pragma mark - 保存图片
/**
 *@param  (UIImage *)image //保存的图片
 *
 *@param  (NSString *)imageName //保存为的图片名
 *
 *@return void
 */
+(void) saveImage:(UIImage *)image withFileName:(NSString *)imageName{
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *directoryPath = [paths objectAtIndex:0];
    //    directoryPath = [directoryPath stringByAppendingPathComponent:@"images"];
    if ([imageName.lowercaseString rangeOfString:@"png"].location != NSNotFound) {
        [UIImagePNGRepresentation(image) writeToFile:[directoryPath stringByAppendingPathComponent:imageName] options:NSAtomicWrite error:nil];
    } else if ([imageName.lowercaseString rangeOfString:@"jpg"].location != NSNotFound || [imageName.lowercaseString rangeOfString:@"jpeg"].location != NSNotFound) {
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[directoryPath stringByAppendingPathComponent:imageName] options:NSAtomicWrite error:nil];
    } else {
        //ALog(@"Image Save Failed\nExtension: (%@) is not recognized, use (PNG/JPG)", extension);
        DLog(@"文件后缀不认识");
    }
}


+(void) saveDataFile:(NSData *)data withFileName:(NSString *)fileName{
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *directoryPath = [paths objectAtIndex:0];
    
    
    
    directoryPath = [directoryPath stringByAppendingPathComponent:fileName];
    
    NSFileManager* fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:directoryPath]) {
        [fm removeItemAtPath:directoryPath error:NULL];
    }
    
    [data writeToFile:directoryPath atomically:NO];
}

#pragma mark - 通过路径打开图片
/**
 *@param  (NSString *)fileName //图片文件名
 *
 *@return UIImage
 */
+(UIImage *) loadImage:(NSString *)fileName{
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *directoryPath = [paths objectAtIndex:0];
    directoryPath = [directoryPath stringByAppendingString:@"/images/"];
    UIImage * result = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", directoryPath, fileName]];
    return result;
}


+(NSString *) loadFile:(NSString *)fileName{
    BOOL a = [[NSFileManager defaultManager]fileExistsAtPath:fileName];
    NSData *data = [NSData dataWithContentsOfFile:fileName];
    NSString * result = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    return result;
}

+ (NSURL *) fileToURL:(NSString*)filename
{
    NSArray *fileComponents = [filename componentsSeparatedByString:@"."];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileComponents objectAtIndex:0] ofType:[fileComponents objectAtIndex:1]];
    
    return [NSURL fileURLWithPath:filePath];
}
@end
