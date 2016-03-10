//
//  ProgressViewUtils
//  
//
//  Created by Liudongqi on 14-10-11.
//  Copyright 2014 __KY__. All rights reserved.
//hexadecimal 十六进制

#import <Foundation/Foundation.h>
#import "CalendarHomeViewController.h"

@interface ProgressViewUtils : NSObject {

}

/**
 *  @author Liudongqi, 14-11-20 15:11:21
 *
 *  @brief 跳转至日历选择页面
 *
 *  @param day           从当天开始限制的天数
 *  @param todate        目标日期
 *  @param title         标题栏题目
 *  @param vc            传入的ViewController
 *  @param calendarblock 回调block
 *
 *  @since V1.0
 */
+(void)getCalWithDaysNumber:(int)day ToDateforString:(NSString *)todate titleString:(NSString *)title viewController:(UIViewController *)vc withCompletion:(CalendarBlock)calendarblock;

@end
