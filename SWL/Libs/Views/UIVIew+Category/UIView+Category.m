//
//  UIView+Category.m
//  SWL
//
//  Created by Liudq on 16/2/5.
//
//

#import "UIView+Category.h"
@implementation UIControl (Category)

@end
@implementation UIView (Category)
- (UIView *)findFirstResponder
{
    if (self.isFirstResponder) return self;
    for (UIView *subView in self.subviews) {
        if( [subView respondsToSelector:@selector(findFirstResponder)]) {
            UIView *firstResponder = [subView performSelector:@selector(findFirstResponder)];
            if (firstResponder != nil) return firstResponder;
        }
    }
    return nil;
}
@end
