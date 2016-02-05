//
//  DCPicScrollView.m
//  DCPicScrollView
//
//  Created by dengchen on 15/12/4.
//  Copyright © 2015年 name. All rights reserved.
//

#define myWidth self.frame.size.width
#define myHeight self.frame.size.height
#define pageSize (myHeight * 0.2 > 25 ? 25 : myHeight * 0.2)

#import "DCPicScrollView.h"
#import "DCWebImageManager.h"

@interface DCPicScrollView () <UIScrollViewDelegate>
@property(nonatomic, strong)UIView *leftView,*centerView,*rightView;

@end

@implementation DCPicScrollView{
    
    
    __weak  UILabel *_leftLabel,*_centerLabel,*_rightLabel;
    
    __weak  UIScrollView *_scrollView;

    __weak  UIPageControl *_PageControl;
    
    NSTimer *_timer;
     
    NSInteger _MaxImageCount;
    
    
    BOOL _hasTitle;
}


- (void)setMaxImageCount:(NSInteger)MaxImageCount {
    _MaxImageCount = MaxImageCount;
    
    [self preparePageControl];
    
    [self setUpTimer];
    
    [self changeLeft:_MaxImageCount-1 center:0 right:1];
}


- (void)imageViewDidTap {
    if (self.imageViewDidTapAtIndex != nil) {
        self.imageViewDidTapAtIndex(_currentIndex);
    }
}

+ (instancetype)picScrollViewWithFrame:(CGRect)frame WithView:(NSArray<NSString *> *)views isWebImage:(BOOL)isWebImage{
    DCPicScrollView *view = [[DCPicScrollView alloc] initWithFrame:frame WithViewNames:views];
    view.isNetwork = isWebImage;
    return  view;
}

- (instancetype)initWithFrame:(CGRect)frame WithViewNames:(NSArray<NSString *> *)viewNames {
    if (viewNames.count < 2) {
        return nil;
    }
    self = [super initWithFrame:frame];
    
    [self prepareScrollView];
    [self setData:viewNames];
    [self prepareView];
    [self setMaxImageCount:_viewData.count];

    return self;
}



- (void)prepareScrollView {
    
    UIScrollView *sc = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:sc];
    
    _scrollView = sc;
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    
    _scrollView.contentSize = CGSizeMake(myWidth * 2,0);
    
    _AutoScrollDelay = 2.0f;
    _currentIndex = 0;
}

- (void)prepareView {
    
    UIView *left = [[UIView alloc] initWithFrame:CGRectMake(0, 0,myWidth, myHeight)]; 
    UIView *center = [[UIView alloc] initWithFrame:CGRectMake(myWidth, 0,myWidth, myHeight)];
    UIView *right = [[UIView alloc] initWithFrame:CGRectMake(myWidth * 2, 0,myWidth, myHeight)];
    
    center.userInteractionEnabled = YES;
    [center addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidTap)]];
   
    [_scrollView addSubview:left];
    [_scrollView addSubview:center];
    [_scrollView addSubview:right];
    
    _leftView =left;
    _centerView =center;
    _rightView =right;
    
}

- (void)preparePageControl {
    
    UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(0,myHeight - pageSize,myWidth, 7)];
    
    page.pageIndicatorTintColor = [UIColor lightGrayColor];
    page.currentPageIndicatorTintColor =  [UIColor whiteColor];
    page.numberOfPages = _MaxImageCount;
    page.currentPage = 0;
    
    [self addSubview:page];
    
    
    _PageControl = page;
}

- (void)setStyle:(PageControlStyle)style {
    if (style == PageControlAtRight) {
        CGFloat w = _MaxImageCount * 17.5;
        _PageControl.frame = CGRectMake(0, 0, w, 7);
        _PageControl.center = CGPointMake(myWidth-w*0.5, myHeight-pageSize * 0.5);
    }
}

- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor {
    _PageControl.pageIndicatorTintColor = pageIndicatorTintColor;
}

- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor {
    _PageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor;
}


- (void)setTitleData:(NSArray<NSString *> *)titleData {
    if (titleData.count < 2)  return;
    
    if (titleData.count < _viewData.count) {
        NSMutableArray *temp = [NSMutableArray arrayWithArray:titleData];
        for (int i = 0; i < _viewData.count - titleData.count; i++) {
            [temp addObject:@""];
        }
        _titleData = temp;
    }else {
        
        _titleData = titleData;
    }
    
    [self prepareTitleLabel];
    _hasTitle = YES;
    [self changeLeft:_MaxImageCount-1 center:0 right:1];
}


- (void)prepareTitleLabel {
    
    [self setStyle:PageControlAtRight];

   UIView *left = [self creatLabelBgView];
   UIView *center = [self creatLabelBgView];
   UIView *right = [self creatLabelBgView];
    
    _leftLabel = (UILabel *)left.subviews.firstObject;
    _centerLabel = (UILabel *)center.subviews.firstObject;
    _rightLabel = (UILabel *)right.subviews.firstObject;

    [_leftView addSubview:left];
    [_centerView addSubview:center];
    [_rightView addSubview:right];


}



- (UIView *)creatLabelBgView {

    
   UIToolbar *v = [[UIToolbar alloc] initWithFrame:CGRectMake(0, myHeight-pageSize, myWidth, pageSize)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, myWidth-_PageControl.frame.size.width,pageSize)];
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [[UIColor alloc] initWithWhite:0.5 alpha:1];
    label.font = [UIFont systemFontOfSize:pageSize*0.5];
    
    [v addSubview:label];
    
    return v;
}

- (void)setTextColor:(UIColor *)textColor {
    _leftLabel.textColor = textColor;
    _rightLabel.textColor = textColor;
    _centerLabel.textColor = textColor;
}

- (void)setFont:(UIFont *)font {
    _leftLabel.font = font;
    _rightLabel.font = font;
    _centerLabel.font = font;
}

#pragma mark scrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self setUpTimer];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self changeImageWithOffset:scrollView.contentOffset.x];
}


- (void)changeImageWithOffset:(CGFloat)offsetX {
    if (_currentIndex==0) {
        if (offsetX >= myWidth * 1) {
            _currentIndex++;
            
            if (_currentIndex == _MaxImageCount-1) {
                [self changeLeft:_currentIndex-1 center:_currentIndex right:0];
                
                
            }else if (_currentIndex == _MaxImageCount) {
                if (_isCycleScroll) {
                    _currentIndex = 0;
                    [self changeLeft:_MaxImageCount-1 center:0 right:1];
                }else{
                    _currentIndex--;
                }
                
            }else {
                [self changeLeft:_currentIndex-1 center:_currentIndex right:_currentIndex+1];
            }
            _PageControl.currentPage = _currentIndex;
            
        }
    }else if (_currentIndex==1) {
        if (offsetX >= myWidth * 2) {
            _currentIndex++;
            
            if (_currentIndex == _MaxImageCount-1) {
                [self changeLeft:_currentIndex-1 center:_currentIndex right:0];
                
                
            }else if (_currentIndex == _MaxImageCount) {
                if (_isCycleScroll) {
                    _currentIndex = 0;
                    [self changeLeft:_MaxImageCount-1 center:0 right:1];
                }else{
                    _currentIndex--;
                }
                
            }else {
                [self changeLeft:_currentIndex-1 center:_currentIndex right:_currentIndex+1];
            }
            _PageControl.currentPage = _currentIndex;
            
        }
    }else if (_currentIndex==2) {
        if (offsetX >= myWidth * 2) {
            _currentIndex++;
            
            if (_currentIndex == _MaxImageCount-1) {
                [self changeLeft:_currentIndex-1 center:_currentIndex right:0];
                
                
            }else if (_currentIndex == _MaxImageCount) {
                if (_isCycleScroll) {
                    _currentIndex = 0;
                    [self changeLeft:_MaxImageCount-1 center:0 right:1];
                }else{
                    _currentIndex--;
                }
                
            }else {
                [self changeLeft:_currentIndex-1 center:_currentIndex right:_currentIndex+1];
            }
            _PageControl.currentPage = _currentIndex;
            
        }
    }
    
    if (offsetX <= 0) {
        _currentIndex--;
        
        if (_currentIndex == 0) {
                [self changeLeft:_MaxImageCount-1 center:0 right:1];

        }else if (_currentIndex == -1) {
            if (_isCycleScroll) {
                _currentIndex = _MaxImageCount-1;
                [self changeLeft:_currentIndex-1 center:_currentIndex right:0];
            }else{
                _currentIndex++;
            }
            
        }else {
            [self changeLeft:_currentIndex-1 center:_currentIndex right:_currentIndex+1];
        }
        
        _PageControl.currentPage = _currentIndex;
    }
    
}

- (void)changeLeft:(NSInteger)LeftIndex center:(NSInteger)centerIndex right:(NSInteger)rightIndex {
    
    if (_isNetwork) {
        
        [(UIImageView *)_leftView setImage:[self setImageWithIndex:LeftIndex]];
        [(UIImageView *)_centerView setImage:[self setImageWithIndex:centerIndex]];
        [(UIImageView *)_rightView setImage:[self setImageWithIndex:rightIndex]];
        
    }else {
        
        
        for (UIView *v in _leftView.subviews) {
            [v removeFromSuperview];
        }
        for (UIView *v in _centerView.subviews) {
            [v removeFromSuperview];
        }
        for (UIView *v in _rightView.subviews) {
            [v removeFromSuperview];
        }
        for (UIView *v in _scrollView.subviews) {
            [v removeFromSuperview];
        }
        if (_isCycleScroll) {
            [_scrollView addSubview:_leftView];
            [_scrollView addSubview:_centerView];
            [_scrollView addSubview:_rightView];
            [_leftView addSubview:_viewData[LeftIndex]];
            [_centerView addSubview:_viewData[centerIndex]];
            [_rightView addSubview:_viewData[rightIndex]];
            _scrollView.contentSize = CGSizeMake(myWidth * 3,0);
            
        }else{
            if (centerIndex == _viewData.count-1) {
                [_scrollView addSubview:_leftView];
                [_scrollView addSubview:_centerView];
                [_leftView addSubview:_viewData[LeftIndex]];
                [_centerView addSubview:_viewData[centerIndex]];
                _scrollView.contentSize = CGSizeMake(myWidth * 2,0);
                [_scrollView setContentOffset:CGPointMake(myWidth, 0)];
            }else if (centerIndex == 0){
                [_scrollView addSubview:_leftView];
                [_scrollView addSubview:_centerView];
                [_leftView addSubview:_viewData[centerIndex]];
                [_centerView addSubview:_viewData[rightIndex]];
                _scrollView.contentSize = CGSizeMake(myWidth * 2,0);
                [_scrollView setContentOffset:CGPointMake(0, 0)];
            }else{
                [_scrollView addSubview:_leftView];
                [_scrollView addSubview:_centerView];
                [_scrollView addSubview:_rightView];
                [_leftView addSubview:_viewData[LeftIndex]];
                [_centerView addSubview:_viewData[centerIndex]];
                [_rightView addSubview:_viewData[rightIndex]];
                _scrollView.contentSize = CGSizeMake(myWidth * 3,0);
                [_scrollView setContentOffset:CGPointMake(myWidth, 0)];
            }
        }
         
    }
    
    if (_hasTitle) {
        
        _leftLabel.text = _titleData[LeftIndex];
        _centerLabel.text = _titleData[centerIndex];
        _rightLabel.text = _titleData[rightIndex];
        
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(picScrollViewDidScroll:)]) {
        [_delegate performSelector:@selector(picScrollViewDidScroll:)withObject:_scrollView];
    }
}

-(void)setPlaceImage:(UIImage *)placeImage {
    _placeImage = placeImage;
    [self changeLeft:_MaxImageCount-1 center:0 right:1];
}

- (UIImage *)setImageWithIndex:(NSInteger)index {
    
    //从内存缓存中取,如果没有使用占位图片
    UIImage *image = [[[DCWebImageManager shareManager] webImageCache] valueForKey:_viewData[index]];
    
    return image ? image : _placeImage;
}


- (void)scorll {
    [_scrollView setContentOffset:CGPointMake(_scrollView.contentOffset.x + myWidth, 0) animated:YES];
}

- (void)setAutoScrollDelay:(NSTimeInterval)AutoScrollDelay {
    _AutoScrollDelay = AutoScrollDelay;
    [self removeTimer];
    [self setUpTimer];
}

- (void)setUpTimer {
    if(_isAutoScroll){
        if (_AutoScrollDelay < 0.5) return;
        
        _timer = [NSTimer timerWithTimeInterval:_AutoScrollDelay target:self selector:@selector(scorll) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

- (void)removeTimer {
    if (_timer == nil) return;
    [_timer invalidate];
    _timer = nil;
}

- (void)setData:(NSArray *)viewNames {
      
    if (_isNetwork) {
        
        _viewData = [viewNames copy];
        
        [self getImage];
        
    }else {
        
        
        _viewData = [viewNames copy];
    }
    
}


- (void)getImage {
    
    for (NSString *urlSting in _viewData) {
        [[DCWebImageManager shareManager] downloadImageWithUrlString:urlSting];
    }
    
}

-(void)dealloc {
    [self removeTimer];
}

//
//- (void)getImage {
//   
//    SDWebImageManager *manager = [SDWebImageManager sharedManager];
//    
//    for (NSString *urlString in _imageData) {
//        
//        [manager downloadImageWithURL:[NSURL URLWithString:urlString] options:SDWebImageHighPriority progress:NULL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//            if (error) {
//                NSLog(@"%@",error);
//            }
//        }];
//    }
//    
//}
//- (UIImage *)setImageWithIndex:(NSInteger)index {
//    
//  UIImage *image =
//    [[[SDWebImageManager sharedManager] imageCache] imageFromMemoryCacheForKey:_imageData[index]];
//    if (image) {
//        return image;
//    }else {
//        return _placeImage;
//    }
//    
//}







@end












// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com