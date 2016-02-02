

#import <Foundation/Foundation.h>
/**
 *  NSError 的解析类
 */
@interface BMParseError : NSObject



/**
*  解析NSError
*
*  @param error 需要解析的nserror
*
*  @return 解析结果
*/
+(NSString*)parseError:(NSError*)error;

@end
