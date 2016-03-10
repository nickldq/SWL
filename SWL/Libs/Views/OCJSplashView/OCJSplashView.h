//
//  OCJSplashView.h
//  ocj
//
//  Created by OCJIT on 13-11-20.
//  Copyright (c) 2013年 OCJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OCJSplashViewDelegate <NSObject>

@optional
-(void)splashViewDismiss;

@end

@interface OCJSplashView : UIView{
    id<OCJSplashViewDelegate> _splashViewDelegate;
}

@property(nonatomic, strong) id<OCJSplashViewDelegate> splashViewDelegate;
@property(strong, nonatomic) NSArray *imageArray;

@property(strong, nonatomic) UIImageView *imageView;
@property(strong, nonatomic) UIImage *image;

-(id)initWithImageArray:(NSArray *)imageArray;
-(void)showSplashView;
-(void)showGuideView;
-(void)removeSplashView;
-(void)saveImagesWithArray:(NSArray *)imageArray;
@end
