//
//  MainType4TableViewCell.m
//  SWL
//
//  Created by Liudq on 16/2/4.
//
//

#import "MainType4TableViewCell.h"

@implementation MainType4TableViewCell

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
@end
