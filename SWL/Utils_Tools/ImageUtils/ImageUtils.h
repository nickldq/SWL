//
//  ImageUtils
//  
//
//  Created by Liudongqi on 14-10-11.
//  Copyright 2014 __KY__. All rights reserved.
//hexadecimal 十六进制

#import <Foundation/Foundation.h>


@interface ImageUtils : NSObject {

}

#pragma mark - 等比例缩放图片
/**
 *@param  (CGSize)size
 *
 *@param  (UIImage *)image
 *
 *@return UIImage
 */
+(UIImage*)scaleToSize:(CGSize)size andImage:(UIImage *)image;
 
#pragma mark -
#pragma mark 从图片中截取一部分
+(UIImage*)cutFromImage:(UIImage*)oriImage byRect:(CGRect)rect;

#pragma mark -
#pragma mark 图片旋转
+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;

#pragma mark -
#pragma mark 两张图合成一张
+ (UIImage *)addImage:(UIImage *)image1 addRect:(CGRect)addRect toImage:(UIImage *)image2 toRect:(CGRect)toRect;
@end
