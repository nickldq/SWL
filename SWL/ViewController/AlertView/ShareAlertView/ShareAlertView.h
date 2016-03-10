//
//  ShareAlertView
//  SWL
//
//  Created by Liudq on 16/2/5.
//
//

#import <UIKit/UIKit.h>
#import "FlowViewController.h"
#import "ShareUserResultModel.h"
@interface ShareAlertView : UIView
@property(strong ,nonatomic)JCAlertView *alert;
@property (weak, nonatomic) IBOutlet UIImageView *qrcodeImageVIew;
@property(strong, nonatomic)FlowViewController *flowVC;
@property(strong, nonatomic) ShareUserResultModel * shareUserResultModel;

@end
