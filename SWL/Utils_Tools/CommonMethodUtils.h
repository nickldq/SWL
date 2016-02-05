//
//  CommonMethodUtils.h
//  Ocj
//
//  Created by ocj ocjwork on 12-10-29.
//  Copyright 2012年 ocj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonMethodUtils : NSObject
{ 
}
@property (strong, nonatomic)NSString *firstRequestTime;

//+(UILabel *)createNavTitle:(NSString *)titleStr;

/**
 *  @Author Liudongqi, 14-10-16 11:10:44
 *
 *  创建一个返回按钮
 *
 *  @param view VC4
 *
 *  @return UIBarButtonItem
 */
 + (UIBarButtonItem*) createBackButton:(UIViewController *)view;

/**
 *  @Author Liudongqi, 14-10-16 11:10:00
 *
 *  是一个view边框变成圆角矩形
 *
 *  @param view
 */
+(void)makeViewRoundRectBorder:(UIView *)view;
+ (void)dropShadowAndRoundRect:(UIView *)view;

/**
 *  @Author Liudongqi, 14-10-16 11:10:21
 *
 *  获取一个view的父view
 *
 *  @param myclass 类名
 *  @param child   child-view
 *  
 *  @return superview-UIView
 */

+ (UIView*)superviewWithClass:(Class)myclass child:(UIView*)child;
 
/**
 *  @Author Liudongqi, 14-11-07 11:11:48
 *
 *  @brief  获取一个view的父viewController
 *
 *  @param view child-view
 *
 *  @return superviewcontroller
 *
 *  @since 1.0
 */
+ (UIViewController *)superViewControllerByView:(UIView *)view;
+(NSString *)getAppVersion;

/**
 *  @Author Liudongqi, 14-10-16 11:10:45
 *
 *  获取appdelegate中的mainWindow
 *
 *  @return UIWindow
 */
+ (UIWindow *)mainWindow;

#pragma mark URLEncoding相关
/**
 *  @Author Liudongqi, 14-10-16 11:10:18
 *
 *  NSString装换成URLEncoding(百分号格式)-不包括&符号
 *
 *  @param input
 *
 *  @return URLEncodingString
 */
+(NSString *)encodeToPercentEscapeString:(NSString *)input;

/**
 *  @Author Liudongqi, 14-10-16 11:10:45
 *
 *  NSString装换成URLEncoding(百分号格式)-包括&符号
 *
 *  @param input
 *
 *  @return URLEncodingString
 */
+(NSString *)encodeToPercentEscapeStringWithAndSymbol:(NSString *)input;

/**
 *  @Author Liudongqi, 14-10-16 11:10:30
 *
 *  URLEncoding转成标准String
 *
 *  @param input URLEncodingString
 *
 *  @return NSString
 */
+(NSString *)decodeToPercentEscapeString:(NSString *)input;

//+(BOOL)isNull:(id)object;

/**
 *  @Author Liudongqi, 14-10-16 11:10:56
 *
 *  通过字体大小、文字、最大宽度取指定size
 *
 *  @param fontSize 字体大小
 *  @param str      文字
 *  @param max      最大宽度
 *
 *  @return CGSize
 */
+(CGSize)sizeWithFont:(float)fontSize ByString:(NSString *)str maxWidth:(float)max;

/**
 *  @Author Liudongqi, 14-10-16 11:10:27
 *
 *  获取设备类型
 *
 *  @return NSString
 */
+(NSString*) doDevicePlatform;

/**
 *  @Author Liudongqi, 14-10-16 11:10:36
 *
 *  检测是否有更新
 *
 *  @param appInfo  
 *  @param delegate UIAlertView的delegate
 *
 *  @return str--更新信息
 */
+(NSString *)checkAppUpdate:(NSString *)appInfo delegate:(id)delegate;

/**
 *  @Author Liudongqi, 14-10-16 11:10:55
 *
 *  通过UIView去找所在的UIViewController
 *
 *  @param v UIView
 *
 *  @return UIViewController
 */
+ (UIViewController *)findviewController:(UIView *)v;

/**
 *  @Author Liudongqi, 14-10-16 11:10:22
 *
 *  数组排序
 *
 *  @param keystring   关键字
 *  @param isAscending 升序-YES/降序-NO
 *  @param sourceArray 原数组
 *
 *  @return NSMutableArray-新数组
 */
+(NSMutableArray *)startArraySort:(NSString *)keystring isAscending:(BOOL)isAscending usingsourceArray:(NSMutableArray *)sourceArray;

/**
 *  @Author Liudongqi, 14-10-16 11:10:23
 *
 *  将汉字全角标点符号转成英文半角标点
 *
 *  @param str
 *
 *  @return NSString
 */
+(NSString*)convertChineseinterpunctionToEnglishinterpunction:(NSString*)str;

//验证数字
+(BOOL) validateNumber:(NSString *)number textString:(NSString*)textString;
@end
