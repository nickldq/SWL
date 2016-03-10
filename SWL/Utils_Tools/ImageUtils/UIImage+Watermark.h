//
//  UIImage+Watermark.h
//  SWL
//
//  Created by Liudq on 16/2/18.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Watermark)


//添加水印
- (UIImage *)watermarkImage:(NSString *)text textRect:(CGRect)textRect textFont:(CGFloat)fontSize;

@end
