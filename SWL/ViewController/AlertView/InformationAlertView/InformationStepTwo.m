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
        ShareAlertView *shareAlertView = (ShareAlertView *)[[[NSBundle mainBundle]loadNibNamed:@"ShareAlertView" owner:self options:nil]firstObject];
        JCAlertView *customAlert = [[JCAlertView alloc] initWithCustomView:shareAlertView dismissWhenTouchedBackground:NO];
        shareAlertView.alert = customAlert;
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
        if (textField.text.length>5) {
            return NO;
        }
    }else if (textField == _telTextfield || textField == _vipPhoneTextfield) {
        if (textField.text.length>11) {
            return NO;
        }else{
            return [CommonMethodUtils validateNumber:string textString:textField.text];
        }
    }
    return YES;
}

#pragma mark--TextViewDelegate
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
     
    return YES;
}
@end
