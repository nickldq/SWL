//
//  ShareAlertViewController.h
//  SWL
//
//  Created by Liudq on 16/2/17.
//
//

#import <UIKit/UIKit.h>

#import "FlowViewController.h"
@interface ShareAlertViewController : UIViewController
@property(strong ,nonatomic)JCAlertView *alert;
@property (weak, nonatomic) IBOutlet UIImageView *qrcodeImageVIew;
@property(strong, nonatomic)FlowViewController *flowVC;

@end
