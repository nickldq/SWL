//
//  ShareAlertView
//  SWL
//
//  Created by Liudq on 16/2/5.
//
//

#import "ShareAlertView.h"
#import "QRCodeGenerator.h"
#import "PECropViewController.h"

@interface ShareAlertView()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate, PECropViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;


@end

@implementation ShareAlertView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self createQrcodeImage:_shareUserResultModel.tdCodeUrl];
    [_headerImageView setImageURL:_shareUserResultModel.makeUpImgUrl];
    
}

- (IBAction)closeAction:(UIButton *)sender {
    [_alert dismissWithCompletion:^{
        
    }];
//    [self removeFromSuperview];
//    _flowVC.maskingView.hidden = YES;
}

-(void)createQrcodeImage:(NSString *)urlString{
    UIImage *codeImage = [QRCodeGenerator qrImageForString:urlString imageSize:_qrcodeImageVIew.frame.size.width withPointType:QRPointRect withPositionType:QRPositionNormal withColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]];
    _qrcodeImageVIew.image = codeImage;
}
@end
