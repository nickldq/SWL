//
//  MainViewController.h
//  SWL
//
//  Created by Liudq on 16/2/4.
//
//

#import "BaseViewController.h"

@interface MainViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIImageView *mainClickImageView;
@end
