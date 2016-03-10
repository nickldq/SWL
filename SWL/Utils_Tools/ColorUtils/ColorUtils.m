//
//  ColorUtils.m
//  ps
//
//  Created by Marco on 11-5-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ColorUtils.h"


@implementation ColorUtils

+(UIColor*) getColorWithHex:(NSString *)hexColor alpha:(float)alpha
{
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    if (alpha<0) {
        alpha=0;
    }
    if (alpha>1.0){
        alpha = 1.0;
    }
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:alpha];
}
 

+ (UIImage*) drawGradientInRect:(CGSize)size withColors:(NSArray*)colors {
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) [ar addObject:(id)c.CGColor];
    
    UIGraphicsBeginImageContextWithOptions(size, YES, 1);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    
    //     CGContextClipToRect(context, rect);
    
    CGPoint start = CGPointMake(0.0, 0.0);
    CGPoint end = CGPointMake(0.0, size.height);
    
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    
    // Clean up
    CGColorSpaceRelease(colorSpace); // Necessary?
    UIGraphicsEndImageContext(); // Clean up
    return image;
}

+ (UIImage *)radialGradientImage:(CGSize)size start:(float)start end:(float)end centre:(CGPoint)centre radius:(float)radius {
    // Initialise
    UIGraphicsBeginImageContextWithOptions(size, YES, 1);
    
    // Create the gradient's colours
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { start,start,start, 1.0,  // Start color
        end,end,end, 1.0 }; // End color
    
    CGColorSpaceRef myColorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef myGradient = CGGradientCreateWithColorComponents (myColorspace, components, locations, num_locations);
    
    // Normalise the 0-1 ranged inputs to the width of the image
    CGPoint myCentrePoint = CGPointMake(centre.x * size.width, centre.y * size.height);
    float myRadius = MIN(size.width, size.height) * radius;
    
    // Draw it!
    CGContextDrawRadialGradient (UIGraphicsGetCurrentContext(), myGradient, myCentrePoint,
                                 0, myCentrePoint, myRadius,
                                 kCGGradientDrawsAfterEndLocation);
    
    // Grab it as an autoreleased image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Clean up
    CGColorSpaceRelease(myColorspace); // Necessary?
    CGGradientRelease(myGradient); // Necessary?
    UIGraphicsEndImageContext(); // Clean up
    return image;
}


#pragma mark - 将颜色转为CGRectMake(0.0f, 0.0f, 1.0f, 1.0f) 的图片
/**
 *@param  color
 *
 *@return UIImage
 */
+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

#pragma mark - 将图片转为UIColor
/**
 *@param  img
 *
 *@return UIColor
 */
+ (UIColor *)createColorWithImage:(UIImage *)img
{
    return [UIColor colorWithPatternImage:img];
}

@end
