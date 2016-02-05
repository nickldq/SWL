//
//  InformationStepTwo.m
//  SWL
//
//  Created by Liudq on 16/2/5.
//
//

#import "InformationStepTwo.h"
#import "DaiDodgeKeyboard.h"

@implementation InformationStepTwo


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
- (IBAction)commitAction:(UIButton *)sender {
    [_alert dismissWithCompletion:^{
        
    }];
}
- (IBAction)returnAction:(id)sender {
    [self removeFromSuperview];
}
- (IBAction)closeAction:(id)sender {
    [_alert dismissWithCompletion:^{
        
    }];
}
@end
