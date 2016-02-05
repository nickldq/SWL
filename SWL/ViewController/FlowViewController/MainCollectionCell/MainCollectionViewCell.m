//
//  MainCollectionViewCell.m
//  SWL
//
//  Created by Liudq on 16/2/2.
//
//

#import "MainCollectionViewCell.h"

@implementation MainCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

-(void)maskingViewTweenedAnimation{
    [UIView animateWithDuration:1 animations:^(){
        _maskingView.alpha=0;
    }];
}

-(void)randomAnimation{
    int x = arc4random() % 100
}
@end
