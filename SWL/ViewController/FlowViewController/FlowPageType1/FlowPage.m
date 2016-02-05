//
//  FlowPage.m
//  SWL
//
//  Created by Liudq on 16/2/6.
//
//

#import "FlowPage.h"
#import "BasicAnimationUtils.h"

@implementation FlowPage

-(void)drawRect:(CGRect)rect{
}

-(void)playAnimation{
    
    UIImageView *image100 = [self viewWithTag:100];
    UIImageView *image200 = [self viewWithTag:200];
    UIImageView *image300 = [self viewWithTag:300];
    CABasicAnimation *animation = [BasicAnimationUtils scale:[NSNumber numberWithFloat:1.0] orgin:[NSNumber numberWithFloat:0.0] durTimes:1 RepeatTimes:1];//缩放
    
    //透明度
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:1.0];
    
    //组合
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 1.0f;
    animationGroup.repeatCount = 1;//HUGE_VALF;     //HUGE_VALF,源自math.h
    [animationGroup setAnimations:[NSArray arrayWithObjects:animation, opacityAnimation, nil]];//zu
    
    [image100.layer addAnimation:animationGroup forKey:@"animationGroup"];
    [image200.layer addAnimation:animationGroup forKey:@"animationGroup"];
    [image300.layer addAnimation:animationGroup forKey:@"animationGroup"];
}
@end
