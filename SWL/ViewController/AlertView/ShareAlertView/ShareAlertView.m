//
//  ShareAlertView
//  SWL
//
//  Created by Liudq on 16/2/5.
//
//

#import "ShareAlertView.h"
#import "QRCodeGenerator.h"

@implementation ShareAlertView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self createQrcodeImage:@"http://www.baidu.com"];
}

- (IBAction)closeAction:(UIButton *)sender {
    [_alert dismissWithCompletion:^{
        
    }];
}

-(void)createQrcodeImage:(NSString *)urlString{
    UIImage *codeImage = [QRCodeGenerator qrImageForString:urlString imageSize:_qrcodeImageVIew.frame.size.width withPointType:QRPointRect withPositionType:QRPositionNormal withColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]];
    _qrcodeImageVIew.image = codeImage;
}
@end
