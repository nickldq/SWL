//
//  ShareUserModel.h
//  SWL
//
//  Created by Liudq on 16/2/17.
//
//

#import <Foundation/Foundation.h>

@interface ShareUserUploadModel : NSObject

@property (nonatomic, strong) NSData *imageFormKey; //合成图
@property (nonatomic, strong) NSData *photo_data ;// 原图片
@property (nonatomic, strong) NSString *nickname;// 昵称，必填，10个字以内
@property (nonatomic, strong) NSString *comment;// 评论文字，必填，20个字以内
@property (nonatomic, strong) NSString *realName;// 真实姓名，必填，10个字以内
@property (nonatomic, strong) NSString *sex;// 性别，女：0，男：1，默认选择女
@property (nonatomic, strong) NSString *phone;// 手机号码，必填，跳出数字键盘，11位数字判断
@property (nonatomic, strong) NSString *location;// 地区，必xuan
@property (nonatomic, strong) NSString *shopName;// 门店，必xuan
@property (nonatomic, strong) NSString *VIPPhone;// 会员手机，跳出数字键盘，不是必填

-(NSMutableDictionary *)toDictionary;

-(NSString *)toURLParamString;
@end
