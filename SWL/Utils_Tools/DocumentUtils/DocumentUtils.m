//
//  DocumentUtils.m
//  MoneyShop
//
//  Created by 黄杰 on 14/12/3.
//  Copyright (c) 2014年 Kaiying. All rights reserved.
//

#import "DocumentUtils.h"
#import "DataFileUtils.h"

@implementation DocumentUtils


+(UIDocumentInteractionController *)documentInteractionController:(NSString *)filePath delegate:(id<UIDocumentInteractionControllerDelegate>) delegate
{
    NSURL *URL=[DataFileUtils fileToURL:filePath];
    
    UIDocumentInteractionController *documentInteractionController = nil;
    if (URL) {
        // Initialize Document Interaction Controller
        documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        
        // Configure Document Interaction Controller
        [documentInteractionController setDelegate:delegate];
        
        // Preview PDF
        [documentInteractionController presentPreviewAnimated:YES];
    }
    return documentInteractionController;
}




@end
