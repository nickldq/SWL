//
//  XSColor

//
//  Created by fx on 14-2-29.
//  Copyright (c) 2014年 FS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMDefine.h"
/**
 *  常用的Color类
 */
@interface BMColor : NSObject
/**
 *  单例类的定义调用
 */
AS_SINGLETON(BMColor)

/**
 *  颜色为navBackgroundColor
 */
@property (nonatomic, strong) UIColor *navBackgroundColor;

/**
 *  颜色为viewBackgroundColor
 */
@property (nonatomic, strong) UIColor *viewBackgroundColor;

/**
 *  颜色为tabbarBackgroundColor
 */
@property (nonatomic, strong) UIColor *tabbarBackgroundColor;

/**
 *  颜色为tabbarBackgroundColor
 */
@property (nonatomic, strong) UIColor *titleColor;
/**
 *  颜色为magicMint
 */
@property (nonatomic, strong) UIColor *magicMint;
/**
 *  颜色为midnightBlue
 */
@property (nonatomic, strong) UIColor *midnightBlue;
/**
 *  颜色为orangeRed
 */
@property (nonatomic, strong) UIColor *orangeRed;
/**
 *  颜色为caribbeanGreen
 */
@property (nonatomic, strong) UIColor *caribbeanGreen;
/**
 *  颜色为desertSand
 */
@property (nonatomic, strong) UIColor *desertSand;
/**
 *  颜色为purpleHeart
 */
@property (nonatomic, strong) UIColor *purpleHeart;
/**
 *  颜色为black
 */
@property (nonatomic, strong) UIColor *black;
/**
 *  颜色为white
 */
@property (nonatomic, strong) UIColor *white;
/**
 *  颜色为blue
 */
@property (nonatomic, strong) UIColor *blue;
/**
 *  颜色为green
 */
@property (nonatomic, strong) UIColor *green;
/**
 *  颜色为red
 */
@property (nonatomic, strong) UIColor *red;
/**
 *  颜色为clear
 */
@property (nonatomic, strong) UIColor *clear;
/**
 *  颜色为silver
 */
@property (nonatomic, strong) UIColor *silver;
/**
 *  颜色为gray
 */
@property (nonatomic, strong) UIColor *gray;
/**
 *  颜色为darkGray
 */
@property (nonatomic, strong) UIColor *darkGray;
/**
 *  颜色为lightGray
 */
@property (nonatomic, strong) UIColor *lightGray;
/**
 *  颜色为lightGreen
 */
@property (nonatomic, strong) UIColor *lightGreen;
/**
 *  颜色为defaultGreen
 */
@property (nonatomic, strong) UIColor *defaultGreen;
/**
 *  颜色为themeRed
 */
@property (nonatomic, strong) UIColor *themeRed;
/**
 *  颜色为themeYellowWhite
 */
@property (nonatomic, strong) UIColor *themeYellowWhite;

/**
 *  颜色为themeTop
 */
@property (nonatomic, strong) UIColor *themeGuideTop;

/**
 *  颜色为themeShallowRed
 */
@property (nonatomic, strong) UIColor *themeShallowRed;

/**
 *  颜色为咪我宝主要的橙色
 */
@property (nonatomic, strong) UIColor *themeMWBColor;

@end

/**
 *  定义单例类
 */
#define SharedColor  ([BMColor sharedInstance])
