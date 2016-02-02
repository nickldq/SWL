//
//  NewsRequestSevice.h
//  Pandoranews
//
//  Created by liudq on 14-05-13.
//  Copyright (c) 2014年 liudq. All rights reserved.
//

#import "RequestHeader.h"
#import <AdSupport/ASIdentifierManager.h> 

@implementation RequestHeader
 
NSDictionary	*infoDic;

//-(NSDictionary*)packageHeader {
//	
//	//获得info.plist文件中的配置信息
//	NSString *path = [[NSBundle mainBundle]pathForResource:@"Info" ofType:@"plist"];
//    infoDic = [[NSDictionary alloc]initWithContentsOfFile:path];
//	NSString *isFrom  =[NSString stringWithFormat:@"%@",[infoDic objectForKey:@"isFrom"]];
//	AccountModel *account = [AccountModel shareInstance];
//	self.version = kVersion;
//	self.origin = isFrom;
//	self.model = kIphoneVersion;
//	self.deviceId = [OpenUDID value];
//	self.sign = account.sign;
//	if (account.IsLogin==1) {
//		self.customNo = account.custNo;
//	}else {
//		self.customNo = @"";
//	}
//	self.token = account.token;
//	self.QRToken = account.QRToken;
//	self.msaleTunn = account.msaleTunn;
//	self.msaleGb = account.msaleGb;
//	self.msaleCode = account.msaleCode;
//	self.msaleDCode = account.msaleDCode;
////	self.showStat = account.showStat;
//	self.deviceToken = account.sDeviceToken;
//	
//    if ([kIphoneResolution intValue]==640 || [kIphoneResolution intValue]==1536) {
//		UIScreen *MainScreen = [UIScreen mainScreen];
//		UIScreenMode *ScreenMode = [MainScreen currentMode];
//		CGSize size = [ScreenMode size];
//		self.resolution = [NSArray arrayWithObjects:[NSNumber numberWithFloat:size.width], [NSNumber numberWithFloat:size.height], nil];
//        self.resize = @"D";
//	} else {
//		self.resolution = [NSArray arrayWithObjects:@"320", @"480", nil];
//        self.resize = @"A";
//	}
//    
//	NSMutableDictionary *headerDict = [[NSMutableDictionary alloc] init];
//	[headerDict setValue:self.version forKey:@"Version"];
//	[headerDict setValue:self.origin forKey:@"Origin"];
//	[headerDict setValue:self.model forKey:@"Model"];
//	[headerDict setValue:self.deviceId forKey:@"DeviceId"];
//	[headerDict setValue:self.deviceToken forKey:@"DeviceToken"];
//	[headerDict setValue:self.customNo forKey:@"CustNo"];
//	[headerDict setValue:self.token forKey:@"Token"];
//	[headerDict setValue:self.resize forKey:@"Resize"];
//	[headerDict setValue:self.resolution forKey:@"Resolution"];
//	[headerDict setValue:self.QRToken forKey:@"QRToken"];
//	[headerDict setValue:self.msaleTunn forKey:@"MsaleTunn"];
//	[headerDict setValue:self.msaleGb forKey:@"MsaleGb"];
//	[headerDict setValue:self.msaleCode forKey:@"MsaleCode"];
//	[headerDict setValue:self.msaleDCode forKey:@"MsaleDCode"];
//	[headerDict setValue:self.sign forKey:@"Sign"];
//	[headerDict setValue:self.serviceId forKey:@"ServiceId"];
//	[headerDict setValue:self.showStat forKey:@"ShowStat"];
//    
//	[headerDict setValue:[CommonMethodUtils macaddress] forKey:@"MacAddress"];
//    
//    //alipay_source
//	[headerDict setValue:account.origin forKey:@"Origin"];
//    
//    if ( IOS6_OR_LATER )
//    {
//        [headerDict setValue:[[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString] forKey:@"IDFA"];
//    }
//    NSString *appFirstLaunchTime = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppFirstLaunchTime"];
//	[headerDict setValue:appFirstLaunchTime forKey:@"AppFirstLaunchTime"];
//    
//	return headerDict;
//}


@end
