//
//  MainType1TableViewCell.m
//  SWL
//
//  Created by Liudq on 16/2/4.
//
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setImageNameArray:(NSArray *)imageNameArray{
    _imageNameArray = imageNameArray;
    for (int i = 0; i<imageNameArray.count; i++) {
        UIImageView *v = [self viewWithTag:i];
        [v setImage:[UIImage imageNamed:imageNameArray[i]]];
    }
}

-(void)maskingViewTweenedAnimation{
    for (int i = 0; i<_imageNameArray.count; i++) {
        UIImageView *v = [self viewWithTag:i];
        [UIView animateWithDuration:1 animations:^(){
            v.alpha=1;
        }];
    }
    
}

@end
