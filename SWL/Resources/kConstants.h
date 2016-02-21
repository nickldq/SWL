//
//  Constants.h
//  ocj
//
//  Created by Pandoranew
//  Copyright (c) 2014年 Pandoranew. All rights reserved.
//

/**
 ┏┓　　　┏┓
 ┏┛┻━━━┛┻┓
 ┃　　　  ┃
 ┃   ━   ┃
 ┃ ┳┛ ┗┳ ┃
 ┃　　　  ┃
 ┃   ┻   ┃
 ┃       ┃
 ┗━┓   ┏━┛
   ┃   ┃ 神兽保佑
   ┃   ┃ 代码无BUG！
   ┃   ┗━━━┓
   ┃       ┣┓
   ┃       ┏┛
   ┗┓┓┏━┳┓┏┛
    ┃┫┫ ┃┫┫
    ┗┻┛ ┗┻┛
 */
/*
                 _ooOoo_
                o8888888o
                88" . "88
                (| -_- |)
                O\  =  /O
             ____/`---'\____
           .'  \\|     |//  `.
          /  \\|||  :  |||//  \
         /  _||||| -:- |||||-  \
         |   | \\\  -  /// |   |
         | \_|  ''\---/''  |   |
         \  .-\__  `-`  ___/-. /
       ___`. .'  /--.--\  `. . __
    ."" '<  `.___\_<|>_/___.'  >'"".
   | | :  `- \`.;`\ _ /`;.`/ - ` : | |
   \  \ `-.   \_ __\ /__ _/   .-` /  /
======`-.____`-.___\_____/___.-`____.-'======
                 `=---='

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
           佛祖保佑       永无BUG
           心外无法       法外无心
 */

/*
 　/＼7　　　 ∠＿/
 　 /　│　　 ／　／
 　│　Z ＿,＜　／　　 /`ヽ
 　│　　　　　ヽ　　 /　　〉
 　 Y　　　　　`　 /　　/
 　ｲ●　､　●　　⊂⊃〈　　/
 　()　 へ　　　　|　＼〈
 　　>ｰ ､_　 ィ　 │ ／／
   / へ　　 /　ﾉ＜| ＼＼
 　 ヽ_ﾉ　　(_／　 │／／
 　　7　　　　　　　|／
 　　＞―r￣￣`ｰ―＿
*/

/*
 金 三 胖你也去吧！！
 ...........／￣￣￣Y￣￣ ＼
 　 　 l　　　　　　　　　l
 　　 ヽ,,,,,／ ￣￣￣￣ ヽﾉ
 　　　|::::: 　　　　　　　l
 　　　|:::　　 ＿_　　　　 |
 　　（6　　　＼●>　 <●人
 　　　!　　　　　 )・・(　 l
 　　　ヽ 　 　　　　(三)　 ﾉ
 　　　 ／＼　　　　二　 ノ
 　　 /⌒ヽ. ‘ー — 一* ＼
 　　l　　　 |　　　　　 ヽo　ヽ
 有人说我是水经验 我转身就给他一嘴巴子 你丫不是废话吗？不水怎么升级。上帝的骑宠，上古时期世界的霸主。
 汉语：我是来打酱油的。
 日语: 私は醤油がほしいんだけど。
 英语： I'm going to buy some soy sauce.
 韩语： 나는 간장 소스.
 德语： ich gehe Sojasosse kaufen.
 法语： je me suis prend que sauce de soja.
 俄语： Я пришла за соевым соусом.
 荷兰语：kwam ik tot een sojasaus
 西班牙语：me vino a un salsa de soja
 意大利语：venuta solo a comprare la salsa di soia.
*/

#ifndef ocj_Constants_h
#define ocj_Constants_h

#ifdef DEBUG
#       define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#       define DLog(...)
#endif

// ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#endif

#define kBaseURL_PATH @"http://www.nfmedia.com/"
/*------------常量-------------*/
#define kRequestMethodGet @"get"
#define kRequestMethodPost @"post"
#define kProgressHubLoading @"加载中......"
#define kProgressHubFail @"加载失败.."
#define kProgressHubDisconnect @"网络连接失败！请重试！"

/*------------宏-------------*/
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )//#ifdef __IPHONE_7_0  #endif

#define IOS8_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending ) //#ifdef __IPHONE_8_0


#define IOS6_7_DELTA(V,X,Y,W,H) if(IOS7_OR_LATER) {CGRect f = V.frame;f.origin.x += X;f.origin.y += Y;f.size.width +=W;f.size.height += H;V.frame=f;}

#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

#define degreeTOradians(x) (M_PI * (x)/180)



/*----- 分享  -----*/
#define kShareToWechatSessionTitle @"分享到微信好友"
#define kShareToWechatSessionTimelineTitle @"分享到微信朋友圈"
#define kWechatAppID @"wxef3aa807099f8bf0"
#define kWechatAppSecret @"ebb3ec86caa27755968e9031956c2816"
#define kWechatAppID_iphone @"wx33aefe04f9816331"
#define kWechatAppSecret_iphone @"e0e146e126de6e2ac76eb12000876b13"
#define kWechatRedirectUri @"http://t.qq.com/appandora"

#define kShareToSinaWeiboTitle @"分享到新浪微博"
#define kSinaWeiboAppKey @"1744307791"
#define kSinaWeiboAppSecret @"5e3eaa1a7c8f0cc215c945254c36013d"
#define kSinaWeiboRedirectUri @"http://weibo.com/appandora"


#define kSinaWeiboAppKey_iphone @"3093413022"
#define kSinaWeiboAppSecret_iphone @"16398f18160c5c9b43a8e608c3bf7018"

#define kShareToTecentWeiboTitle @"分享到腾讯微博"
#define kTecentWeiboAppKey @"801508992"
#define kTecentWeiboAppSecret @"625a65c3435fab43c0e89c40ee49fab5"
#define kTecentWeiboAppKey_ipad @"1101992965"
#define kTecentWeiboAppSecret_ipad @"sOWOCdo8ubikFfTu"
#define kTecentWeiboAppRedirectUri @"http://t.qq.com/appandora?preview"
#define kTecentWeiboAppRedirectUri_ipad @"https://itunes.apple.com/cn/app/id899006801"

#define kShareToKaixinTitle @"分享到开心网"
#define kKaixinAppID @"100060974"
#define kKaixinAppKey @"683369467443e2aa9d9a08d476c6d0e8"
#define kKaixinAppSecret @"3dd7b3e18ece805bcbfd2da5802b690a"
#define kKaixinRedirectUri @"http://www.kaixin001.com/appandora"

#define kShareToRenrenTitle @"分享到人人网"
#define kRenrenAppID @"269536"
#define kRenrenAppKey @"1603c784830241ea915b15a599b64c2b"
#define kRenrenAppSecret @"3ab8842e3ff54db0bf24ffc47deeac5c"
#define kRenrenRedirectUri @"http://www.renren.com/818374859/"

/*----- URL_PICKER  -----*/
#define kUrlPicker_object @"kUrlPicker_object" //url设置
#define kUrlPicker_UserDefault [[NSUserDefaults standardUserDefaults] objectForKey:kUrlPicker_object]


/*------------服务器地址(IP)-------------*/
#define REQUEST_PATH_Test @"http://swl.d2c-china.cn/php/upload.php" //测试服务

#define REQUEST_PATH @"http://swl.d2c-china.cn" //正式服务


#define PHP_UPLOAD @"php/upload.php" //上传接口
#define PHP_GetAllCity @"php/getAllCity.php" //获取地区接口
#define PHP_GetAllShopByCity @"php/getAllShopByCity.php?cityName=" //上传接口


/*----- appStoreUrl  -----*/
#pragma mark - appStoreUrl
#define appStoreUrl [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://itunes.apple.com/lookup?id=899005232"] encoding:NSUTF8StringEncoding error:nil]
#define appStoreUrl_ipad [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://itunes.apple.com/lookup?id=899006801"] encoding:NSUTF8StringEncoding error:nil]


/**新首页新接口获取栏目 zip
 starttime 请求的时间（2014-06-24 16:49:01）
 flag  请求时间向前还是向后  1向前 2向后
 num 请求的个数
 
 return 返回压缩包的文件流
 */
#define kMainPageZipDownload(starttime, flag, num)  [NSMutableString stringWithFormat:@"phone/article/zipDownload/%@/%d/%d", starttime, flag, num]       // 获得所有栏目列表 
#define kMainPageZipDownloadPrev 1
#define kMainPageZipDownloadNext 2
#define kMainPageZipDownloadNum 20
