//
//  BasicAnimationUtils.m
//  ps
//
//  Created by Marco on 11-5-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BasicAnimationUtils.h"


@implementation BasicAnimationUtils


+(CABasicAnimation *)moveX:(float)time X:(NSNumber *)x{//横向移动
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    
    animation.toValue=x;
    
    animation.duration=time;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}

+(CABasicAnimation *)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time RepeatTimes:(float)repeatTimes{//缩放
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    theAnimation.duration = time;
    theAnimation.repeatCount = repeatTimes;
    theAnimation.removedOnCompletion = FALSE;
    theAnimation.fillMode = kCAFillModeForwards;
    theAnimation.autoreverses = NO;
    theAnimation.fromValue = orginMultiple;
    theAnimation.toValue = Multiple;
    return theAnimation;
}

@end
