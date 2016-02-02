//
//  NSString+ZY.h
//  CoderBlog
//
//  Created by Lixing.wang on 14-5-6.
//  Copyright (c) 2014年 Lixing.wang. All rights reserved.
//

@interface NSString (ZY)

/**
 *  计算一个字符串在限定的宽度和字体下的长度
 *
 *  @param font  限定的字体
 *  @param width 限定的宽度
 *
 *  @return 字符串的长度
 */
- (NSInteger)heightWithFont:(UIFont* )font width:(CGFloat)width;

@end
