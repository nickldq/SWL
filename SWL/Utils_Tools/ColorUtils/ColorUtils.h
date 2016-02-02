//
//  ColorUtils.h
//  
//
//  Created by Marco on 11-5-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//hexadecimal 十六进制

#import <Foundation/Foundation.h>


@interface ColorUtils : NSObject {

}
#pragma mark - 获取颜色,格式: FFAABB
/**
 *  @Author Liudongqi, 14-10-16 10:10:32
 *
 *  通过16进制数来生成UIColor, alpha为1
 *
 *  @param hexColor "FFAABB"
 *  @param alpha 0~1
 *
 *  @return return UIColor
 */
+(UIColor*) getColorWithHex:(NSString*)hexColor alpha:(float)alpha;

/**
 *  @Author Liudongqi, 14-10-16 10:10:46
 *
 *  产生一组水平渐变色,并返回渐变色的UIImage
 *
 *  @param size   CGSize
 *  @param colors color数组
 *
 *  @return UIImage
 */
+ (UIImage*) drawGradientInRect:(CGSize)size withColors:(NSArray*)colors;

/**
 *  @Author Liudongqi, 14-10-16 11:10:37
 *
 *  产生一组放射状渐变色,并返回渐变色的UIImage
 *
 *  @param size   大小
 *  @param start  开始位置
 *  @param end    结束位置
 *  @param centre 圆心
 *  @param radius 半径
 *
 *  @return UIImage
 */
+ (UIImage *)radialGradientImage:(CGSize)size start:(float)start end:(float)end centre:(CGPoint)centre radius:(float)radius;

#pragma mark - 将颜色转为CGRectMake(0.0f, 0.0f, 1.0f, 1.0f) 的图片
/**
 *@param  color
 *
 *@return UIImage
 */
+(UIImage *)createImageWithColor:(UIColor *)color;
 
#pragma mark - 将图片转为UIColor
/**
 *@param  img
 *
 *@return UIColor
 */
+ (UIColor *)createColorWithImage:(UIImage *)img;
 
@end
