//
//  FlowViewController.h
//  SWL
//
//  Created by Liudq on 16/2/2.
//
//

#import "BaseViewController.h"
#import "DCPicScrollView.h"

@interface FlowViewController : BaseViewController<DCPicScrollViewDelegate>

@property (nonatomic, strong) DCPicScrollView *picScrollView;  

@end
