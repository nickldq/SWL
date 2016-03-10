//
//  QRCodeScanningDelegate.h
//  MoneyShop
//
//  Created by Liudq on 14-10-16.
//  Copyright (c) 2014年 Kaiying. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QRCodeScanningDelegate <NSObject>
-(void)qrcodeDidScan:(NSString*)qrcodeString;
@end
