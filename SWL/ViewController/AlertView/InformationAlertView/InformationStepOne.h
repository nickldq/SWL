//
//  InformationStepOne.h
//  SWL
//
//  Created by Liudq on 16/2/5.
//
//

#import <UIKit/UIKit.h>
#import "FlowViewController.h"
#import "HPGrowingTextView.h"

@interface InformationStepOne : UIControl<UITextFieldDelegate, UITextViewDelegate>
@property(strong, nonatomic)UIImage *headerImage;
@property(strong, nonatomic)UIImage *tempImage;
@property(strong, nonatomic)JCAlertView *alert;
@property(strong, nonatomic)FlowViewController *flowVC;
- (IBAction)submitAction:(UIButton *)sender;
- (IBAction)clearAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (weak, nonatomic) IBOutlet HPGrowingTextView *m_textView;

@end
