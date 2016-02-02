//
//  OCJSplashView.m
//  ocj
//
//  Created by OCJIT on 13-11-20.
//  Copyright (c) 2013年 OCJ. All rights reserved.
//

#import "OCJSplashView.h"
#import "AppDelegate.h"  

@interface OCJSplashView(){
    
}
@property(nonatomic)int currentPage;
@end

@implementation OCJSplashView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

-(id)initWithImageArray:(NSArray *)imageArray{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        _imageArray = imageArray;
//        if (IOS8_OR_LATER) {
//            _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.width)];
//
//        }else{
            _imageView = [[UIImageView alloc]initWithFrame:self.frame];

//        }
        //NSLog(@"%f======%f",self.frame.size.width,self.frame.size.height);
        //NSLog(@"%f======%f",self.bounds.size.width,self.bounds.size.height);
        [self addSubview:_imageView];
        _currentPage = 0;
    }
    return self;
}

-(void)showSplashView{
    UIWindow *window = nil;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        AppDelegate* delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        window = delegate.window;
        
    }else if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        
//        AppDelegatePad *delegate = [UtilsForPad appDelegateForPad];
//        window = delegate.window;
    }
    if (1 == _imageArray.count) {
        NSString *imageName = [_imageArray objectAtIndex:0];
        NSArray *imageNameArr = [imageName componentsSeparatedByString:@"."];
        self.image = [self loadImage:[imageNameArr objectAtIndex:0] ofType:[imageNameArr objectAtIndex:1]];
        _imageView.image = self.image;
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            CGFloat rotate = 0.0;
            UIInterfaceOrientation orient = [[UIApplication sharedApplication] statusBarOrientation];
            //---------------------------------------------------------------------------------------------------------------------------------------------
            if (orient == UIInterfaceOrientationLandscapeLeft){
                if (!(IOS8_OR_LATER)) {
                    rotate = - M_PI_2;

                }
            }
            if (orient == UIInterfaceOrientationLandscapeRight){
                if (!(IOS8_OR_LATER)) {

                    rotate = + M_PI_2;
                }
            }
            //---------------------------------------------------------------------------------------------------------------------------------------------
            self.transform = CGAffineTransformMakeRotation(rotate);
            self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
            _imageView.frame = self.frame;
        }
        [window addSubview:self];
    }else{
        [self removeSelf:self];
    }
}


-(void)showGuideView{
    
    UIWindow *window = nil;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        AppDelegate* delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        window = delegate.window;
        
    }else if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        
//        AppDelegatePad *delegate = [UtilsForPad appDelegateForPad];
//        window = delegate.window;
    }
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    if (0 < _imageArray.count && _currentPage < _imageArray.count){
        NSString *imageName = [_imageArray objectAtIndex:_currentPage];
        NSArray *imageNameArr = [imageName componentsSeparatedByString:@"."];
        self.image = [self loadImage:[imageNameArr objectAtIndex:0] ofType:[imageNameArr objectAtIndex:1]];
        _imageView.image = self.image;
        
        __unsafe_unretained UIImageView *blockImageView = _imageView;
        if (_currentPage > 0) {
            [UIView animateWithDuration:0.2 animations:^{
                blockImageView.alpha = 0.5;
            }completion:^(BOOL finished){
                blockImageView.image = self.image;
                [UIView animateWithDuration:0.2 animations:^{
                    blockImageView.alpha = 1;
                }];
            }];
        }
        __unsafe_unretained OCJSplashView *ocjSplashView = self;
        _imageView.onTouchTapBlock =  ^(UIImageView *imageView){
            [ocjSplashView showGuideView];
        };
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
            CGFloat rotate = 0.0;
            UIInterfaceOrientation orient = [[UIApplication sharedApplication] statusBarOrientation];
            //---------------------------------------------------------------------------------------------------------------------------------------------
            if (orient == UIInterfaceOrientationLandscapeLeft){
                if (!(IOS8_OR_LATER)) {
                    rotate = - M_PI_2;
                    
                }
            }
            if (orient == UIInterfaceOrientationLandscapeRight){
                if (!(IOS8_OR_LATER)) {
                    
                    rotate = + M_PI_2;
                }
            }
            //---------------------------------------------------------------------------------------------------------------------------------------------
            _imageView.transform = CGAffineTransformMakeRotation(rotate);
            _imageView.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        }
        
        bool isHave = NO;
        for (UIView *v in window.subviews) {
            if (v == self) {
                isHave = YES;
                break;
            }
        }
        if (!isHave) {
            [window addSubview:self];
        }
        [window bringSubviewToFront:self];
        _currentPage++;
    }else{
        [self removeSplashView];
    }
}

-(void)setImageArray:(NSArray *)imageArray{
        // Initialization code
        NSArray *paths =NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
        NSString *DocumentDirectory = [paths objectAtIndex:0];
    
    UIWindow *window = nil;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
    }else if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        
//        AppDelegatePad *delegate = [UtilsForPad appDelegateForPad];
//        window = delegate.window;
    }
        if ([self loadImage:@"HomeImage" ofType:@"jpg" inDirectory:DocumentDirectory]) {
            self.image = [self loadImage:@"HomeImage" ofType:@"jpg" inDirectory:DocumentDirectory];
            [window addSubview:self];
            [window bringSubviewToFront:self];
            
            double delayInSeconds = 1.0;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                // code to be executed on the main queue after delay
                
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1.0];
                [UIView setAnimationDelegate:self];
                self.alpha = 0.0;
                [UIView commitAnimations];
                [UIView setAnimationDidStopSelector:@selector(removeSelf:)];
                
            });
        }else{
            
        }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)saveImagesWithArray:(NSArray *)imageArray{
    if (imageArray && imageArray.count>0) {
        if (imageArray.count==1) {
            [self saveSlashviewImageFileName:[imageArray objectAtIndex:0]];
        }else{
//            if (iPhone5 && imageArray.count == 2) {
//                [self saveSlashviewImageFileName:[imageArray objectAtIndex:1]];
//            }else{
//                [self saveSlashviewImageFileName:[imageArray objectAtIndex:2]];
//            }
        }
    }else{
        NSArray *paths =NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
        NSString *DocumentDirectory = [paths objectAtIndex:0];
        [self deleteImage:@"HomeImage" ofType:@"jpg" inDirectory:DocumentDirectory];
    }
}

-(void)saveSlashviewImageFileName:(NSString *)imageFileName{
    
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *DocumentDirectory = [paths objectAtIndex:0];
    UIImage *imgData = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageFileName]]];
    
    if (imageFileName && ![imageFileName isEqualToString:@""]&&imgData) {
        [self saveImage:imgData withFileName:@"HomeImage" ofType:@"jpg" inDirectory:DocumentDirectory];
    }else{
        [self deleteImage:@"HomeImage" ofType:@"jpg" inDirectory:DocumentDirectory];
    }
}

-(UIImage *) loadImage:(NSString *)fileName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    UIImage * result = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.%@", directoryPath, fileName, extension]];
    return result;
}

-(UIImage *) loadImage:(NSString *)fileName ofType:(NSString *)extension{
    NSString *directoryPath = [[NSBundle mainBundle]pathForResource:fileName ofType:extension];
    UIImage * result = [UIImage imageWithContentsOfFile:directoryPath];
    return result;
}

-(void) saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    if ([[extension lowercaseString] isEqualToString:@"png"]) {
        [UIImagePNGRepresentation(image) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"png"]] options:NSAtomicWrite error:nil];
    } else if ([[extension lowercaseString] isEqualToString:@"jpg"] || [[extension lowercaseString] isEqualToString:@"jpeg"]) {
        [UIImageJPEGRepresentation(image, 1.0) writeToFile:[directoryPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", imageName, @"jpg"]] options:NSAtomicWrite error:nil];
    } else {
        //ALog(@"Image Save Failed\nExtension: (%@) is not recognized, use (PNG/JPG)", extension);
        DLog(@"文件后缀不认识");
    }
}

-(void) deleteImage:(NSString *)fileName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath {
    
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    [defaultManager removeItemAtPath:[NSString stringWithFormat:@"%@/%@.%@", directoryPath, fileName, extension] error:nil];
}

- (void)startTimer
{
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(dismissSplashView) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] run];
}



//-(void)showSplashView{
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.0];
//    //    [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:delegate.window cache:YES];
//    [UIView setAnimationDelegate:self];
//    self.alpha = 1.0;
//    [UIView commitAnimations];
//}

-(void)dismissSplashView{
    if (self) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationDelegate:self];
        self.alpha = 0.0;
        [UIView commitAnimations];
        [UIView setAnimationDidStopSelector:@selector(removeSelf:)];
    }
}

-(void)removeSplashView{
    if (self) {
        [UIView animateWithDuration:0.5 animations:^{
            self.alpha = 0.0;
        }completion:^(BOOL finished){
            [self removeFromSuperview];
        }];
    }
}

-(void)removeSelf:(UIView *)sender{
    if (_splashViewDelegate && [_splashViewDelegate respondsToSelector:@selector(splashViewDismiss)]) {
        [_splashViewDelegate performSelector:@selector(splashViewDismiss)];
    }
}

@end
