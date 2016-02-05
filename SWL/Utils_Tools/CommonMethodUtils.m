//
//  CommonMethodUtils.m
//  Ocj
//
//  Created by ocj ocjwork on 12-10-29.
//  Copyright 2012年 ocj. All rights reserved.
//

#import "CommonMethodUtils.h"
#import "ProgressHUD.h"
#import "SVProgressHUD.h"

#import <sys/sysctl.h>
@implementation CommonMethodUtils
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    return self;
}


/*
+(UILabel *)createNavTitle:(NSString *)titleStr{
    
	UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 220, 50)];
	[customLab setTextColor:kNavTitleColor];
	customLab.backgroundColor=[UIColor colorWithRed:255.0f/255 green:255.0f/255 blue:255.0f/255 alpha:0.0];
	[customLab setText:titleStr];
	customLab.font = kFontNameFour;
    //	customLab.shadowOffset = CGSizeMake(0.0, 1.0);
    //	customLab.shadowColor=kRubyColor;
	customLab.textAlignment = UITextAlignmentCenter;
    return customLab;
}*/

#pragma mark - 生成返回键

+ (UIBarButtonItem*) createBackButton:(UIViewController *)view
{
    UIImage* image= [UIImage imageNamed:@"返回键.png"];
    UIImage* imagef = [UIImage imageNamed:@"返回键(按下）.png"];
    CGRect backframe= CGRectMake(0, 0, 22, 21);
    UIButton* backButton= [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = backframe;
    [backButton setBackgroundImage:image forState:UIControlStateNormal];
    [backButton setBackgroundImage:imagef forState:UIControlStateHighlighted|UIControlStateSelected];
    [backButton addTarget:view action:@selector(popself) forControlEvents:UIControlEventTouchUpInside];
    //定制自己的风格的  UIBarButtonItem
    UIBarButtonItem* someBarButtonItem= [[UIBarButtonItem alloc] initWithCustomView:backButton];
    return someBarButtonItem;
}

#pragma mark - 给View加圆角&粗边框方法
+(void)makeViewRoundRectBorder:(UIView *)view{
    //设置layer
    CALayer *layer=[view layer];
    //是否设置边框以及是否可见
//    [layer setMasksToBounds:YES];
    //设置边框圆角的弧度
    [layer setCornerRadius:4.0];
    //设置边框线的宽
//    [layer setBorderWidth:1];
//    //设置边框线的颜色
//    [layer setBorderColor:[borderColor CGColor]];
//    UIColor *textbordercolor = [UIColor colorWithRed:210/255.0f green:212/255.0f blue:214/255.0f alpha:1];
}

#pragma mark - 给View加圆角&阴影方法
+ (void)dropShadowAndRoundRect:(UIView *)view{
    //设置layer
    CALayer *layer=[view layer];
    //是否设置边框以及是否可见
    [layer setMasksToBounds:YES];
    //设置边框圆角的弧度
    [layer setCornerRadius:6.0];
    //设置边框线的宽
    [layer setBorderWidth:1];
    //设置边框线的颜色
    [layer setBorderColor:[[UIColor whiteColor] CGColor]];
    layer.masksToBounds = YES;
    layer.shadowColor = [UIColor darkGrayColor].CGColor;
    layer.shadowOffset = CGSizeMake(0, 1);
    layer.shadowOpacity = 0.7;
    
    // Default clipsToBounds is YES, will clip off the shadow, so we disable it.
//    view.clipsToBounds = NO;
}

#pragma mark - 寻找某View在类中的父View
/**
 *@param  (Class)myclass //类名
 *
 *@param  (UIView *)child //View名
 *
 *@return void
 */
+ (UIView*)superviewWithClass:(Class)myclass child:(UIView*)child
{
    UIView *superview = nil;
    superview = child.superview;
    while (superview != nil && ![superview isKindOfClass:myclass]) {
        superview = superview.superview;
    }
    return superview;
}

#pragma mark - 寻找某View在类中的父ViewController
+ (UIViewController *)superViewControllerByView:(UIView *)view
{
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

#pragma mark - 获取app版本号
+(NSString *)getAppVersion{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Info" ofType:@"plist"];
    NSDictionary *infoDic = [[NSDictionary alloc]initWithContentsOfFile:path];
	NSString *bundleVersion  =[NSString stringWithFormat:@"%@",[infoDic objectForKey:@"CFBundleVersion"]];
    return bundleVersion;
}

#pragma mark - 获取mainWindow
+ (UIWindow *)mainWindow
{
    UIApplication *app = [UIApplication sharedApplication];
    if ([app.delegate respondsToSelector:@selector(window)])
    {
        return [app.delegate window];
    }
    else
    {
        return [app keyWindow];
    }
}

#pragma mark - NSString装换成URLEncoding(百分号格式)
/**
 *@param  (NSString)input
 *@return NSString
 */
+(NSString *)encodeToPercentEscapeString:(NSString *)input{
    NSString *outputStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)input, NULL, (CFStringRef)@"`~!@#$%^*(){}:\"<>?[];',./\\|", kCFStringEncodingUTF8));
    return outputStr;
}

#pragma mark - NSString装换成URLEncoding(百分号格式)
/**
 *@param  (NSString)input
 *@return NSString
 */
+(NSString *)encodeToPercentEscapeStringWithAndSymbol:(NSString *)input{
    NSString *outputStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)input, NULL, (CFStringRef)@"`~!@#$^*(){}:\"<>?[];',./\\|&", kCFStringEncodingUTF8));
    return outputStr;
}

#pragma mark - URLEncoding装换成NSString
/**
 *@param  (NSString)input
 *@return NSString
 */
+(NSString *)decodeToPercentEscapeString:(NSString *)input{
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [outputStr length])];
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


+(NSString *)resultbyJSMethod:(NSString *)jsMethod withParam1:(NSString *)param1 withParam2:(NSString *)param2 withParam3:(NSString *)param3 withParam4:(NSString *)param4 AtWebView:(UIWebView *)webView{
    NSMutableString *js = [NSMutableString stringWithString:jsMethod];
    if (param1!=nil) {
        [js appendFormat:@"(\'%@\'", param1];
        if (param2!=nil) {
            [js appendFormat:@",\'%@\'", param2];
        }
        if (param3!=nil) {
            [js appendFormat:@",\'%@\'", param3];
        }
        if (param4!=nil) {
            [js appendFormat:@",\'%@\'", param4];
        }
        [js appendString:@")"];
    }

    NSString *result = [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithString:js]];
    return result;
}

//+(void)transformStatusbarOrientation:(UINavigationController *)navigation{
//    // 状态栏动画持续时间
//    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
//    // 基础动画
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:duration];
//    // 修改状态栏的方向及view的方向进而强制旋转屏幕
//    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
//    navigation.view.transform = CGAffineTransformIdentity;
//    navigation.view.transform = CGAffineTransformMakeRotation(M_PI / 2);
//    navigation.view.bounds = CGRectMake(navigation.view.bounds.origin.x, navigation.view.bounds.origin.y, iPhoneHeight, 320);
//    [UIView commitAnimations];
//}


+(CGSize)sizeWithFont:(float)fontSize ByString:(NSString *)str maxWidth:(float)max{
    //    CGSize expectedLabelSize = [str sizeWithFont:[UIFont systemFontOfSize:14.0f]
    //                               constrainedToSize:CGSizeMake(280.0f, CGFLOAT_MAX)
    //                                   lineBreakMode:UILineBreakModeWordWrap];
    //(Deprecated. Use NSLineBreakByWordWrapping instead.)
    
    CGSize expectedLabelSize = CGSizeZero;
    
    if (IOS8_OR_LATER) {
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
        CGSize size = [str boundingRectWithSize:CGSizeMake(max, CGFLOAT_MAX) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
        
        expectedLabelSize = [str boundingRectWithSize:size
                                              options:NSStringDrawingUsesFontLeading
                                           attributes:attribute
                                              context:nil].size;//Available in iOS 8.0 and later.
    }else{
        expectedLabelSize = [str sizeWithFont:[UIFont systemFontOfSize:fontSize]
                                   constrainedToSize:CGSizeMake(max, CGFLOAT_MAX)
                                       lineBreakMode:NSLineBreakByWordWrapping];//Available in iOS 6.0 and later.
    }
    return expectedLabelSize;
}



+(NSString*) doDevicePlatform
{
    size_t size;
    int nR = sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char *)malloc(size);
    nR = sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    
    if ([platform isEqualToString:@"iPhone1,1"]) {
        
        platform = @"iPhone";
        
    } else if ([platform isEqualToString:@"iPhone1,2"]) {
        
        platform = @"iPhone 3G";
        
    } else if ([platform isEqualToString:@"iPhone2,1"]) {
        
        platform = @"iPhone 3GS";
        
    } else if ([platform isEqualToString:@"iPhone3,1"]||[platform isEqualToString:@"iPhone3,2"]||[platform isEqualToString:@"iPhone3,3"]) {
        
        platform = @"iPhone 4";
        
    } else if ([platform isEqualToString:@"iPhone4,1"]) {
        
        platform = @"iPhone 4S";
        
    } else if ([platform isEqualToString:@"iPhone5,1"]||[platform isEqualToString:@"iPhone5,2"]) {
        
        platform = @"iPhone 5";
        
    }else if ([platform isEqualToString:@"iPhone5,3"]||[platform isEqualToString:@"iPhone5,4"]) {
        
        platform = @"iPhone 5C";
        
    }else if ([platform isEqualToString:@"iPhone6,2"]||[platform isEqualToString:@"iPhone6,1"]) {
        
        platform = @"iPhone 5S";
        
    }else if ([platform isEqualToString:@"iPod4,1"]) {
        
        platform = @"iPod touch 4";
        
    }else if ([platform isEqualToString:@"iPod5,1"]) {
        
        platform = @"iPod touch 5";
        
    }else if ([platform isEqualToString:@"iPod3,1"]) {
        
        platform = @"iPod touch 3";
        
    }else if ([platform isEqualToString:@"iPod2,1"]) {
        
        platform = @"iPod touch 2";
        
    }else if ([platform isEqualToString:@"iPod1,1"]) {
        
        platform = @"iPod touch";
        
    } else if ([platform isEqualToString:@"iPad3,2"]||[platform isEqualToString:@"iPad3,1"]) {
        
        platform = @"iPad 3";
        
    } else if ([platform isEqualToString:@"iPad2,2"]||[platform isEqualToString:@"iPad2,1"]||[platform isEqualToString:@"iPad2,3"]||[platform isEqualToString:@"iPad2,4"]) {
        
        platform = @"iPad 2";
        
    }else if ([platform isEqualToString:@"iPad1,1"]) {
        
        platform = @"iPad 1";
        
    }else if ([platform isEqualToString:@"iPad2,5"]||[platform isEqualToString:@"iPad2,6"]||[platform isEqualToString:@"iPad2,7"]) {
        
        platform = @"ipad mini";
        
    } else if ([platform isEqualToString:@"iPad3,3"]||[platform isEqualToString:@"iPad3,4"]||[platform isEqualToString:@"iPad3,5"]||[platform isEqualToString:@"iPad3,6"]) {
        
        platform = @"ipad 3";
        
    }
    
    return platform;
}

#pragma mark -
#pragma mark 检查更新情况
+(NSString *)checkAppUpdate:(NSString *)appInfo delegate:(id)delegate{
    //获得服务器版本号
    NSString *version=[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];//获得本地版本号
    NSString *appInfo1=[appInfo substringFromIndex:[appInfo rangeOfString:@"\"version\":"].location+10];
    NSString *appInfo2=[appInfo substringFromIndex:[appInfo rangeOfString:@"\"trackViewUrl\":"].location+15];
    appInfo1=[[appInfo1 substringToIndex:[appInfo1 rangeOfString:@","].location] stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    appInfo2=[[appInfo2 substringToIndex:[appInfo2 rangeOfString:@","].location] stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    
    //    if ([[VersionAgent sharedInstance] shouldShowLocalNotification]) {
    //进行比较，不同则进行升级提醒
    if (![appInfo1 isEqualToString:version]) {
        //NSLog(@"新版本:%@,当前版本%@",appInfo1,version);
//        AccountModel *account = [AccountModel shareInstance];
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"更新提示" message:@"有新版本发布啦!" delegate:nil cancelButtonTitle:@"以后再说" otherButtonTitles:nil];
        alert.delegate = delegate;
        NSString *str= [NSString stringWithFormat:@"%@",appInfo2]; 
        [alert addButtonWithTitle:@"立即更新"];
        [alert show];
        return str;
    }
    return @"";
}

//获取view的controller
+ (UIViewController *)findviewController:(UIView *)v{
    for (UIView* next = [v superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}


+(NSMutableArray *)startArraySort:(NSString *)keystring isAscending:(BOOL)isAscending usingsourceArray:(NSMutableArray *)sourceArray{
    NSMutableArray *destinationArry=[NSMutableArray array];
    NSSortDescriptor* sortByA = [NSSortDescriptor sortDescriptorWithKey:keystring ascending:isAscending];
    //destinationArry 排序后的数组 sourceArry 源数据
    destinationArry = [NSMutableArray arrayWithArray:[sourceArray sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortByA]]];
    return destinationArry;
}


+(NSString*)convertChineseinterpunctionToEnglishinterpunction:(NSString*)str{
    NSArray* ChineseInterpunction = @[ @"“", @"”", @"‘", @"’", @"。", @"，", @"；", @"：", @"？", @"！", @"……", @"—", @"～", @"（", @"）", @"《", @"》"];
    
    /*,@"“", @"”", @"‘", @"’", @"。", @"，", @"；", @"：", @"？", @"！", @"……", @"－", @"～", @"（", @"）", @"《", @"》"*/
    NSArray* EnglishInterpunction = @[ @"\"", @"\"", @"'", @"'", @".", @",", @";", @":", @"?", @"!", @"…", @"-", @"~", @"(", @")", @"<", @">"];
    
    NSString *rlt = [NSString stringWithString:str];
    
    
    // str = @"：“‘’；《》，。？";
    for (int i =0 ; i < [ChineseInterpunction count]; i++) {
        //NSString *str1 = [NSString stringWithString:str];
        rlt = [rlt stringByReplacingOccurrencesOfString:[ChineseInterpunction objectAtIndex:i ] withString:[EnglishInterpunction objectAtIndex:i ]];
        //str = [NSString stringWithString:str1];
    }
    
    return rlt;
}

+(BOOL) validateNumber:(NSString *)number textString:(NSString*)textString{
    BOOL res = true;
    NSString *charStr = @"0123456789\n";
    NSCharacterSet *tmpSet = [[NSCharacterSet characterSetWithCharactersInString:charStr] invertedSet];
    NSArray *filteredArr = [number componentsSeparatedByCharactersInSet:tmpSet];
    NSString *filtered = [filteredArr componentsJoinedByString:@""];
    res = [number isEqualToString:filtered];
    return res;
}
@end
