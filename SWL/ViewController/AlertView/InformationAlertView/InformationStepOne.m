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

@implementation InformationStepOne

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [DaiDodgeKeyboard addRegisterTheViewNeedDodgeKeyboard:self];
    [self addTarget:self action:@selector(backgroundTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)backgroundTouchUpInside:(UIView *)view{
    [[self findFirstResponder] resignFirstResponder];
}

- (IBAction)submitAction:(UIButton *)sender {
    
        InformationStepTwo *step2View = (InformationStepTwo *)[[[NSBundle mainBundle]loadNibNamed:@"InformationStepTwo" owner:self options:nil]firstObject];
    [self addSubview:step2View];
    step2View.alert = _alert;
}

- (IBAction)clearAction:(UIButton *)sender {
}
- (IBAction)closeAction:(id)sender {
    [_alert dismissWithCompletion:^{
        
    }];
}
@end
