//
//  InformationStepTwo.m
//  SWL
//
//  Created by Liudq on 16/2/5.
//
//

#import "InformationStepTwo.h"
#import "DaiDodgeKeyboard.h"
#import "ShareAlertViewController.h"

@interface InformationStepTwo(){
    
}
@property (weak, nonatomic) IBOutlet UITextField *nameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *telTextfield;
@property (weak, nonatomic) IBOutlet UITextField *vipPhoneTextfield;

@end

@implementation InformationStepTwo


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [DaiDodgeKeyboard removeRegisterTheViewNeedDodgeKeyboard];
    [DaiDodgeKeyboard addRegisterTheViewNeedDodgeKeyboard:self];
    [self addTarget:self action:@selector(backgroundTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)backgroundTouchUpInside:(UIView *)view{
    [[self findFirstResponder] resignFirstResponder];
}
- (IBAction)commitAction:(UIButton *)sender {
    [_alert dismissWithCompletion:^{
        ShareAlertViewController *shareAlertView = [[ShareAlertViewController alloc]initWithNibName:@"ShareAlertViewController" bundle:nil];
        JCAlertView *customAlert = [[JCAlertView alloc] initWithCustomView:shareAlertView.view dismissWhenTouchedBackground:NO];
        shareAlertView.alert = customAlert;
        shareAlertView.flowVC = _flowVC;
        [customAlert show];
    }];
}
- (IBAction)returnAction:(id)sender {
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
        if (textField.text.length>11) {
            return NO;
        }else{
            BOOL validate = [CommonMethodUtils validateNumber:string textString:textField.text];
            
            if (validate) {
                if (textField == _telTextfield) {
                    _shareModel.phone = textField.text;
                }else if (textField == _vipPhoneTextfield){
                    _shareModel.VIPPhone = textField.text;
                }
                return YES;
            }else{
                return NO;
            }
        }
    }
    return YES;
}

#pragma mark--TextViewDelegate
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
     
    return YES;
}

-(BOOL)checkShareUserInfo{
    BOOL flag = YES;
    //检查昵称
    if ([[Common checkNSNull:_shareModel.realName] isEqualToString:@""]) {
        [ProgressHUDUtils dismissProgressHUDErrorWithStatus:@"请填写真实姓名,10个字以内"];
        flag = NO;
    }else if ([[Common checkNSNull:_shareModel.phone] isEqualToString:@""]){
        [ProgressHUDUtils dismissProgressHUDErrorWithStatus:@"请填写11位手机号码"];
        flag = NO;
    }
    return flag;
}

@end
