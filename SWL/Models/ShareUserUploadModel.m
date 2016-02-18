//
//  ShareUserModel.m
//  SWL
//
//  Created by Liudq on 16/2/17.
//
//

#import "ShareUserUploadModel.h"

@implementation ShareUserUploadModel


-(NSMutableDictionary *)toDictionary{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    if (_imageFormKey) {
//        [dic setObject:_imageFormKey forKey:@"imageFormKey"];
//    }
    if (_nickname) {
        [dic setObject:_nickname forKey:@"nickName"];
    }
    if (_comment) {
        [dic setObject:_comment forKey:@"comment"];
    }
    if (_realName) {
        [dic setObject:_realName forKey:@"realName"];
    }
    if (_sex) {
        [dic setObject:_sex forKey:@"sex"];
    }else{
        [dic setObject:@"0" forKey:@"sex"];
    }
    if (_phone) {
        [dic setObject:_phone forKey:@"phone"];
    }
    if (_location) {
        [dic setObject:_location forKey:@"location"];
    }
    if (_shopName) {
        [dic setObject:_shopName forKey:@"shopName"];
    }
    if (_VIPPhone) {
        [dic setObject:_VIPPhone forKey:@"VIPPhone"];
    }
    
    return dic;
}

-(NSString *)toURLParamString{
    NSMutableString *string = [NSMutableString string];
    if (_nickname) {
        [string appendString:[NSString stringWithFormat:@"nickName=%@", _nickname]];
    }
    if (_comment) {
        [string appendString:[NSString stringWithFormat:@"&comment=%@", _comment]];
    }
    if (_realName) {
        [string appendString:[NSString stringWithFormat:@"&realName=%@", _realName]];
    }
    if (_sex) {
        [string appendString:[NSString stringWithFormat:@"&sex=%@", _sex]];
    }
    if (_phone) {
        [string appendString:[NSString stringWithFormat:@"&phone=%@", _phone]];
    }
    if (_location) {
        [string appendString:[NSString stringWithFormat:@"&location=%@", _location]];
    }
    if (_shopName) {
        [string appendString:[NSString stringWithFormat:@"&shopName=%@", _shopName]];
    }
    if (_VIPPhone) {
        [string appendString:[NSString stringWithFormat:@"&VIPPhone=%@", _VIPPhone]];
    }
    return string;
}
@end
