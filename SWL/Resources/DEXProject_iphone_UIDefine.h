//
//  DEXProject_iphone_UIDefine.h
//  DEXProject_iphone
//
//  Created by Liudq on 15/11/14.
//  Copyright (c) 2015年 BlueMobile. All rights reserved.
//

#ifndef DEXProject_iphone_DEXProject_iphone_UIDefine_h
#define DEXProject_iphone_DEXProject_iphone_UIDefine_h


#define TableViewCell_Background_color [UIColor whiteColor]
#define View_Background_color DEF_COLOR(237, 237, 237)


// Include any system framework and library headers here that should be included in all compilation units.
// You will also need to set the Prefix Header build setting of one or more of your targets to reference this file.
//是否为iphone4
#define IS_IPHONE_4 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )480 ) < DBL_EPSILON )

//是否为iphone5
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

//是否为iphone6
#define IS_IPHONE_6 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )667 ) < DBL_EPSILON )

//是否为iphone6Plus
#define IS_IPHONE_6PLUS ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )736 ) < DBL_EPSILON )

//获取屏幕宽度
#define KScreenWidth  [UIScreen mainScreen].bounds.size.width
//获取屏幕高度
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

//左边tabbar的宽度
#define KTabbarWidth  [UIScreen mainScreen].bounds.size.width*3/4

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#define DEFAULT_bg_COLOR [UIColor colorWithRed:23/255.f green:23/255.f blue:23/255.f alpha:1]

//tableview的背景线颜色
#define DEFAULT_Line_COLOR UIColorFromRGB(0xd3e4e8)

#endif
