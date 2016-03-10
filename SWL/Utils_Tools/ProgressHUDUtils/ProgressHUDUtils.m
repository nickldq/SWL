//
//  ProgressHUDUtils
//
//  Created by Liudq on 14-10-11.
//  Copyright 2014 _KY_. All rights reserved.
//

#import "ProgressHUDUtils.h"
#import "ProgressHUD.h"
#import "SVProgressHUD.h"
@implementation ProgressHUDUtils

#pragma mark - show LoadingView
/**
 *@param  (NSString)showString
 *
 */
+(void)showSuccessLoading:(NSString *)string{
    if ( IOS7_OR_LATER ){
        [ProgressHUD showSuccess:string Interaction:NO];
    }else{
        [SVProgressHUD showSuccessWithStatus:string duration:0.35f];
    }
}

+(void)showErrorLoading:(NSString *)string{
    if ( IOS7_OR_LATER ){
        [ProgressHUD showError:string Interaction:NO];
    }else{
        [SVProgressHUD showErrorWithStatus:string duration:0.35f];
    }
}

#pragma mark - show LoadingHUD
/**
 *@param  (NSString)showString
 */
+ (void)showProgressHUDWithStatus:(NSString *)String{
    if ( IOS7_OR_LATER ){
        [ProgressHUD show:String Interaction:NO];
    }else{
        [SVProgressHUD showWithStatus:String];
    }
}


#pragma mark -
#pragma mark Dismiss Methods Sample

+(void)dismissProgressImmediately{
    if ( IOS7_OR_LATER ){
        [[ProgressHUD shared] hudHideNow];
    }else{
        [SVProgressHUD dismissWithSuccess:nil afterDelay:0];
    }
}

+(void)dismissProgressHUDSuccess{
    if ( IOS7_OR_LATER ){
        [ProgressHUD showSuccess:nil Interaction:NO];
    }else{
        [SVProgressHUD dismissWithSuccess:nil afterDelay:0.35f];
    }
}

+ (void)dismissProgressHUDError{
    if ( IOS7_OR_LATER ){
        [ProgressHUD showError:nil Interaction:NO];
    }else{
        [SVProgressHUD dismissWithError:nil afterDelay:0.35f];
    }
}

+ (void)dismissProgressHUDSuccessWithStatus:(NSString *)String {
    if ( IOS7_OR_LATER ){
        [ProgressHUD showSuccess:String Interaction:NO];
    }else{
        [SVProgressHUD dismissWithSuccess:String afterDelay:0.35f];
    }
}

+ (void)dismissProgressHUDErrorWithStatus:(NSString *)String{
    if ( IOS7_OR_LATER ){
        [ProgressHUD showError:String Interaction:NO];
    }else{
        [SVProgressHUD dismissWithError:String afterDelay:0.35f];
    }
}

@end
