//
//  ShareAlertViewController.m
//  SWL
//
//  Created by Liudq on 16/2/17.
//
//

#import "ShareAlertViewController.h"
#import "QRCodeGenerator.h"
#import "PECropViewController.h"
#import "AppDelegate.h"

@interface ShareAlertViewController () 
@property (weak, nonatomic) IBOutlet UIButton *headerButton;

@end

@implementation ShareAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createQrcodeImage:@"http://www.baidu.com"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)closeAction:(UIButton *)sender {
    [_alert dismissWithCompletion:^{
        
    }];
}

-(void)createQrcodeImage:(NSString *)urlString{
    UIImage *codeImage = [QRCodeGenerator qrImageForString:urlString imageSize:_qrcodeImageVIew.frame.size.width withPointType:QRPointRect withPositionType:QRPositionNormal withColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]];
    _qrcodeImageVIew.image = codeImage;
}
@end
