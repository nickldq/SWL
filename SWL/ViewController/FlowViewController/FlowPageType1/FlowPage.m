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
//    [self clearView];
}

-(void)clearView{
    UIImageView *image100 = [self viewWithTag:100];
    UIImageView *image200 = [self viewWithTag:200];
    UIImageView *image300 = [self viewWithTag:300];
    image100.alpha = 0;
    image200.alpha = 0;
    image300.alpha = 0;
    image100.image = [UIImage imageNamed:_flowImageArray[0]];
    image200.image = [UIImage imageNamed:_flowImageArray[1]];
    image300.image = [UIImage imageNamed:_flowImageArray[2]];
}

-(void)playAnimation{
    [self clearView];
    
    [UIView animateWithDuration:0.8 animations:^{
        
        UIImageView *image100 = [self viewWithTag:100];
        UIImageView *image200 = [self viewWithTag:200];
        UIImageView *image300 = [self viewWithTag:300];
        image100.alpha = 1;
        image200.alpha = 1;
        image300.alpha = 1;
    }];
}

//-(void)playAnimation{
//    
//    UIImageView *image100 = [self viewWithTag:100];
//    UIImageView *image200 = [self viewWithTag:200];
//    UIImageView *image300 = [self viewWithTag:300];
//    image100.alpha = 0;
//    image200.alpha = 0;
//    image300.alpha = 0;
//    CABasicAnimation *animation = [BasicAnimationUtils scale:[NSNumber numberWithFloat:1.0] orgin:[NSNumber numberWithFloat:0.0] durTimes:0.5 RepeatTimes:1];//缩放
//    
//    //透明度
//    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    opacityAnimation.fromValue = [NSNumber numberWithFloat:0.0];
//    opacityAnimation.toValue = [NSNumber numberWithFloat:1.0];
//    
//    //组合
//    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
//    animationGroup.duration = 0.5f;
//    animationGroup.repeatCount = 1;//HUGE_VALF;     //HUGE_VALF,源自math.h
//    animationGroup.delegate = self;
//    [animationGroup setAnimations:[NSArray arrayWithObjects:animation, opacityAnimation, nil]];//zu
//    
//    [image100.layer addAnimation:animationGroup forKey:@"animationGroup"];
//    [image200.layer addAnimation:animationGroup forKey:@"animationGroup"];
//    [image300.layer addAnimation:animationGroup forKey:@"animationGroup"];
//}

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


-(void)randomChangeFlowImagesWithCurrentPage:(int)page CustomerAmount:(int)customerAmount{
    if (_flowImageArray) {
        [_flowImageArray removeAllObjects];
    }else{
        _flowImageArray = [NSMutableArray array];
    }
    
    //随机数从这里边产生 1,2,3,4,5,6,(7)
    NSMutableArray *startArray=[NSMutableArray array];
    for (int i = 1; i<=customerAmount; i++) {
        [startArray addObject:[NSString stringWithFormat:@"%i", i]];
    }
    //随机数产生结果
    NSMutableArray *resultArray=[NSMutableArray array];
    //随机数个数
    NSInteger m=3;//每页三组数据
    for (int i=1; i<=m; i++) {
        
        int t=arc4random()%startArray.count;
        int x =[startArray[t] intValue];//第几个顾客
        startArray[t]=[startArray lastObject]; //为更好的乱序，故交换下位置
        [startArray removeLastObject];//去掉生成过多数
        
        NSString *flowImageName = [NSString stringWithFormat:@"flow%i-%i_%i.png", page+1,  x, i];
        [_flowImageArray addObject:flowImageName];
//        NSLog(flowImageName);
    }
    
    [self playAnimation];

}
@end
