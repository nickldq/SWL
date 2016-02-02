//
//  NSJSONSerialization+NSJSONSerializationCategory.h
//  SouthMedia
//
//  Created by Liudq on 14-5-13.
//  Copyright (c) 2014年 pandoranews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "kConstants.h"

@interface NSJSONSerialization (NSJSONSerializationCategory)

/**
 *  @Author Liudongqi, 14-10-16 10:10:16
 *
 *  NSArrayOrNSDictionary类型数据转成jsonString
 *
 *  @param theData NSArrayOrNSDictionary类型数据
 *
 *  @return NSString
 */
+ (NSString *)jsonStringWithJSONObject:(id)theData;

/**
 *  @Author Liudongqi, 14-10-16 10:10:59
 *
 *  jsonString类型数据转成NSArrayOrNSDictionary
 *
 *  @param jsonString
 *
 *  @return NSArrayOrNSDictionary
 */
+ (id)toArrayOrNSDictionaryWithJsonstring:(NSString *)jsonString;
@end
