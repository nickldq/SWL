//
//  MainType1TableViewCell.m
//  SWL
//
//  Created by Liudq on 16/2/4.
//
//

#import "MainTableViewCell.h"

@interface MainTableViewCell()
@property(nonatomic)int x;
@end

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

-(void)randomAnimation{
    
    __block UIImageView *v = [self viewWithTag:_x];
    [UIView animateWithDuration:1 animations:^{
        v.alpha=0.24;
    }completion:^(BOOL finished){
        _x = arc4random() % (_imageNameArray.count-1);
        v = [self viewWithTag:_x];
        [UIView animateWithDuration:1.5 animations:^{
            v.alpha=1;
        }completion:^(BOOL finished){
            double delayInSeconds = 3.0;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                //执行事件
                [self randomAnimation];
            });
        }];
    }];
}

@end
