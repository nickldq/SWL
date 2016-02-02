//
//  UtilRequestService.m
//  SouthMedia
//
//  Created by Liudq on 14-7-31.
//  Copyright (c) 2014年 pandoranews. All rights reserved.
//

#import "UtilRequestService.h"
#import "kConstants.h"
#import "NSJSONSerialization+NSJSONSerializationCategory.h"

@implementation UtilRequestService

#pragma mark -
#pragma mark 根据长url向新浪网申请短url

+(NSString *)sendSinaShortURLRequest:(NSString *)longUrl{
    NSString *short_url = NULL;
    NSString *appkey = @"";
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        appkey = kSinaWeiboAppKey;
    }else{
        appkey = kSinaWeiboAppKey_iphone;
    }
    
//    NSURLRequest *theRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:
//                                                            [NSString stringWithFormat:@"http://api.t.sina.com.cn/short_url/shorten.json?source=%@&url_long=%@", appkey, longUrl]]
//                                            cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                            timeoutInterval:60.0];
//    NSData *returnData = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:nil error:nil];
    
    NSString *requestStr = [NSString stringWithContentsOfURL:[NSURL URLWithString:
                                                              [NSString stringWithFormat:@"http://api.t.sina.com.cn/short_url/shorten.json?source=%@&url_long=%@", appkey, longUrl]] encoding:NSUTF8StringEncoding error:nil];
    NSArray *arr = [NSJSONSerialization toArrayOrNSDictionaryWithJsonstring:requestStr];
    NSDictionary *dic = [arr firstObject];
    if ([dic objectForKey:@"url_short"]) {
        short_url = [dic objectForKey:@"url_short"];
    }

    return short_url;
}
@end
