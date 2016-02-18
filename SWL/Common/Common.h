//
//  Common.h
//  YMProject
//
//  Created by sam.l on 14-10-27.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject

//根据颜色生产图片
+ (UIImage *)createImageByColor:(UIColor *)color;

//check NSNULL返回id
+(id)checkNSNull:(id)obj;

//判断是否登录
+(BOOL)isLogin;

//计算文本长度
+(float)getNSStringWidth:(NSString*)str font:(UIFont*)theFont;

+  (int)convertToInt:(NSString*)strtemp;

//拼接请求字符串
+(NSString*)getURLParamstring:(NSString*)json;


//时间戳转换为时间格式
+(NSDate *)NSDateFromNSString:(NSString *)date;

//时间戳转换为字符串格式
+(NSString *)yearFromAPIDate:(NSString*)date;

+(NSString *)dataFromAPIDate:(NSString*)date;

//加水印
+(void)copyright:(UIView*)iv;

//创建提示框
+ (void)showAlertView:(id)sender hintText:(NSString *)hintText
            TitleText:(NSString *)titleText DetailText:(NSString *)detailText hasCancel:(BOOL)hasCancel ensureAction:(SEL)ensureAction;
/**
 *  创建半透明界面和提示框
 *
 *  @param height 提示框高度
 */
+(UIImageView *)createBackgroundViewWithHeight:(float)height andTitle:(NSString *)title;
/**
 *  创建一个button
 */
+ (UIButton *)createButtonWithTitle:(NSString *)title buttonTag:(int)tag andY:(float)y view:(UIView *)view;
@end
