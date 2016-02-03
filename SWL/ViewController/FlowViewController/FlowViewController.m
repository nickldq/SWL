//
//  FlowViewController.m
//  SWL
//
//  Created by Liudq on 16/2/2.
//
//

#import "FlowViewController.h" 
#import "UIButton+Block.h"

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
        
        UIView *view = [[[NSBundle mainBundle]loadNibNamed:@"FlowCell" owner:self options:nil]firstObject];
        view.frame = self.view.frame;
        UIImageView *imageview = [view viewWithTag:10];
        [imageview setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d", i]]];
        
        __weak __typeof(self)weakSelf = self;
        UIButton *backButton = [view viewWithTag:20];
        [backButton handleControlEvent:UIControlEventTouchUpInside withBlock:^(){
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }];
        [urlStringArray addObject:view];
    }
 
    _picScrollView = [DCPicScrollView picScrollViewWithFrame:self.view.frame WithView:urlStringArray isWebImage:NO];
    
    [_picScrollView setImageViewDidTapAtIndex:^(NSInteger index) {
        printf("你点到我了😳index:%zd\n",index);
    }];
    
    _picScrollView.AutoScrollDelay = 3.0f;
    _picScrollView.delegate = self;
    
    [self.view addSubview:_picScrollView];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark -
#pragma mark ScrollView methods
-(void)picScrollViewDidScroll:(UIScrollView *)scrollView{
    if (_picScrollView.currentIndex == _picScrollView.viewData.count-1) {
        [_picScrollView.viewData[_picScrollView.currentIndex] viewWithTag:30].hidden = NO; 
    }else{
        [_picScrollView.viewData[_picScrollView.currentIndex] viewWithTag:30].hidden = YES;
    }
}

- (IBAction)backAction:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)commentAction:(UIButton *)sender {
    
}
@end
