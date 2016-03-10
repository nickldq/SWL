//
//  AVCaptureViewController.m
//  NewProject
//
//  Created by Liudq on 14-10-16.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol AVCaptureDelegate <NSObject>
-(void)AVCaptureDidScan:(NSString *)codeString;
@end

@interface AVCaptureViewController : UIViewController<AVCaptureMetadataOutputObjectsDelegate>
{
    int num;
    BOOL upOrdown;
      NSTimer * timer;
}
@property (strong,nonatomic)AVCaptureDevice * device;
@property (strong,nonatomic)AVCaptureDeviceInput * input;
@property (strong,nonatomic)AVCaptureMetadataOutput * output;
@property (strong,nonatomic)AVCaptureSession * session;
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;
@property (nonatomic, strong) UIImageView * line;
@property (nonatomic, strong) id<AVCaptureDelegate> delegate;
@end
