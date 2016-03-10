//
//  CalendarSelectUtils
//  
//
//  Created by Liudongqi on 14-10-11.
//  Copyright 2014 __KY__. All rights reserved.
//hexadecimal 十六进制

#import <Foundation/Foundation.h>
#import "CalendarHomeViewController.h"
#import "RMDateSelectionViewController.h"

@interface CalendarSelectUtils : NSObject {

}

/**
 *  @author Liudongqi, 14-11-20 16:11:23
 *
 *  @brief  跳转至日历选择页面,并通过点击返回年月日
 *
 *  @param day    从当日起限制的日期
 *  @param todate 目标日期
 *  @param title  标题
 *  @param vc     viewController
 *  @param block  回调block 用预处理返回后的数据
 *
 *  @since V1.0
 */
+(void)getCalByCalenderViewWithDaysNumber:(int)day ToDateforString:(NSString *)todate titleString:(NSString *)title viewController:(UIViewController *)vc complete:(CalendarBlock)block; 

/**
 *  @author Liudongqi, 14-11-21 14:11:32
 *
 *  @brief  弹出日历选择 datepicker
 *  @brief  用到该方法的类需要继承RMDateSelectionViewControllerDelegate
 *
 *  @param vc         传入的当前viewController
 *  @param bouncingON 回弹效果
 *  @param motionON   玻璃特效
 *  @param blurON     半透明特效(ios8)
 *  @param blackON    黑色背景
 *  @param date       当前日期
 *
 *  @since V1.0
 */
+(void)getCalByPickerView:(UIViewController<RMDateSelectionViewControllerDelegate> *)vc disableBouncingWhenShowing:(BOOL)bouncingON disableMotionEffects:(BOOL)motionON disableBlurEffects:(BOOL)blurON disableblackEffects:(BOOL)blackON currentDate:(NSDate *)date;
@end
