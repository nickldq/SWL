//
//  DocumentUtils.h
//  MoneyShop
//
//  Created by 黄杰 on 14/12/3.
//  Copyright (c) 2014年 Kaiying. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DocumentUtils : NSObject<UIDocumentInteractionControllerDelegate>

+(UIDocumentInteractionController *)documentInteractionController:(NSString *)filePath delegate:(id<UIDocumentInteractionControllerDelegate>) delegate;


@end
