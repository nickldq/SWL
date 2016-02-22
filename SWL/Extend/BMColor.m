//
//  XSControl.h
//  Babylon
//
//  Created by fx on 14-2-29.
//  Copyright (c) 2014年 FS. All rights reserved.
//

#import "BMColor.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation BMColor
DEF_SINGLETON(BMColor)

- (id)init
{
    self = [super init];
    if (self) {
//        _magicMint = [UIColor colorWithCrayola:@"Magic Mint"];
//        _midnightBlue = [UIColor colorWithCrayola:@"Midnight Blue"];          
//        _orangeRed = [UIColor colorWithCrayola:@"Orange Red"];
//        _caribbeanGreen = [UIColor colorWithCrayola:@"Caribbean Green"];
//        _desertSand = [UIColor colorWithCrayola:@"Desert Sand"];
//        _purpleHeart = [UIColor colorWithCrayola:@"Purple Heart"];
        
        _black = [UIColor blackColor];
        _white = [UIColor whiteColor];
        _gray = [UIColor grayColor];
        _blue = [UIColor blueColor];
        _green = [UIColor greenColor];
        _red = [UIColor redColor];
        _clear = [UIColor clearColor];
        
//        _silver = [UIColor colorWithHexString:@"EFEFEF"];
        
        _darkGray = UIColorFromRGB(0x333333);
        _lightGray = UIColorFromRGB(0x999999);
        
        

        
        //定义常用颜色
        _defaultGreen=UIColorFromRGB(0x198c49);
        _lightGreen=UIColorFromRGB(0x99cc00);
        
        _themeShallowRed = UIColorFromRGB(0xe2ced1);
                _themeRed = UIColorFromRGB(0x7c151a);
        _themeYellowWhite=UIColorFromRGB(0xfffdf2);
        _themeGuideTop=UIColorFromRGB(0xe3dec8);

        _themeMWBColor=UIColorFromRGB(0xf45d22);
        
        _navBackgroundColor=UIColorFromRGB(0x63e1e9);
        
        
        _viewBackgroundColor=UIColorFromRGB(0xffffff);
        _tabbarBackgroundColor=UIColorFromRGB(0xf3f3f3);
        _titleColor=UIColorFromRGB(0x424242);
    }
    
    return self;
}



@end
