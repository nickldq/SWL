//
//  QRCodeUtils
//  
//
//  Created by Liudongqi on 14-10-14.
//  Copyright 2014 __KY__. All rights reserved.
//hexadecimal 十六进制

#import <Foundation/Foundation.h>
#import "QRCodeScanningDelegate.h"
#import "AVCaptureViewController.h"
@interface QRCodeUtils : NSObject<UINavigationControllerDelegate, UIImagePickerControllerDelegate, AVCaptureDelegate> {

}

@property(nonatomic, weak)id<QRCodeScanningDelegate> delegate;

+(QRCodeUtils*)shareInstance:(id<QRCodeScanningDelegate>)delegate;

#pragma mark - 切换到生成二维码
/**
 *@param  UIViewController
 *@param  url
 *
 *@return void
 */
-(void)pushCreateQRCodeViewController:(UIViewController *)vc urlStr:(NSString *)url;

/**
 *  @Author Liudongqi, 14-10-16 10:10:51
 *
 *  捕捉二维码
 *
 *  @param vc VC
 */
- (void)scanningImg:(UIViewController *)vc;

/**
 *  @Author Liudongqi, 14-10-16 10:10:24
 *
 *  从相册扫描二维码
 *
 *  @param vc VC
 */
- (void)readFromAlbums:(UIViewController*)vc;

#pragma mark -
#pragma mark 设置可扫描区的scanCrop的方法
/**
 *  @Author Liudongqi, 14-10-16 10:10:28
 *
 *  设置可扫描区的scanCrop的方法
 *
 *  @param rect     屏幕区域区域
 *  @param rvBounds 扫描区域
 *
 *  @return 可扫描区
 */
+ (CGRect)getScanCrop:(CGRect)rect readerViewBounds:(CGRect)rvBounds;
@end
