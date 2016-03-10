//
//  PopoverView.h
//  ArrowView
//
//  Created by guojiang on 4/9/14.
//  Copyright (c) 2014年 LINAICAI. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <UIKit/UIKit.h>

@protocol PopoverViewDelegate <NSObject>

@optional
-(void)popoverViewDidSelectedAtIndex:(NSIndexPath *)index;

@end

@interface PopoverView : UIView
@property (nonatomic) int ROW_HEIGHT;

-(id)initWithPoint:(CGPoint)point titles:(NSArray *)titles images:(NSArray *)images;
-(void)show;
-(void)dismiss;
-(void)dismiss:(BOOL)animated;
-(void)configTableViewFrame;

@property (nonatomic) id<PopoverViewDelegate> popoverdelegate;
@property (nonatomic, copy) UIColor *borderColor;
@property (nonatomic, copy) void (^selectRowAtIndex)(NSInteger index);
@end
