//
//  Common.m
//  YMProject
//
//  Created by sam.l on 14-10-27.
//  Copyright (c) 2014年 bluemobi. All rights reserved.
//

#import "Common.h"
#import "UserInfoModel.h"
#import "SaveUserInfo.h"
#import "NSString+MD5.h"
@implementation Common

/**
 *根据颜色生成图片
 */
+(UIImage *)createImageByColor:(UIColor *)color{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

/**
 *check NSNULL返回id
 */
+ (id)checkNSNull:(id)obj{
    if (obj == [NSNull null]||obj==nil){
        obj=@"";
    }
    return [NSString stringWithFormat:@"%@",obj];
}

//判断是否登录
+(BOOL)isLogin{
    BOOL isflage=NO;
    UserInfoModel*usermodel=[SaveUserInfo loadCustomObjectWithKey];
    if(usermodel.userId!=nil)
    {
        isflage=YES;
    }
    return isflage;
}

//计算文本长度
+(float)getNSStringWidth:(NSString*)str font:(UIFont*)theFont
{
    float width=0.0f;
    CGSize sizeName = [str sizeWithFont:theFont
                      constrainedToSize:CGSizeMake(MAXFLOAT, 0.0)
                          lineBreakMode:NSLineBreakByWordWrapping];
    width=sizeName.width;
    return width;
}

//MD5加密，用于登录和服务器同步加密
+(NSString*)encodeMD5:(NSString*)stringmd5
{
    NSString* str1=[stringmd5 MD5];
    NSString* str2=[NSString stringWithFormat:@"%@%@",str1,stringmd5];
    NSString* str3=[str2 MD5];
    NSString* str4=[NSString stringWithFormat:@"%@%@",str3,stringmd5];
    NSString* str5=[str4 MD5];
    return str5;
}

//获取系统当前时间
+(NSString*)getDateNow
{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd HH:MM:SS"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    return locationString;
}



//拼接请求字符串
+(NSString*)getURLParamstring:(NSString*)json
{
    NSString * time=[Common getDateNow];
    NSString * accesstoken = [Common encodeMD5:[NSString stringWithFormat:@"%@%@",json,time]];
    
    NSMutableDictionary*Dicparameters=[[NSMutableDictionary alloc]init];
    [Dicparameters setObject:[NSString stringWithFormat:@"%@",json] forKey:@"accessParam"];
    [Dicparameters setObject:[NSString stringWithFormat:@"%@",time] forKey:@"accessTime"];
    [Dicparameters setObject:[NSString stringWithFormat:@"%@",accesstoken] forKey:@"accessToken"];
    [Dicparameters setObject:[NSString stringWithFormat:@"%@",@"2"] forKey:@"deviceId"];
    
    //拼接访问地址
    NSMutableString*sb=[[NSMutableString alloc]init];
    
    NSString*keyword=[Dicparameters objectForKey:@"accessParam"];
    if(keyword!=nil){
        if(![keyword isEqualToString:@""])
            [sb appendFormat:@"accessParam=%@&",keyword];
    }
    NSString*keytype=[Dicparameters objectForKey:@"accessTime"];
    if(keytype!=nil){
        if(![keytype isEqualToString:@""])
            [sb appendFormat:@"accessTime=%@&",keytype];
    }
    
    NSString*categoryId1=[Dicparameters objectForKey:@"accessToken"];
    if(categoryId1!=nil){
        if(![categoryId1 isEqualToString:@""])
            [sb appendFormat:@"accessToken=%@&",categoryId1];
    }
    NSString*categoryIdq=[Dicparameters objectForKey:@"deviceId"];
    if(categoryIdq!=nil){
        if(![categoryId1 isEqualToString:@""])
            [sb appendFormat:@"deviceId=%@&",categoryIdq];
    }
    
    NSString*strurl=[NSString stringWithString:sb];
    NSString*strtemp=[strurl substringFromIndex:[strurl length]-1];
    if([strtemp isEqualToString:@"&"])
    {
        strurl=[strurl substringToIndex:[strurl length]-1];
    }
    strurl = [strurl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return strurl;
}

//时间搓转换为时间格式
+(NSDate *)NSDateFromNSString:(NSString *)date
{
    NSTimeInterval userTime = [date doubleValue];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"yyyy.MM.dd"];
    NSDate *da = [NSDate dateWithTimeIntervalSince1970:userTime];
    return da;
}

//时间搓转换为字符串格式
+(NSString *)yearFromAPIDate:(NSString*)date
{
    NSTimeInterval userTime = [date doubleValue];
    
    //设定时间格式,这里可以设置成自己需要的格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // [dateFormatter setDateFormat:@"MM月dd"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    //这里比较关键,需要将NSTimeInterval除以1000
    NSString *iosDate = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:userTime]];
    return iosDate;
}

//时间搓转换为字符串格式
+(NSString *)dataFromAPIDate:(NSString*)date
{
    NSTimeInterval userTime = [date doubleValue];
    
    //设定时间格式,这里可以设置成自己需要的格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // [dateFormatter setDateFormat:@"MM月dd"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:MM:SS"];
    
    //这里比较关键,需要将NSTimeInterval除以1000
    NSString *iosDate = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:userTime]];
    return iosDate;
}

+(void)copyright:(UIView*)iv
{
    if(iscopyright>0)
    {
        UIImageView*copyrightImageView=[[UIImageView alloc] init];
        copyrightImageView.frame= CGRectMake(0, KScreenHeight-50-23-64, KScreenWidth, 23);
        copyrightImageView.image=[UIImage imageNamed:@"copyright"];
        [iv addSubview:copyrightImageView];
    }
}

#pragma mark - IntegralConvertTableViewCellDelegate
+ (void)showAlertView:(id)sender hintText:(NSString *)hintText
            TitleText:(NSString *)titleText DetailText:(NSString *)detailText hasCancel:(BOOL)hasCancel ensureAction:(SEL)ensureAction{
    UIImageView *alphaView = [Common createBackgroundViewWithHeight:200 andTitle:hintText];
    UIView *blackView = [alphaView viewWithTag:100];
    UIButton *ensureButton = [Common createButtonWithTitle:@"确 定" buttonTag:88 andY:blackView.frame.size.height -38*2 -20 view:blackView];
    [blackView addSubview:ensureButton];
    __block UIImageView *weakAlphaView = alphaView;
    __block UIView *weakBlackView = blackView;
    if (ensureAction && [sender respondsToSelector:ensureAction]) {
        [ensureButton handleControlEvent:UIControlEventTouchUpInside withBlock:^{
            [weakAlphaView removeFromSuperview];
            weakAlphaView = nil;
            weakBlackView = nil;
            [sender performSelector:ensureAction];
        }];
    }else{
        [ensureButton handleControlEvent:UIControlEventTouchUpInside withBlock:^{
            [weakAlphaView removeFromSuperview];
            weakAlphaView = nil;
            weakBlackView = nil;
            
        }];
    }
    
    if (hasCancel) {
        UIButton *cancelButton = [Common createButtonWithTitle:@"取 消" buttonTag:12 andY:blackView.frame.size.height -38 -10 view:blackView];
        [blackView addSubview:cancelButton];
        __block UIImageView *weakAlphaView = alphaView;
        __block UIView *weakBlackView = blackView;
        [cancelButton handleControlEvent:UIControlEventTouchUpInside withBlock:^{
            
            [weakAlphaView removeFromSuperview];
            weakAlphaView = nil;
            weakBlackView = nil;
        }];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 44, blackView.frame.size.width, 22)];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont boldSystemFontOfSize:15];
        label.text = titleText;
        label.numberOfLines = 2;
        label.textAlignment = NSTextAlignmentCenter;
        [blackView addSubview:label];
    }else{
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 44, blackView.frame.size.width, 66)];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont boldSystemFontOfSize:15];
        label.text = titleText;
        label.numberOfLines = 3;
        label.textAlignment = NSTextAlignmentCenter;
        [blackView addSubview:label];    }
    
    if (detailText && ![detailText isEqualToString:@""]) {
        
        UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 66, blackView.frame.size.width, 22*2)];
        label2.textColor = DEF_COLOR(228, 0, 115);
        label2.font = [UIFont systemFontOfSize:15];
        label2.minimumScaleFactor = 12.0;
        label2.text = detailText;
        label2.numberOfLines = 2;
        label2.textAlignment = NSTextAlignmentCenter;
        [blackView addSubview:label2];
    }
}

/**
 *  创建一个button
 */
+ (UIButton *)createButtonWithTitle:(NSString *)title buttonTag:(int)tag andY:(float)y view:(UIView *)view{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20, y, view.frame.size.width -40, 38)];
    button.tag = tag;
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"Button_bg"] forState:UIControlStateNormal];
    if ([title isEqualToString:@"取消"] || [title isEqualToString:@"返回"]) {
        [button setBackgroundImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
        [button setTitleColor:DEF_COLOR(227, 0, 94) forState:UIControlStateNormal];
    } 
    return button;
}

/**
 *  创建半透明界面和提示框
 *
 *  @param height 提示框高度
 */
+(UIImageView *)createBackgroundViewWithHeight:(float)height andTitle:(NSString *)title
{
    UIImageView *alphaView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    alphaView.image = [UIImage imageNamed:@"alphaBG"];
    alphaView.userInteractionEnabled = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:alphaView];
    
    UIView *blackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth -KScreenWidth*5/32, height +10)];
    blackView.center = CGPointMake(KScreenWidth /2, [UIApplication sharedApplication].keyWindow.bounds.size.height/2);
    blackView.backgroundColor = [UIColor whiteColor];
    //    _blackView.userInteractionEnabled = YES;
    blackView.tag = 100;
    [alphaView addSubview:blackView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, blackView.frame.size.width -40, 24)];
    titleLabel.text = title;
    titleLabel.textColor = DEF_COLOR(228, 0, 115);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [blackView addSubview:titleLabel];
    return alphaView;
}

@end
