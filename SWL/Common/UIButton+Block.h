//
//  UIButton+Block.h
//  
//
//  Created by Liudq on 15/11/14.
//
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void (^ActionBlock)();

@interface UIButton (Block)

/**
 *  UIButton添加UIControlEvents事件的block
 *
 *  @param event 事件
 *  @param action block代码
 */
- (void) handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)action;

@end
