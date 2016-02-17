//
//  InformationStepOne.h
//  SWL
//
//  Created by Liudq on 16/2/5.
//
//

#import <UIKit/UIKit.h>
#import "FlowViewController.h"

@interface InformationStepOne : UIControl<UITextFieldDelegate, UITextViewDelegate>
@property(strong, nonatomic)JCAlertView *alert;
@property(strong, nonatomic)FlowViewController *flowVC;
- (IBAction)submitAction:(UIButton *)sender;
- (IBAction)clearAction:(UIButton *)sender;

@end
