//
//  ShareCommon.h
//
//
//  Created by xxx on 14-1-20.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"
#import "WXApiObject.h"
#import "ShareSDK/ShareSDK.h"
#import "AppDelegate.h"

@interface ShareCommon : NSObject<WXApiDelegate>
{
    
@private
    UITableView *_tableView;
    ShareType _followType;
    id _appDelegate;
    
    BOOL _ssoEnable;
    
    UIWebView *_webView;
}

@property(weak,nonatomic) UIViewController* shareDele;

//@property (nonatomic, strong)	CommodityDetailsModel			*commodityDetails

+(ShareCommon*)shareInstance;

/**
 *  微信分享
 *
 *  @param type 分享类型(好友->0/朋友圈->1)
 */
-(void)shareToWeixin:(int)type;

#pragma mark ShareSDK API

/**
 *  @brief	分享到腾讯微博
 *
 *  @param sender         点击按钮
 *  @param title          标题
 *  @param content        内容
 *  @param defaultContent 默认分享内容
 *  @param image          图片链接
 *  @param type           分享种类
 *  @param URL            链接
 *	@param 	description 	主体内容（人人）
 *	@param 	mediaType 	分享类型（QQ、微信）
 */
- (void)shareClickHandler:(UIButton *)sender
                    title:(NSString *)title
                  content:(NSString *)content
           defaultContent:(NSString *)defaultContent
                    image:(NSString *)image
                      url:(NSString *)url
              description:(NSString *)description
                mediaType:(SSPublishContentMediaType)mediaType
                shareType:(ShareType)type;
@end
