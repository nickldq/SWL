//
//  InformationStepTwo.h
//  SWL
//
//  Created by Liudq on 16/2/5.
//
//

#import <UIKit/UIKit.h>
#import "InformationStepOne.h"

@interface InformationStepTwo : UIControl<UITextFieldDelegate, UITextViewDelegate>
@property(strong ,nonatomic)JCAlertView *alert;
@property(strong ,nonatomic)InformationStepOne *infoStepOne;
@end
