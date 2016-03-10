//
//  ShareCommon.m
//  
//
//  Created by xxx on 14-1-20.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "ShareCommon.h"
#import "AppDelegate.h"

@implementation ShareCommon

-(id)init{
    if(self = [super init]) {
        //        _commodityDetails = [CommodityDetailsModel shareInstance];
        _appDelegate = [UIApplication sharedApplication].delegate;
    }
    return self;
}


+(ShareCommon*)shareInstance{
    
    static ShareCommon* instance;
    @synchronized(self){
        if (!instance ) {
            instance = [[ ShareCommon alloc ] init];
        }
	}
	return instance;
}

/**
 *  微信分享
 *
 *  @param type 分享类型(朋友圈/好友)
 */
-(void)shareToWeixin:(int)type{
    if (![WXApi isWXAppInstalled]) {
        [ProgressHUDUtils showErrorLoading:@"请安装微信后才能进行分享!"];
    }else if(![WXApi isWXAppSupportApi]){
        [ProgressHUDUtils showErrorLoading:@"请更新至最新版本的微信后才能进行分享!"];
    }else{
//        //                NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
//        
        if(type == 0) //微信好友
            [self sendMsgToWeixin:WXSceneSession];
        
        if(type == 1) {//微信朋友圈
            [self sendMsgToWeixin:WXSceneTimeline];
        }
    }
}

- (void)sendMsgToWeixin:(enum WXScene) wxscene{
//    NSString *strName = [NSString stringWithFormat:@"xx客户端的%@不错，分享给大家。", self.commodityDetails.commodityItemName];
    NSString *strName = [NSString stringWithFormat:@"xx客户端的%@不错，分享给大家。"];
    
    //		NSString *strDescription = [NSString stringWithFormat:@"我在xxx客户端购买了%@，价格：%@元，分享给大家。%@",self.commodityDetails.commodityItemName,self.commodityDetails.commoditySalePrice,self.commodityDetails.commodityShareUrl;
    
    //		NSMutableDictionary *params = [NSMutableDictionary dictionary];
    //		[params setValue:self.commodityDetails.commodityShareUrl forKey:@"url"];
    //		[params setValue:strName forKey:@"name"];
    //		[params setValue:strDescription forKey:@"description"];
    //		[params setValue:self.commodityDetails.commodityItemImagePath forKey:@"image"];
    //		[params setValue:@"publish_feed" forKey:@"access_token"];
    //        [params setValue:@"应用名称" forKey:@"action_name"];
    //        [params setValue:@"http://www.xxx.com.cn" forKey:@"action_link"];
    
    // 发送内容给微信
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"title";
//    message.title = self.commodityDetails.commodityItemName;
    message.description = strName;
    //    ext.extInfo = @"<xml>test</xml>";
    //    NSString *appUrl = [NSString stringWithFormat:@"ocjapp://app=ocjapp&&objectID=%@", self.commodityDetails.commodityItemCode];
    NSURL *imgUrl = nil;

////
////    
//    imgUrl = [NSURL URLWithString:self.commodityDetails.commodityItemImagePath];
    
    [message setThumbImage:[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:imgUrl]]];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    
    NSString *appUrl = @"";
 
    ext.webpageUrl = appUrl;
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = wxscene;
    
    [WXApi sendReq:req];
}

-(void) onResp:(BaseResp*)resp
{
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        NSString *strTitle = [NSString stringWithFormat:@"发送结果"];
        NSString *strMsg = [NSString stringWithFormat:@"发送媒体消息结果:%d", resp.errCode];
//        [MobClick event:@"ShareToWeixin"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

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
                shareType:(ShareType)type
{
    [ShareSDK cancelAuthWithType:type];
    id imageID = @"";
    if (nil == image || [image isEqualToString:@""]) {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            imageID = [ShareSDK pngImageWithImage:LOADIMAGE(@"icon_72", @"png")];
        }else{
            imageID = [ShareSDK pngImageWithImage:LOADIMAGE(@"icon57", @"png")];
        }
    }else{
        imageID = [ShareSDK pngImageWithImage:[[UIImage alloc ]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:image]]]];//[ShareSDK imageWithUrl:image];
    }
    
    NSString *contentString = content;
    if (type == ShareTypeSinaWeibo || type == ShareTypeTencentWeibo) {
        contentString = [NSString stringWithFormat:@"「%@」：%@",title, content];
    }
    //创建分享内容
    //url 不能为空字符串 
    id<ISSContent> publishContent = [ShareSDK content:contentString
                                       defaultContent:defaultContent
                                                image:imageID
                                                title:title
                                                  url:url
                                          description:description
                                            mediaType:mediaType];
    
    //创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
    id<ISSAuthOptions> authOptions;
//    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
//        [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
//        AppDelegatePad *dele = (AppDelegatePad *)_appDelegate;
//       authOptions = [ShareSDK authOptionsWithAutoAuth:YES
//                              allowCallback:YES
//                              authViewStyle:SSAuthViewStylePopup
//                               viewDelegate:nil
//                    authManagerViewDelegate:dele.viewDelegate];
//    }else{
        [container setIPhoneContainerWithViewController:[CommonMethodUtils superViewControllerByView:sender]];
        AppDelegate *dele = (AppDelegate *)_appDelegate;
        authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                          allowCallback:YES
                                          authViewStyle:SSAuthViewStyleFullScreenPopup
                                           viewDelegate:nil
                                authManagerViewDelegate:nil//dele.viewDelegate
                       ];
//    }
    
    //在授权页面中添加关注官方微博
    [authOptions setFollowAccounts:[NSDictionary dictionaryWithObjectsAndKeys:
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(type),
                                    [ShareSDK userFieldWithType:SSUserFieldTypeName value:@"ShareSDK"],
                                    SHARE_TYPE_NUMBER(type),
                                    nil]];
    
//    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
//        AppDelegatePad *dele = (AppDelegatePad *)_appDelegate;
//        //显示分享菜单
////        [ShareSDK showShareViewWithType:ShareTypeTencentWeibo
//         [ShareSDK showShareViewWithType:type
//                              container:container
//                                content:publishContent
//                          statusBarTips:NO
//                            authOptions:authOptions
//                           shareOptions:[ShareSDK defaultShareOptionsWithTitle:title
//                                                               oneKeyShareList:nil
//                                                                qqButtonHidden:YES
//                                                         wxSessionButtonHidden:YES
//                                                        wxTimelineButtonHidden:YES
//                                                          showKeyboardOnAppear:NO
//                                                             shareViewDelegate:dele.viewDelegate
//                                                           friendsViewDelegate:dele.viewDelegate
//                                                         picViewerViewDelegate:nil]
//                                 result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
//                                     
//                                     if (state == SSPublishContentStateSuccess)
//                                     {
//                                         [CommonMethodUtils dismissProgressHUDSuccessWithStatus:@"分享成功"];
//                                         NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
//                                     }
//                                     else if (state == SSPublishContentStateFail)
//                                     {
//                                         [CommonMethodUtils dismissProgressHUDErrorWithStatus:[error errorDescription]];
//                                         NSLog(@"分享失败!error code == %d, error errorDescription == %@" , [error errorCode], [error errorDescription]);
//                                     }
//                                 }];
//    }else{
//        AppDelegate *dele = (AppDelegate *)_appDelegate;
        //显示分享菜单
        //        [ShareSDK showShareViewWithType:ShareTypeTencentWeibo
        [ShareSDK showShareViewWithType:type
                              container:container
                                content:publishContent
                          statusBarTips:NO
                            authOptions:authOptions
                           shareOptions:[ShareSDK defaultShareOptionsWithTitle:title
                                                               oneKeyShareList:nil
                                                                qqButtonHidden:YES
                                                         wxSessionButtonHidden:YES
                                                        wxTimelineButtonHidden:YES
                                                          showKeyboardOnAppear:NO
                                                             shareViewDelegate:nil//dele.viewDelegate
                                                           friendsViewDelegate:nil//dele.viewDelegate
                                                         picViewerViewDelegate:nil]
                                 result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                     
                                     if (state == SSPublishContentStateSuccess)
                                     {
                                         [ProgressHUDUtils dismissProgressHUDSuccessWithStatus:@"分享成功"];
                                         NSLog(NSLocalizedString(@"TEXT_SHARE_SUC", @"分享成功"));
                                     }
                                     else if (state == SSPublishContentStateFail)
                                     {
                                         [ProgressHUDUtils dismissProgressHUDErrorWithStatus:[error errorDescription]];
                                         NSLog(@"分享失败!error code == %ld, error errorDescription == %@" , (long)[error errorCode], [error errorDescription]);
                                     }
                                     
                                     if (nil != self.shareDele && [self.shareDele respondsToSelector:@selector(shareEnd)]) {
                                         [self.shareDele performSelectorOnMainThread:@selector(shareEnd) withObject:nil waitUntilDone:NO];
                                     }
                                 }];
//    }
    
}

@end
