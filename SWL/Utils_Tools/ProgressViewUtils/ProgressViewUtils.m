//
//  ProgressViewUtils
//
//  Created by Liudq on 14-10-11.
//  Copyright 2014 _KY_. All rights reserved.
//

#import "ProgressViewUtils.h"
@implementation ProgressViewUtils

//初始化方法
+(void)getCalWithDaysNumber:(int)day ToDateforString:(NSString *)todate titleString:(NSString *)title viewController:(UIViewController *)vc withCompletion:(CalendarBlock)calendarblock{
    
    
    CalendarHomeViewController *chvc = [[CalendarHomeViewController alloc]init];
    
    chvc.calendartitle = @"飞机";
    
    [chvc getCalWithDaysNumber:15 ToDateforString:nil titleString:@"选择"];//飞机初始化方法
    chvc.calendarblock = calendarblock;
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

@end
