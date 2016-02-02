//
//  ProgressHUDUtils
//  
//
//  Created by Liudongqi on 14-10-11.
//  Copyright 2014 __KY__. All rights reserved.
//hexadecimal 十六进制

#import <Foundation/Foundation.h>


@interface ProgressHUDUtils : NSObject {

}

/**
 *  @Author Liudongqi, 14-10-16 11:10:37
 *
 *  显示"✔️"的文字提示框
 *
 *  @param string 想要提示的文字
 */
+(void)showSuccessLoading:(NSString *)string;

/**
 *  @Author Liudongqi, 14-10-16 11:10:28
 *
 *  显示"❌"的文字提示框
 *
 *  @param string 想要提示的文字
 */
+(void)showErrorLoading:(NSString *)string;

#pragma mark - show LoadingHUD

/**
 *  @Author Liudongqi, 14-10-16 11:10:58
 *
 *  只显示文字的提示框
 *
 *  @param String 想要提示的文字
 */
+(void)showProgressHUDWithStatus:(NSString *)String;


#pragma mark -
#pragma mark Dismiss Methods Sample

/**
 *  @Author Liudongqi, 14-10-16 11:10:22
 *
 *  里面使提示框消失
 */
+(void)dismissProgressImmediately;

/**
 *  @Author Liudongqi, 14-10-16 11:10:39
 *
 *  显示"✔️"后几秒内消失
 */
+(void)dismissProgressHUDSuccess;

/**
 *  @Author Liudongqi, 14-10-16 11:10:39
 *
 *  显示"❌"后几秒内消失
 */
+(void)dismissProgressHUDError;

/**
 *  @Author Liudongqi, 14-10-16 11:10:18
 *
 *  显示"✔️"并显示提示文字后, 几秒内消失
 *
 *  @param String 提示文字
 */
+(void)dismissProgressHUDSuccessWithStatus:(NSString *)String;

/**
 *  @Author Liudongqi, 14-10-16 11:10:38
 *
 *  显示"❌"并显示提示文字后, 几秒内消失
 *
 *  @param String 提示文字
 */
+(void)dismissProgressHUDErrorWithStatus:(NSString *)String;


@end
