//
//  BasicAnimationUtils.h
//  
//
//  Created by Marco on 11-5-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//hexadecimal 十六进制

#import <Foundation/Foundation.h>


@interface BasicAnimationUtils : NSObject {

}

/**
 *  @Author Liudongqi, 14-10-16 10:10:10
 *
 *  横向移动动画
 *
 *  @param time 时间
 *  @param x    X值
 *
 *  @return CABasicAnimation
 */
+(CABasicAnimation *)moveX:(float)time X:(NSNumber *)x;//横向移动

/**
 *  @Author Liudongqi, 14-10-16 10:10:37
 *
 *  缩放动画
 *
 *  @param Multiple      原大小
 *  @param orginMultiple 目标大小
 *  @param time          时间
 *  @param repeatTimes   重复次数
 *
 *  @return <#return value description#>
 */
+(CABasicAnimation *)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time RepeatTimes:(float)repeatTimes;//缩放
@end
