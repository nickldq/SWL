//
//  FlowPage.m
//  SWL
//
//  Created by Liudq on 16/2/6.
//
//

#import "FlowPage.h"
#import "BasicAnimationUtils.h"

@interface FlowPage()

@end
@implementation FlowPage

-(void)drawRect:(CGRect)rect{
    [self clearView];
}

-(void)clearView{
    UIImageView *image100 = [self viewWithTag:100];
    UIImageView *image200 = [self viewWithTag:200];
    UIImageView *image300 = [self viewWithTag:300];
    image100.alpha = 0;
    image200.alpha = 0;
    image300.alpha = 0;
}

-(void)playAnimation{
    
    UIImageView *image100 = [self viewWithTag:100];
    UIImageView *image200 = [self viewWithTag:200];
    UIImageView *image300 = [self viewWithTag:300];
    image100.alpha = 0;
    image200.alpha = 0;
    image300.alpha = 0;
    CABasicAnimation *animation = [BasicAnimationUtils scale:[NSNumber numberWithFloat:1.0] orgin:[NSNumber numberWithFloat:0.0] durTimes:0.5 RepeatTimes:1];//缩放
    
    //透明度
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:1.0];
    
    //组合
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 0.5f;
    animationGroup.repeatCount = 1;//HUGE_VALF;     //HUGE_VALF,源自math.h
    animationGroup.delegate = self;
    [animationGroup setAnimations:[NSArray arrayWithObjects:animation, opacityAnimation, nil]];//zu
    
    [image100.layer addAnimation:animationGroup forKey:@"animationGroup"];
    [image200.layer addAnimation:animationGroup forKey:@"animationGroup"];
    [image300.layer addAnimation:animationGroup forKey:@"animationGroup"];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        UIImageView *image100 = [self viewWithTag:100];
        UIImageView *image200 = [self viewWithTag:200];
        UIImageView *image300 = [self viewWithTag:300];
        image100.alpha = 1;
        image200.alpha = 1;
        image300.alpha = 1;
    }
}
@end
