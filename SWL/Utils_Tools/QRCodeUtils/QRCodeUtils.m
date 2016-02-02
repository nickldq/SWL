//
//  ImageUtils
//
//  Created by Liudq on 14-10-14.
//  Copyright 2014 _KY_. All rights reserved.
//

#import "QRCodeUtils.h"
#import "FMTCodeViewController.h"
#import "AVCaptureViewController.h"

@implementation QRCodeUtils
+(QRCodeUtils*)shareInstance:(id<QRCodeScanningDelegate>)delegate{
    
    static QRCodeUtils* instance;
    @synchronized(self){
        if (!instance ) {
            instance = [QRCodeUtils new];
            instance.delegate = delegate;
        }
    }
    return instance;
}

-(void)pushCreateQRCodeViewController:(UIViewController *)vc urlStr:(NSString *)url{
    FMTCodeViewController *codeController = [[FMTCodeViewController alloc] initWithNibName:@"FMTCodeViewController" bundle:nil];
    codeController.codeContent = url; 
    [vc.navigationController pushViewController:codeController animated:YES];
}
#define iPhone5_height (([[UIScreen mainScreen] bounds].size.height==568)?88:0)   //iPhone5的高度

- (void)scanningImg:(UIViewController *)vc{
        AVCaptureViewController * rt = [[AVCaptureViewController alloc]init];
        rt.delegate = self;
        [vc presentViewController:rt animated:YES completion:^{
            
        }]; 
}

//-(void)readFromAlbums:(UIViewController *)vc{
//    //在相册扫描
//    ZBarReaderController *reader = [ZBarReaderController new];
//    reader.allowsEditing = YES;
//    reader.readerDelegate = self;
//    reader.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    [vc presentViewController:reader animated:YES completion:^{
//        NSLog(@"跳转成功---");
//    }];
//} 

#pragma mark -
#pragma mark 设置可扫描区的scanCrop的方法

+ (CGRect)getScanCrop:(CGRect)rect readerViewBounds:(CGRect)rvBounds{
    CGFloat x,y,width,height;
    x = rect.origin.y / rvBounds.size.height;
    y = 1 - (rect.origin.x + rect.size.width) / rvBounds.size.width;
    width = (rect.origin.y + rect.size.height) / rvBounds.size.height;
    height = 1 - rect.origin.x / rvBounds.size.width;
    return CGRectMake(x, y, width, height);
}


/*
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    if ([info count]>2) {
        int quality = 0;
        ZBarSymbol *bestResult = nil;
        for(ZBarSymbol *sym in results) {
            int q = sym.quality;
            if(quality < q) {
                quality = q;
                bestResult = sym;
            }
        }
        [self performSelector: @selector(presentResult:) withObject: bestResult afterDelay: .001];
    }else {
        ZBarSymbol *symbol = nil;
        for(symbol in results)
            break;
        [self performSelector: @selector(presentResult:) withObject: symbol afterDelay: .001];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void) presentResult: (ZBarSymbol*)sym {
    if (sym) {
        NSString *tempStr = sym.data;
        if ([sym.data canBeConvertedToEncoding:NSShiftJISStringEncoding]) {
            tempStr = [NSString stringWithCString:[tempStr cStringUsingEncoding:NSShiftJISStringEncoding] encoding:NSUTF8StringEncoding];
            if (tempStr&&![tempStr isEqualToString:@""]) {
                if ([_delegate respondsToSelector:@selector(qrcodeDidScan:)]) {
                    [_delegate performSelector:@selector(qrcodeDidScan:) withObject:tempStr];
                }
            }
        }
    }
}
*/

-(void)AVCaptureDidScan:(NSString *)codeString{
    if (codeString&&![codeString isEqualToString:@""]) {
        if ([_delegate respondsToSelector:@selector(qrcodeDidScan:)]) {
            [_delegate performSelector:@selector(qrcodeDidScan:) withObject:codeString];
        }
    }
}

@end
