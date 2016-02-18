//
//  InformationStepTwo.m
//  SWL
//
//  Created by Liudq on 16/2/5.
//
//

#import "InformationStepTwo.h"
#import "DaiDodgeKeyboard.h"
#import "ShareAlertView.h"
#import "ShareUploadRequestService.h"
#import "UIImage+Watermark.h"
#import "GetCityShopService.h"
#import "PopoverView.h"

@interface InformationStepTwo(){
    
}
@property (weak, nonatomic) IBOutlet UIImageView *bg_imageView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *telTextfield;
@property (weak, nonatomic) IBOutlet UITextField *vipPhoneTextfield;
@property (weak, nonatomic) IBOutlet UIButton *shopNameButton;
@property (weak, nonatomic) IBOutlet UIButton *locationButton;
@property (strong, nonatomic) ShareUploadRequestService *uploadRequest;
@end

@implementation InformationStepTwo


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [DaiDodgeKeyboard removeRegisterTheViewNeedDodgeKeyboard];
    [DaiDodgeKeyboard addRegisterTheViewNeedDodgeKeyboard:self];
    [self addTarget:self action:@selector(backgroundTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    if (!_uploadRequest) {
        _uploadRequest = [ShareUploadRequestService sharedInstance];
        
        __weak __typeof(self)weakSelf = self;
        [self addTarget:self action:@selector(backgroundTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [_locationButton handleControlEvent:UIControlEventTouchUpInside withBlock:^{
            [[GetCityShopService sharedInstance] getAllCityRequestService:^(id responseObject) {
                NSArray *cityArray = [[NSArray arrayWithObject:responseObject] firstObject] ;
                PopoverView *pop = [[PopoverView alloc] initWithPoint:CGPointMake(435, 466) titles:cityArray images:nil];
                pop.selectRowAtIndex = ^(NSInteger index){
                    NSString *title1 = cityArray[index];
                    [weakSelf.locationButton setTitle:title1 forState:UIControlStateNormal];
                    [weakSelf.shopNameButton setTitle:@"" forState:UIControlStateNormal];
                    _shareModel.location = title1;
                    _shareModel.shopName = @"";
                };
                [pop show];
            } failure:^(NSError *error) {
                
            }];
        }];
        [_shopNameButton handleControlEvent:UIControlEventTouchUpInside withBlock:^{
            if ([[Common checkNSNull:_shareModel.location] isEqualToString:@""]){
                [ProgressHUDUtils dismissProgressHUDErrorWithStatus:@"请选择地区!"];
            }else{
            [[GetCityShopService sharedInstance] getAllShopByCityRequestService:weakSelf.shareModel.location success:^(id responseObject) {
                NSArray *cityArray = [[NSArray arrayWithObject:responseObject] firstObject] ;
                PopoverView *pop = [[PopoverView alloc] initWithPoint:CGPointMake(596, 466) titles:cityArray images:nil];
                pop.selectRowAtIndex = ^(NSInteger index){
                    NSString *title1 = cityArray[index];
                    [weakSelf.shopNameButton setTitle:title1 forState:UIControlStateNormal];
                    _shareModel.shopName = title1;
                };
                [pop show];
            } failure:^(NSError *error) {
                
            }];
            }
        }];
            
    }
//    _shareModel.realName = _nameTextfield.text;
//    _shareModel.phone = _telTextfield.text;
//    _shareModel.location = _locationButton.titleLabel.text;
//    _shareModel.shopName = _shopNameButton.titleLabel.text;
    _shareModel.sex = @"1";
}

-(void)backgroundTouchUpInside:(UIView *)view{
    [[self findFirstResponder] resignFirstResponder];
}
- (IBAction)commitAction:(UIButton *)sender {
    if ([self checkShareUserInfo]) {
        UIImage *image = [UIImage imageWithData:_shareModel.imageFormKey];
        image = [image watermarkImage:_shareModel.nickname textRect:CGRectMake(30, image.size.height/1.92233, 34*5 , 35.0f) textFont:34.0f];//名
        
        image = [image watermarkImage:_shareModel.location textRect:CGRectMake(30*2+30*[Common convertToInt:_shareModel.nickname], image.size.height/1.92233+3, 34*4 , 34.0f) textFont:28.0f];//地点
        
        image = [image watermarkImage:_shareModel.comment textRect:CGRectMake(30, image.size.height/1.92233+28*3, 30*10 , 32.0f) textFont:30.0f];//评论第一行
        
        if (_shareModel.comment.length > 10) {
            NSString *strline2 = [_shareModel.comment substringWithRange:NSMakeRange(9, _shareModel.comment.length-10 )];
            image = [image watermarkImage:strline2 textRect:CGRectMake(30, image.size.height/1.92233+28*4, 30*10 , 32.0f) textFont:30.0f];//评论第2行
        }
        
        _bg_imageView.image = image;
        _shareModel.imageFormKey = UIImageJPEGRepresentation(image, 1.0);
        [MBProgressHUD showHUDAddedTo:self animated:YES];
        [_uploadRequest shareUploadRequestServiceByShareModel:_shareModel success:^(ShareUserResultModel *shareUserResultModel) {
            [MBProgressHUD hideHUDForView:self animated:YES];
            if ([shareUserResultModel.result isEqualToString:@"1"]) {
                [_infoStepOne removeFromSuperview];
                _flowVC.maskingView.hidden = YES;
                ShareAlertView *shareAlertView = [[[NSBundle mainBundle] loadNibNamed:@"ShareAlertView" owner:self options:nil] firstObject];
                JCAlertView *customAlert = [[JCAlertView alloc] initWithCustomView:shareAlertView dismissWhenTouchedBackground:NO];
                shareAlertView.alert = customAlert;
                shareAlertView.flowVC = _flowVC;
                shareAlertView.shareUserResultModel = shareUserResultModel;
                [customAlert show];
            }
        } failure:^(NSError *error) {
            [MBProgressHUD hideHUDForView:self animated:YES];
        }];

    }
}
- (IBAction)returnAction:(id)sender {
    _shareModel.realName = @"";
    _shareModel.phone = @"";
    _shareModel.location = @"";
    _shareModel.shopName = @"";
    _shareModel.sex = @"1";
    [self removeFromSuperview];
    [_infoStepOne setNeedsDisplay];
}
- (IBAction)closeAction:(id)sender {
    [_alert dismissWithCompletion:^{
        
    }];
}

#pragma mark--TextFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField == _nameTextfield){
        if (textField.text.length>10) {
            return NO;
        }
        _shareModel.realName = textField.text;
    }else if (textField == _telTextfield || textField == _vipPhoneTextfield) {
        if (textField.text.length>=11&&![string isEqualToString:@""]) {
            return NO;
        }else{
            BOOL validate = [CommonMethodUtils validateNumber:string textString:textField.text];
            return validate;
//            if (validate) {
//                if (textField == _telTextfield) {
//                    _shareModel.phone = textField.text;
//                }else if (textField == _vipPhoneTextfield){
//                    _shareModel.VIPPhone = textField.text;
//                }
//                return YES;
//            }else{
//                return NO;
//            }
        }
    }
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if(textField == _nameTextfield){
        _shareModel.realName = textField.text;
    }else if (textField == _telTextfield) {
            _shareModel.phone = textField.text;
        }else if (textField == _vipPhoneTextfield){
            _shareModel.VIPPhone = textField.text;
        }
}

#pragma mark--TextViewDelegate
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
     
    return YES;
}

-(BOOL)checkShareUserInfo{
    BOOL flag = YES;
    //检查昵称
    if ([[Common checkNSNull:_shareModel.realName] isEqualToString:@""]) {
        [ProgressHUDUtils dismissProgressHUDErrorWithStatus:@"请填写真实姓名,10个字以内!"];
        flag = NO;
    }else if ([[Common checkNSNull:_shareModel.phone] isEqualToString:@""] || _shareModel.phone.length != 11){
        [ProgressHUDUtils dismissProgressHUDErrorWithStatus:@"请填写11位手机号码!"];
        flag = NO;
    }else if ([[Common checkNSNull:_shareModel.location] isEqualToString:@""]){
        [ProgressHUDUtils dismissProgressHUDErrorWithStatus:@"请选择地区!"];
        flag = NO;
    }else if ([[Common checkNSNull:_shareModel.shopName] isEqualToString:@""]){
        [ProgressHUDUtils dismissProgressHUDErrorWithStatus:@"请门店名称!"];
        flag = NO;
    }
    return flag;
}

@end
