//
//  BaseViewController.m
//  SWL
//
//  Copyright (c) 2016年. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

/**
 *  设置导航栏返回按钮
 */
-(void)setNavigationBack;

/**
 *  设置导航栏标题
 */
- (void)setNavigationTitle:(NSString *)title;

@end
