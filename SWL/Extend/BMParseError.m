//
//  XSParseError.m
//  Babylon
//
//  Created by sam.l on 14-4-29.
//  Copyright (c) 2014年 Yixue. All rights reserved.
//

#import "BMParseError.h"

@implementation BMParseError


#pragma mark解析 NSError
+(NSString*)parseError:(NSError*)error
{
    NSString*errorMessage=@"";
    switch (error.code) {
        case 200:
            errorMessage=@"成功";//服务器已成功处理了请求。 通常，这表示服务器提供了请求的网页。
            break;
        case 201:
            errorMessage=@"已创建";//请求成功并且服务器创建了新的资源。
            break;
        case 202:
            errorMessage=@"已接受";//服务器已接受请求，但尚未处理。
            break;
        case 203:
            errorMessage=@"非授权信息";//服务器已成功处理了请求，但返回的信息可能来自另一来源。
            break;
        case 204:
            errorMessage=@"无内容";//服务器成功处理了请求，但没有返回任何内容。
            break;
        case 304:
            errorMessage=@"没有修改";//自从上次请求后，请求的网页未修改过。服务器返回此响应时，不会返回网页内容。如果网页自请求者上次请求后再也没有更改过，您应将服务器配置为返回此响应（称为 If-Modified-Since HTTP 标头）。服务器可以告诉 Googlebot 自从上次抓取后网页没有变更，进而节省带宽和开销。
            break;
        case 400:
            errorMessage=@"错误请求";//服务器不理解请求的语法。
            break;
        case 401:
            errorMessage=@"未授权";//请求要求身份验证。 对于需要登录的网页，服务器可能返回此响应。
            break;
        case 403:
            errorMessage=@"禁止访问";//服务器拒绝请求。
            break;
        case 404:
            errorMessage=@"未找到";//服务器不理解请求的语法。
            break;
        case 405:
            errorMessage=@"方法禁用";//禁用请求中指定的方法。
            break;
        case 406:
            errorMessage=@"不接受";//无法使用请求的内容特性响应请求的网页。
            break;
        case 407:
            errorMessage=@"需要代理授权";//此状态代码与 401（未授权）类似，但指定请求者应当授权使用代理。
            break;
        case 408:
            errorMessage=@"请求超时";//服务器等候请求时发生超时。
            break;
        case 409:
            errorMessage=@"冲突";//服务器在完成请求时发生冲突。 服务器必须在响应中包含有关冲突的信息。
            break;
        case 410:
            errorMessage=@"已删除";//如果请求的资源已永久删除，服务器就会返回此响应。
            break;
        case 411:
            errorMessage=@"需要有效长度";//服务器不接受不含有效内容长度标头字段的请求。
            break;
        case 412:
            errorMessage=@"未满足前提条件";//服务器未满足请求者在请求中设置的其中一个前提条件。
            break;
        case 413:
            errorMessage=@"请求实体过大";//服务器无法处理请求，因为请求实体过大，超出服务器的处理能力。
            break;
        case 414:
            errorMessage=@"请求的URI过长";//请求的 URI（通常为网址）过长，服务器无法处理。
            break;
        case 415:
            errorMessage=@"不支持的媒体类型";//请求的格式不受请求页面的支持。
            break;
        case 416:
            errorMessage=@"请求范围不符合要求";//如果页面无法提供请求的范围，则服务器会返回此状态代码。
            break;
        case 417:
            errorMessage=@"未满足期望值";//服务器未满足”期望”请求标头字段的要求。
            break;
        case 500:
            errorMessage=[error.userInfo objectForKey:@"Error"];//服务器遇到错误，无法完成请求。
            break;
        case 501:
            errorMessage=@"尚未实施";//服务器不具备完成请求的功能。 例如，服务器无法识别请求方法时可能会返回此代码。
            break;
        case 502:
            errorMessage=@"错误网关";//服务器作为网关或代理，从上游服务器收到无效响应。
            break;
        case 503:
            errorMessage=@"服务不可用";//服务器目前无法使用（由于超载或停机维护）。 通常，这只是暂时状态。
            break;
        case 504:
            errorMessage=@"网关超时";//服务器作为网关或代理，但是没有及时从上游服务器收到请求。
            break;
        case 505:
            errorMessage=@"HTTP版本不受支持";//服务器不支持请求中所用的 HTTP 协议版本。
            break;
        case 3840:
            errorMessage=@"服务器数据错误";//服务器数据错误。
            break;


        default:
            break;
    }
    return errorMessage;
}


@end
