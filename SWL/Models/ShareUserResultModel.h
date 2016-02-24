//
//  ShareUserResultModel.h
//  SWL
//
//  Created by Liudq on 16/2/17.
//
//

#import <Foundation/Foundation.h>

@interface ShareUserResultModel : NSObject

@property (nonatomic, strong) NSString *result;//jieguo
@property (nonatomic, strong) NSString *status;//200表示成功，body是Json格式的证言数据（你们大概只用关心返回码）status非200表示失败

@property (nonatomic, strong) NSString *makeUpImgUrl;//头像图片

@property (nonatomic, strong) NSString *tdCodeUrl;// 二维码地址

-(void)fromDic:(NSDictionary *)dic;
@end
