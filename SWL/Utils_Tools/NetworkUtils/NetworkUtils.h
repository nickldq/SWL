//
//  NetworkUtils
//  
//
//  Created by Liudongqi on 14-10-11.
//  Copyright 2014 __KY__. All rights reserved.
//hexadecimal 十六进制

#import <Foundation/Foundation.h>


@interface NetworkUtils : NSObject {

}

/**
 *  @Author Liudongqi, 14-10-16 11:10:34
 *
 *  获取网卡地址,ios7+失效
 *
 *  @return NSString
 */
+ (NSString *) macaddress;

#pragma mark - 获取局域网IP地址
/**
 *@return NSString
 */
+ (NSString *)getLocalIPAddress;
@end
