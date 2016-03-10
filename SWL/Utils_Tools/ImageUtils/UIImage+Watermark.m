//
//  UIImage+Watermark.m
//  SWL
//
//  Created by Liudq on 16/2/18.
//
//

#import "UIImage+Watermark.h"

@implementation UIImage (Watermark)

- (UIImage *)watermarkImage:(NSString *)text textRect:(CGRect)textRect textFont:(CGFloat)fontSize{
    
    
    
    //1.获取上下文
    
    UIGraphicsBeginImageContext(self.size);
    
    
    
    //2.绘制图片
    
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    
    
    //3.绘制水印文字
    
//    CGRect rect = CGRectMake(0, self.size.height-20, self.size.width, 20);
    CGRect rect = textRect;
    
    
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    
    style.alignment = NSTextAlignmentLeft;
    style.lineBreakMode = NSLineBreakByWordWrapping;
    style.lineSpacing = 4.0f;
    
    //文字的属性
    
    NSDictionary *dic = @{ NSFontAttributeName:[BMFontLibrary defaultFont:fontSize],
                          
                          NSParagraphStyleAttributeName:style,
                          
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                          };
    
    //将文字绘制上去
    
    [text drawInRect:rect withAttributes:dic];
    
    
    
    //4.获取绘制到得图片
    
    UIImage *watermarkImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    
    //5.结束图片的绘制
    
    UIGraphicsEndImageContext();
    
    
    
    return watermarkImage;
    
}
@end
