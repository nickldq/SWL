//
//  ScreenShotUtils.m
//
//  Created by Liudq on 14-10-11.
//  Copyright 2014 _KY_. All rights reserved.
//

#import "ScreenShotUtils.h"
 
@implementation ScreenShotUtils

#pragma mark - 截图方法
/**
 *@return UIImage
 */
+(UIImage *)ScreenShots
{
    CGSize imageSize = [[UIScreen mainScreen] bounds].size;
    if (NULL != UIGraphicsBeginImageContextWithOptions) {
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    }
    else
    {
        UIGraphicsBeginImageContext(imageSize);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIImage *image = nil;
    for (UIWindow * window in [[UIApplication sharedApplication] windows]) {
        if (![window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen]) {
            CGContextSaveGState(context);
            CGContextTranslateCTM(context, [window center].x, [window center].y);
            CGContextConcatCTM(context, [window transform]);
            CGContextTranslateCTM(context, -[window bounds].size.width*[[window layer] anchorPoint].x, -[window bounds].size.height*[[window layer] anchorPoint].y);
            if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
                [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
                image = UIGraphicsGetImageFromCurrentImageContext();
            } else {
                [window.layer renderInContext:UIGraphicsGetCurrentContext()];
                image = UIGraphicsGetImageFromCurrentImageContext();
            }
            
            CGContextRestoreGState(context);
        }
    }
    
    UIGraphicsEndImageContext();
    
    DLog(@"Suceeded!");
    return image;
}

@end
