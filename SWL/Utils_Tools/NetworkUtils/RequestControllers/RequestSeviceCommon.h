////
//  NewsRequestSevice.h
//  Pandoranews
//
//  Created by liudq on 14-05-13.
//  Copyright (c) 2014年 liudq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestHelper.h"
@interface RequestSeviceCommon : NSObject{
    
}
@property (nonatomic,strong) RequestHelper *requestHelper;

+(RequestSeviceCommon *) sharedInstance;
@end
