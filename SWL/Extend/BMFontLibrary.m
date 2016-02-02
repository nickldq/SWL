//
//  TDFontLibrary.m
//  UnionpayCard
//
//  Created by Dong Yiming on 2/20/14.
//  Copyright (c) 2014 Frodo. All rights reserved.
//

#import "BMFontLibrary.h"

#define FONT_SIZE_TITLE     (15.f)

// FONTS
// helvetica neue
#define GG_FONT_NAME_HELVETICA_NEUE             @"Helvetica"
#define GG_FONT_NAME_HELVETICA_NEUE_LIGHT       @"HelveticaNeue-Light"
#define GG_FONT_NAME_HELVETICA_NEUE_MEDIUM      @"HelveticaNeue-Medium"
#define GG_FONT_NAME_HELVETICA_NEUE_ULTRALIGHT  @"HelveticaNeue-UltraLight"
#define GG_FONT_NAME_HELVETICA_NEUE_BOLD        @"HelveticaNeue-CondensedBold"
#define GG_FONT_NAME_HELVETICA_NEUE_BLACK       @"HelveticaNeue-CondensedBlack"
@implementation BMFontLibrary
DEF_SINGLETON(BMFontLibrary)


+(UIFont *)defaultFont:(CGFloat)aFontSize {
    return [UIFont fontWithName:GG_FONT_NAME_HELVETICA_NEUE size:aFontSize];
}

+(UIFont *)lightFont:(CGFloat)aFontSize {
    return [UIFont fontWithName:GG_FONT_NAME_HELVETICA_NEUE_LIGHT size:aFontSize];
}

+(UIFont *)mediumFont:(CGFloat)aFontSize {
    return [UIFont fontWithName:GG_FONT_NAME_HELVETICA_NEUE_MEDIUM size:aFontSize];
}

+(UIFont *)ultraLightFont:(CGFloat)aFontSize {
    return [UIFont fontWithName:GG_FONT_NAME_HELVETICA_NEUE_ULTRALIGHT size:aFontSize];
}

+(UIFont *)boldFont:(CGFloat)aFontSize {
    return [UIFont fontWithName:GG_FONT_NAME_HELVETICA_NEUE_BOLD size:aFontSize];
}

+(UIFont *)blackFont:(CGFloat)aFontSize {
    return [UIFont fontWithName:GG_FONT_NAME_HELVETICA_NEUE_BLACK size:aFontSize];
}

+(UIFont *)titleFont {
    return [UIFont fontWithName:GG_FONT_NAME_HELVETICA_NEUE size:17];
}


-(void)doInit {
    
    _fontNormal = [UIFont systemFontOfSize:13.f];
    _fontTitle = [UIFont systemFontOfSize:FONT_SIZE_TITLE];
    _fontTitleBold = [UIFont boldSystemFontOfSize:FONT_SIZE_TITLE];
    
}

- (id)init
{
    self = [super init];
    if (self) {
        [self doInit];
    }
    return self;
}

@end
