//
//  CalendarSelectUtils
//
//  Created by Liudq on 14-10-21.
//  Copyright 2014 _KY_. All rights reserved.
//

#import "CalendarSelectUtils.h"
@implementation CalendarSelectUtils
 
+(void)getCalByCalenderViewWithDaysNumber:(int)day ToDateforString:(NSString *)todate titleString:(NSString *)title viewController:(UIViewController *)vc complete:(CalendarBlock)block{
    
    CalendarHomeViewController *chvc = [[CalendarHomeViewController alloc]init];
    
    chvc.calendartitle = title;
    
    [chvc getCalWithDaysNumber:day ToDateforString:todate titleString:title];//飞机初始化方法
    chvc.calendarblock = block;
//    chvc.calendarblock = ^(CalendarDayModel *model){
//        
//        NSLog(@"\n---------------------------");
//        NSLog(@"1星期 %@",[model getWeek]);
//        NSLog(@"2字符串 %@",[model toString]);
//        NSLog(@"3节日  %@",model.holiday);
//        
//        if (model.holiday) {
//            
//            
//        }else{
//            
//        }
//    };
    
    [vc.navigationController pushViewController:chvc animated:YES];
    //    [self presentViewController:chvc animated:YES completion:nil];
}

+(void)getCalByPickerView:(UIViewController<RMDateSelectionViewControllerDelegate> *)vc disableBouncingWhenShowing:(BOOL)bouncingON disableMotionEffects:(BOOL)motionON disableBlurEffects:(BOOL)blurON disableblackEffects:(BOOL)blackON currentDate:(NSDate *)date{
    RMDateSelectionViewController *dateSelectionVC = [RMDateSelectionViewController dateSelectionController];
    dateSelectionVC.delegate = vc;
    //    dateSelectionVC.titleLabel.text = @"This is an example title.\n\nPlease choose a date and press 'Select' or 'Cancel'.";
    
    //You can enable or disable blur, bouncing and motion effects
    dateSelectionVC.disableBouncingWhenShowing = !bouncingON;
    dateSelectionVC.disableMotionEffects = !motionON;
    dateSelectionVC.disableBlurEffects = !blurON;
    
    //You can also adjust colors (enabling the following line will result in a black version of RMDateSelectionViewController)
    if(blackON)
        dateSelectionVC.blurEffectStyle = UIBlurEffectStyleDark;
    
    //Enable the following lines if you want a black version of RMDateSelectionViewController but also disabled blur effects (or run on iOS 7)
    //dateSelectionVC.tintColor = [UIColor whiteColor];
    //dateSelectionVC.backgroundColor = [UIColor colorWithWhite:0.25 alpha:1];
    //dateSelectionVC.selectedBackgroundColor = [UIColor colorWithWhite:0.4 alpha:1];
    
    //You can access the actual UIDatePicker via the datePicker property
    dateSelectionVC.datePicker.datePickerMode = UIDatePickerModeDate;
    dateSelectionVC.datePicker.date = date;
    
    //The example project is universal. So we first need to check whether we run on an iPhone or an iPad.
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //OK, running on an iPhone. The following lines demonstrate the two ways to show the date selection view controller on iPhones:
        //(Note: These two methods also work an iPads.)
        
        // 1. Just show the date selection view controller (make sure the delegate property is assigned)
        [dateSelectionVC show];
        
        // 2. Instead of using a delegate you can also pass blocks when showing the date selection view controller
        [dateSelectionVC showWithSelectionHandler:^(RMDateSelectionViewController *vc, NSDate *aDate) {
            NSLog(@"Successfully selected date: %@ (With block)", aDate);
        } andCancelHandler:^(RMDateSelectionViewController *vc) {
            NSLog(@"Date selection was canceled (with block)");
        }];
    } else if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        //OK, running on an iPad. The following lines demonstrate the four special ways of showing the date selection view controller on iPads:
        
        // 1. Show the date selection view controller from a particular view controller (make sure the delegate property is assigned).
        //    This method can be used to show the date selection view controller within popovers.
        //    (Note: We do not use self as the view controller, as showing a date selection view controller from a table view controller
        //           is not supported due to UIKit limitations.)
        //[dateSelectionVC showFromViewController:self.navigationController];
        
        // 2. As with the two ways of showing the date selection view controller on iPhones, we can also use a blocks based API.
        //[dateSelectionVC showFromViewController:self.navigationController withSelectionHandler:^(RMDateSelectionViewController *vc, NSDate *aDate) {
        //    NSLog(@"Successfully selected date: %@ (With block)", aDate);
        //} andCancelHandler:^(RMDateSelectionViewController *vc) {
        //    NSLog(@"Date selection was canceled (with block)");
        //}];
        
        // 3. Show the date selection view controller using a UIPopoverController. The rect and the view are used to tell the
        //    UIPopoverController where to show up.
        //        [dateSelectionVC showFromRect:[self.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] inView:self.view];
        [dateSelectionVC show];
        
        // 4. The date selectionview controller can also be shown within a popover while also using blocks based API.
        //[dateSelectionVC showFromRect:[self.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] inView:self.view withSelectionHandler:^(RMDateSelectionViewController *vc, NSDate *aDate) {
        //    NSLog(@"Successfully selected date: %@ (With block)", aDate);
        //} andCancelHandler:^(RMDateSelectionViewController *vc) {
        //    NSLog(@"Date selection was canceled (with block)");
        //}];
    }
}

@end
