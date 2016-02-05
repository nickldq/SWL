//
//  InformationStepOne.m
//  SWL
//
//  Created by Liudq on 16/2/5.
//
//

#import "InformationStepOne.h"
#import "InformationStepTwo.h"
#import "DaiDodgeKeyboard.h"

@interface InformationStepOne()
@property (weak, nonatomic) IBOutlet UITextField *nickNameTextField;
@property (weak, nonatomic) IBOutlet UITextView *evaluationTextView;

@end

@implementation InformationStepOne

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [DaiDodgeKeyboard removeRegisterTheViewNeedDodgeKeyboard];
    [DaiDodgeKeyboard addRegisterTheViewNeedDodgeKeyboard:self];
 
    [self addTarget:self action:@selector(backgroundTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    _nickNameTextField.delegate = self;
    _evaluationTextView.delegate = self;
    
}

-(void)backgroundTouchUpInside:(UIView *)view{
    [[self findFirstResponder] resignFirstResponder];
}

- (IBAction)submitAction:(UIButton *)sender {
    
        InformationStepTwo *step2View = (InformationStepTwo *)[[[NSBundle mainBundle]loadNibNamed:@"InformationStepTwo" owner:self options:nil]firstObject];
    [self addSubview:step2View];
    step2View.alert = _alert;
    step2View.infoStepOne = self;
}

- (IBAction)clearAction:(UIButton *)sender {
    [_alert dismissWithCompletion:^{
        
    }];

}
- (IBAction)closeAction:(id)sender {
    [_alert dismissWithCompletion:^{
        
    }];
}

#pragma mark--TextFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(textField == _nickNameTextField){
        if (textField.text.length>10) {
            return NO;
        }
    }
    return YES;
}

#pragma mark--TextViewDelegate
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if(textView == _evaluationTextView){
        if (textView.text.length>10) {
            return NO;
        }
    }
    return YES;
}
@end
