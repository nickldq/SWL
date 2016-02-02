
#import <Foundation/Foundation.h>

/**
 *  公共Image库，主要存放使用率较高的图片
 */
@interface BMImageLibrary : NSObject
AS_SINGLETON(BMImageLibrary)

/**
 *  logo图片
 */
@property (nonatomic, strong) UIImage *logoName;



@end

#define SharedXImageLibrary  ([BMImageLibrary sharedInstance])
