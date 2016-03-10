//
//  MainCollectionViewCell.h
//  SWL
//
//  Created by Liudq on 16/2/2.
//
//

#import <UIKit/UIKit.h>

@interface MainCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *maskingView;

-(void)maskingViewTweenedAnimation;
@end
