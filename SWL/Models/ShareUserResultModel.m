
//
//  ShareUserResultModel.m
//  SWL
//
//  Created by Liudq on 16/2/17.
//
//

#import "ShareUserResultModel.h"

@implementation ShareUserResultModel

-(void)fromDic:(NSDictionary *)dic{
    if ([dic objectForKey:@"result"]) {
        _result = [dic objectForKey:@"result"];
    }
    if ([dic objectForKey:@"makeUpImgUrl"]) {
        self.makeUpImgUrl = [dic objectForKey:@"makeUpImgUrl"];
    }
    if ([dic objectForKey:@"tdCodeUrl"]) {
        self.tdCodeUrl = [dic objectForKey:@"tdCodeUrl"];
    }
}

-(void)fromRestApiDic:(NSDictionary *)dic{ 
    if ([dic objectForKey:@"makeUpImgUrl"]) {
        self.makeUpImgUrl = [dic objectForKey:@"makeUpImgUrl"];
    }
    if ([dic objectForKey:@"photoUrl"]) {
        self.tdCodeUrl = [dic objectForKey:@"photoUrl"];
    }
    if ([dic objectForKey:@"content"]) {
        self.tdCodeUrl = [dic objectForKey:@"content"];
    }
    if ([dic objectForKey:@"nickname"]) {
        self.tdCodeUrl = [dic objectForKey:@"nickname"];
    }
}
@end
