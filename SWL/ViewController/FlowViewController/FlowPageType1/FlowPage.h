//
//  FlowPage.h
//  SWL
//
//  Created by Liudq on 16/2/6.
//
//

#import <UIKit/UIKit.h>


@interface FlowPage : UIView 
@property(nonatomic, strong)NSMutableArray *flowImageArray;
-(void)clearView;
-(void)playAnimation;
-(void)randomChangeFlowImagesWithCurrentPage:(int)page CustomerAmount:(int)customerAmount;
@end
