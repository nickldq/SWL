//
//  TDFontLibrary.h
//  UnionpayCard
//
//  Created by Dong Yiming on 2/20/14.
//  Copyright (c) 2014 Frodo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  公共字体的Library
 */
@interface BMFontLibrary : NSObject
AS_SINGLETON(BMFontLibrary)


/**
 *  @brief 默认字体
 *
 *  @param aFontSize 字体大小
 *
 *  @return 得到需要字体
 */
+(UIFont *)defaultFont:(CGFloat)aFontSize;

/**
 *  @brief lightFont
 *
 *  @param aFontSize 字体大小
 *
 *  @return 得到需要字体
 */
+(UIFont *)lightFont:(CGFloat)aFontSize;

/**
 *  @brief mediumFont字体
 *
 *  @param aFontSize 字体大小
 *
 *  @return 得到需要字体
 */
+(UIFont *)mediumFont:(CGFloat)aFontSize;

/**
 *  @brief ultraLightFont
 *
 *  @param aFontSize 字体大小
 *
 *  @return 得到需要字体
 */
+(UIFont *)ultraLightFont:(CGFloat)aFontSize;

/**
 *  @brief boldFont
 *
 *  @param aFontSize 字体大小
 *
 *  @return 得到需要字体
 */
+(UIFont *)boldFont:(CGFloat)aFontSize;

/**
 *  @brief blackFont
 *
 *  @param aFontSize 字体大小
 *
 *  @return 得到需要字体
 */
+(UIFont *)blackFont:(CGFloat)aFontSize;

/**
 *  @brief titleFont
 *
 *  @return 得到需要字体
 */
+(UIFont *)titleFont;

/**
 *  默认字体
 */
@property (nonatomic, strong) UIFont    *fontNormal;
/**
 *  默认title
 */
@property (nonatomic, strong) UIFont    *fontTitle;
/**
 *  默认title
 */
@property (nonatomic, strong) UIFont    *fontTitleBold;
@end
