//
//  NewsRequestSevice.h
//  Pandoranews
//
//  Created by liudq on 14-05-13.
//  Copyright (c) 2014年 liudq. All rights reserved.
//

#import "RequestHelper.h"

@interface RequestHeader(){
    
}

@end
@implementation RequestHelper

@synthesize delegate;
@synthesize requestFinishedSelector;
@synthesize requestFailedSelector;

static RequestHelper *sharedInstance=nil;
+(RequestHelper *) sharedInstance{
    @synchronized(self){
        if(!sharedInstance)
        {
            sharedInstance=[[self alloc] init];
            //            [sharedInstance useCache];
            //            [sharedInstance cacheDirectoryName];
        }
        return sharedInstance;
    }
}

#pragma mark -
#pragma mark 根据服务编号、内容、委托发送数据请求-Post
-(void)postRequest:(NSString *)serviceMethod
    jsonDictionary:(NSDictionary *)dictionary{
    
    if ([[AFNetworkReachabilityManager sharedManager] isReachable] == NO) {
        //        DLog(@"Error in RequestHelper Line.39");
        //		return;
        //        [CommonMethodUtils showErrorLoading:@"网络连接已断开!"];
    }
    
    NSString *urlString = [NSString stringWithFormat:@"%@/%@",REQUEST_PATH , serviceMethod];
    
#ifdef DEBUG
    //    urlString = @"http://192.168.41.185/20140616_1_10.zip";
    
    /*if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
     int select = [[NSUserDefaults standardUserDefaults] integerForKey:kUrlPicker_object];
     switch (select) {
     case 1:
     urlString = [NSString stringWithFormat:@"%@/%@",REQUEST_PATH_Test1 , serviceMethod];
     break;
     case 2:
     urlString = [NSString stringWithFormat:@"%@/%@",REQUEST_PATH_Test2 , serviceMethod];
     break;
     
     case 3:
     urlString = [NSString stringWithFormat:@"%@/%@",REQUEST_PATH_Test3 , serviceMethod];
     break;
     
     case 4:
     urlString = [NSString stringWithFormat:@"%@/%@",REQUEST_PATH_Test1 , serviceMethod];
     break;
     default:
     break;
     }
     }*/
#endif
    
    
    NSURL *url = [NSURL URLWithString:urlString];
    DLog(@"====Asi url : %@",url);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 网络访问是异步的,回调是主线程的,因此程序员不用管在主线程更新UI的事情
    [manager POST:urlString parameters:dictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {
        DLog(@"%@", responseObject);
        // 提问:NSURLConnection异步方法回调,是在子线程
        // 得到回调之后,通常更新UI,是在主线程
        DLog(@"%@", [NSThread currentThread]);
        
        DLog(@"%@", [operation responseString]);
        
        NSData *responseData = [operation responseData];
        
        NSString *dataStr = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
        
        NSString *responseStr = dataStr;
        //            if ([operation.url.description rangeOfString:kMainPageZipDownload(@"0", 2, kMainPageZipDownloadNum)].length>0) {
        //                [[ZipService getInstance]saveBackupFile:responseStr];
        //            }
        
        id responseObj = [NSJSONSerialization toArrayOrNSDictionaryWithJsonstring:responseStr];
        
        if (delegate && [delegate respondsToSelector:requestFinishedSelector]) {
            [delegate performSelector:requestFinishedSelector withObject:responseObj];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"%@", [error localizedDescription]);
        
        [operation cancel];
        DLog(@"请求失败，可能是连接失败: %@",error);
        //	[LoadingView showLoadingView:@"服务器正忙请稍后再试！"];
        
        NSData *responseData = [operation responseData];
        
        NSString *responseStr = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
        DLog(@"requestFailed:=======%@",responseStr);
        
        //            if ([operation.response.url.description rangeOfString:kMainPageZipDownload(@"0", 2, kMainPageZipDownloadNum)].length>0) {
        //                responseStr = [[ZipService getInstance]loadBackupFile];
        //            }
        id responseObj = [NSJSONSerialization toArrayOrNSDictionaryWithJsonstring:responseStr];
        
        if (delegate && [delegate respondsToSelector:requestFailedSelector]) {
            [delegate performSelector:requestFailedSelector withObject:responseObj];
        }
        
    }];
}


-(void)getRequest:(NSString *)serviceMethod{
    
    if ([[AFNetworkReachabilityManager sharedManager] isReachable] == NO) {
        //        DLog(@"Error in RequestHelper Line.39");
        //		return;
        //        [CommonMethodUtils showErrorLoading:@"网络连接已断开!"];
    }
    
    NSString *urlString = [NSString stringWithFormat:@"%@/%@",REQUEST_PATH , serviceMethod];
    
#ifdef DEBUG
    //    urlString = @"http://192.168.41.185/20140616_1_10.zip";
    
    /*if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
     int select = [[NSUserDefaults standardUserDefaults] integerForKey:kUrlPicker_object];
     switch (select) {
     case 1:
     urlString = [NSString stringWithFormat:@"%@/%@",REQUEST_PATH_Test1 , serviceMethod];
     break;
     case 2:
     urlString = [NSString stringWithFormat:@"%@/%@",REQUEST_PATH_Test2 , serviceMethod];
     break;
     
     case 3:
     urlString = [NSString stringWithFormat:@"%@/%@",REQUEST_PATH_Test3 , serviceMethod];
     break;
     
     case 4:
     urlString = [NSString stringWithFormat:@"%@/%@",REQUEST_PATH_Test1 , serviceMethod];
     break;
     default:
     break;
     }
     }*/
#endif
    
    
    NSURL *url = [NSURL URLWithString:urlString];
    DLog(@"==== url : %@",url);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 网络访问是异步的,回调是主线程的,因此程序员不用管在主线程更新UI的事情
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        DLog(@"%@", responseObject);
        // 提问:NSURLConnection异步方法回调,是在子线程
        // 得到回调之后,通常更新UI,是在主线程
        DLog(@"%@", [NSThread currentThread]);
        
        DLog(@"%@", [operation responseString]);
        
        NSData *responseData = [operation responseData];
        
        NSString *dataStr = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
        
        NSString *responseStr = dataStr; 
        
        //            if ([operation.url.description rangeOfString:kMainPageZipDownload(@"0", 2, kMainPageZipDownloadNum)].length>0) {
        //                [[ZipService getInstance]saveBackupFile:responseStr];
        //            }
        
        id responseObj = [NSJSONSerialization toArrayOrNSDictionaryWithJsonstring:responseStr];
        
        if (delegate && [delegate respondsToSelector:requestFinishedSelector]) {
            [delegate performSelector:requestFinishedSelector withObject:responseObj];
        }
        
        //String
        
        //Data
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        DLog(@"%@", [error localizedDescription]);
        
        [operation cancel];
        DLog(@"请求失败，可能是连接失败: %@",error);
        //	[LoadingView showLoadingView:@"服务器正忙请稍后再试！"];
        
        NSData *responseData = [operation responseData];
        
        NSString *responseStr = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
        DLog(@"requestFailed:=======%@",responseStr);
        
        //            if ([operation.response.url.description rangeOfString:kMainPageZipDownload(@"0", 2, kMainPageZipDownloadNum)].length>0) {
        //                responseStr = [[ZipService getInstance]loadBackupFile];
        //            }
        id responseObj = [NSJSONSerialization toArrayOrNSDictionaryWithJsonstring:responseStr];
        
        if (delegate && [delegate respondsToSelector:requestFailedSelector]) {
            [delegate performSelector:requestFailedSelector withObject:responseObj];
        }
        
    }];
}

-(NSString*) cacheDirectoryName {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDirectory = paths[0];
    NSString *cacheDirectoryName = [cachesDirectory stringByAppendingPathComponent:@"CachesDirectory"];
    return cacheDirectoryName;
}

#pragma mark - 检测网络连接
- (void)reach
{
    /**
     AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G 花钱
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   // 局域网络,不花钱
     */
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        DLog(@"%d", status);
    }];
}

#pragma mark - Session 下载
- (void)sessionDownload:(NSString *)urlString
{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        // 指定下载文件保存的路径
        //        NSLog(@"%@ %@", targetPath, response.suggestedFilename);
        // 将下载文件保存在缓存路径中
        NSString *cacheDir = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        NSString *path = [cacheDir stringByAppendingPathComponent:response.suggestedFilename];
        
        // URLWithString返回的是网络的URL,如果使用本地URL,需要注意
        NSURL *fileURL1 = [NSURL URLWithString:path];
        NSURL *fileURL = [NSURL fileURLWithPath:path];
        
        DLog(@"== %@ |||| %@", fileURL1, fileURL);
        
        return fileURL;
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"%@ %@", filePath, error);
    }];
    
    
    //下载时的UIProgressView
    UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    [progressView setProgressWithDownloadProgressOfTask:task animated:YES];
    progressView.center = [UIApplication sharedApplication].keyWindow.center;
    [[UIApplication sharedApplication].keyWindow addSubview:progressView];
    
    [task resume];
}

#pragma mark - POST上传
- (void)postUpload:(NSString *)urlString filename:(NSString *)filename
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // AFHTTPResponseSerializer就是正常的HTTP请求响应结果:NSData
    // 当请求的返回数据不是JSON,XML,PList,UIImage之外,使用AFHTTPResponseSerializer
    // 例如返回一个html,text...
    //
    // 实际上就是AFN没有对响应数据做任何处理的情况
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // formData是遵守了AFMultipartFormData的对象
    AFHTTPRequestOperation *operation = [manager POST:urlString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        // 将本地的文件上传至服务器
        NSURL *fileURL = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        
        [formData appendPartWithFileURL:fileURL name:@"uploadFile" error:NULL];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        DLog(@"完成 %@", result);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"错误 %@", error.localizedDescription);
    }];
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        NSLog(@"bytesRead:%lu",(unsigned long)bytesRead);
        //bytesRead,上次读取的数据  //totalBytesRead,目前为止总共读取的数据 //totalBytesExpectedToRead,预测的文件大小
        NSLog(@"totalBytesRead:%lld",totalBytesRead);
        NSLog(@"totalBytesExpectedToRead:%lld",totalBytesExpectedToRead);
    }];
    
    //上传时的UIProgressView
    UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    [progressView setProgressWithUploadProgressOfOperation:operation animated:YES];
    progressView.center = [UIApplication sharedApplication].keyWindow.center;
    [[UIApplication sharedApplication].keyWindow addSubview:progressView];
}

#pragma mark - JSON
- (void)XMLData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // 返回的数据格式是XML
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    NSDictionary *dict = @{@"format": @"xml"};
    
    // 网络访问是异步的,回调是主线程的,因此程序员不用管在主线程更新UI的事情
    [manager GET:@"http://localhost/videos.php" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // 如果结果是XML,同样需要使用6个代理方法解析,或者使用第三方库
        // 第三方库第三方框架,效率低,内存泄漏
        DLog(@"%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"%@", error);
    }];
}
@end
