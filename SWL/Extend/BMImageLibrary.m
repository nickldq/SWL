//
//  TDImageLibrary.m
//  UnionpayCard
//
//  Created by Dong Yiming on 2/20/14.
//  Copyright (c) 2014 Frodo. All rights reserved.
//

#import "BMImageLibrary.h"

@implementation BMImageLibrary
DEF_SINGLETON(BMImageLibrary)

- (id)init
{
    self = [super init];
    if (self) {
        [self doInit];
    }
    return self;
}

-(void)doInit {
    _logoName = [UIImage imageNamed:@"icon_homepage_MTLogo.png"];


}

@end
