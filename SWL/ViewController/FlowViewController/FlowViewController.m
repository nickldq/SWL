//
//  FlowViewController.m
//  SWL
//
//  Created by Liudq on 16/2/2.
//
//

#import "FlowViewController.h" 
#import "UIButton+Block.h"
#import "InformationStepOne.h"
#import "BasicAnimationUtils.h"
#import "FlowPage.h"

@interface FlowViewController ()

@end

@implementation FlowViewController
  


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //configure carousel
    NSMutableArray *urlStringArray = [NSMutableArray array];
    
    for (int i = 1; i < 5; i++) {
        UIView *view;
        switch (i) {
            case 1:
                view = [[[NSBundle mainBundle]loadNibNamed:@"FlowPageType1" owner:self options:nil]firstObject];
                break;
            case 2:
                view = [[[NSBundle mainBundle]loadNibNamed:@"FlowPageType2" owner:self options:nil]firstObject];
                
                break;
            case 3:
                view = [[[NSBundle mainBundle]loadNibNamed:@"FlowPageType3" owner:self options:nil]firstObject];
                break;
            case 4:
                view = [[[NSBundle mainBundle]loadNibNamed:@"FlowPageType4" owner:self options:nil]firstObject];
                
                break;
                
            default:
                break;
        } 
        __weak __typeof(self)weakSelf = self;
        UIButton *backButton = [view viewWithTag:20];
        [backButton handleControlEvent:UIControlEventTouchUpInside withBlock:^(){
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }];//返回
        UIButton *commentButton = [view viewWithTag:30];
        [commentButton handleControlEvent:UIControlEventTouchUpInside withBlock:^(){
            InformationStepOne *step1View = (InformationStepOne *)[[[NSBundle mainBundle]loadNibNamed:@"InformationStepOne" owner:self options:nil]firstObject];
            step1View.flowVC = self;
            [self.view addSubview:step1View];
//            JCAlertView *customAlert = [[JCAlertView alloc] initWithCustomView:step1View dismissWhenTouchedBackground:NO];
//            step1View.alert = customAlert;
//            [customAlert show];
        }];//评论
        
        [urlStringArray addObject:view];
        [self.view bringSubviewToFront:_maskingView];
    }
 
    _picScrollView = [DCPicScrollView picScrollViewWithFrame:self.view.frame WithView:urlStringArray isWebImage:NO];
    
    [_picScrollView setImageViewDidTapAtIndex:^(NSInteger index) {
        printf("你点到我了😳index:%zd\n",index);
    }];
    
    _picScrollView.delegate = self;
    [_picScrollView setCurrentPageIndicatorTintColor:DEF_COLOR(187, 91, 140)];
    
    [self.view addSubview:_picScrollView];
    
    [_picScrollView.viewData[_picScrollView.currentIndex] performSelector:@selector(playAnimation)];
    
}

#pragma mark -
#pragma mark ScrollView methods
-(void)picScrollViewDidScroll:(UIScrollView *)scrollView{
//    if (_picScrollView.currentIndex == _picScrollView.viewData.count-1) {
//        [_picScrollView.viewData[_picScrollView.currentIndex] viewWithTag:30].hidden = NO;
//    }else{
//        [_picScrollView.viewData[_picScrollView.currentIndex] viewWithTag:30].hidden = YES;
//    }
    for (FlowPage *v in _picScrollView.viewData) {
        [v clearView];
    }
    [_picScrollView.viewData[_picScrollView.currentIndex] performSelector:@selector(playAnimation)];
}

- (IBAction)backAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)commentAction:(UIButton *)sender {
    
}

@end
