//
//  NSString+ZY.m
//  CoderBlog
//
//  Created by Lixing.wang on 14-5-6.
//  Copyright (c) 2014年 Lixing.wang. All rights reserved.
//

#import "NSString+ZY.h"
@implementation NSString (ZY)

#pragma mark - Public

- (NSInteger)heightWithFont:(UIFont* )font width:(CGFloat)width {
    CGRect bounds = CGRectZero;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0f)
    {
        bounds = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    }else
    {
        bounds.size = [self sizeWithFont:font constrainedToSize:CGSizeMake(width, MAXFLOAT)];
    }
    
    return ceilf(bounds.size.height);
}


@end
