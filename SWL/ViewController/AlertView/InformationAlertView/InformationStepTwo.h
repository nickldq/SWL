//
//  InformationStepTwo.h
//  SWL
//
//  Created by Liudq on 16/2/5.
//
//

#import <UIKit/UIKit.h>
#import "InformationStepOne.h"
#import "ShareUserUploadModel.h"

@interface InformationStepTwo : UIControl<UITextFieldDelegate, UITextViewDelegate>
@property(strong ,nonatomic)JCAlertView *alert;
@property(strong ,nonatomic)InformationStepOne *infoStepOne;
@property(strong, nonatomic)FlowViewController *flowVC;
@property (strong, nonatomic) ShareUserUploadModel *shareModel;
@end
