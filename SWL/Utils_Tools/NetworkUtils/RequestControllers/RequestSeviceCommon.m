//
//  NewsRequestSevice.h
//  Pandoranews
//
//  Created by liudq on 14-05-13.
//  Copyright (c) 2014年 liudq. All rights reserved.
//

#import "RequestSeviceCommon.h"
#import "RequestHelper.h"
#import "kConstants.h"

@implementation RequestSeviceCommon


static RequestSeviceCommon *sharedInstance=nil;
+(RequestSeviceCommon *) sharedInstance{
    @synchronized(self){
        if(!sharedInstance)
        {
            sharedInstance =[RequestSeviceCommon sharedInstance];
            RequestHelper * tempRequest =[RequestHelper sharedInstance];
            
            sharedInstance.requestHelper = tempRequest;
        }
        sharedInstance.requestHelper.delegate = self;
        return sharedInstance;
    }
}


- (id)init {
	self = [super init];
    if (self){
        //        RequestHelper * tempRequest =[[RequestHelper alloc]init];
        RequestHelper * tempRequest =[RequestHelper sharedInstance];
        
        _requestHelper = tempRequest;
        _requestHelper.delegate = self;
    }
	return self;
}


-(void)dealloc{
    //    if (_requestHelper.aSIHTTPRequest) {
    //        [_requestHelper.aSIHTTPRequest clearDelegatesAndCancel];
    //    }
    //	_requestHelper = nil;
}

@end
