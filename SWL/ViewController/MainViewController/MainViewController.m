//
//  MainViewController.m
//  SWL
//
//  Created by Liudq on 16/2/4.
//
//

#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "UIImage+GIF.h"
#import "HomePageViewController.h"

@interface MainViewController ()

@end

static NSString * const reuseMainType1CellIdentifier = @"MainType1TableViewCell";
static NSString * const reuseMainType2CellIdentifier = @"MainType2TableViewCell";
static NSString * const reuseMainType3CellIdentifier = @"MainType3TableViewCell";
static NSString * const reuseMainType4CellIdentifier = @"MainType4TableViewCell";




@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_tableview registerNib:[UINib nibWithNibName:@"MainType1TableViewCell" bundle:nil] forCellReuseIdentifier:reuseMainType1CellIdentifier];
    [_tableview registerNib:[UINib nibWithNibName:@"MainType2TableViewCell" bundle:nil] forCellReuseIdentifier:reuseMainType2CellIdentifier];
    [_tableview registerNib:[UINib nibWithNibName:@"MainType3TableViewCell" bundle:nil] forCellReuseIdentifier:reuseMainType3CellIdentifier];
    [_tableview registerNib:[UINib nibWithNibName:@"MainType4TableViewCell" bundle:nil] forCellReuseIdentifier:reuseMainType4CellIdentifier];
    [_tableview reloadData];
    [_mainClickImageView setImage:[UIImage sd_animatedGIFNamed:@"hand"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 96;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MainTableViewCell *cell;
    NSMutableArray * imageArray = [NSMutableArray array];
    switch (indexPath.row) {
        case 0: case 6: {
            cell = [tableView dequeueReusableCellWithIdentifier:reuseMainType1CellIdentifier];
            for (int i = 1; i<=10; i++) {
                [imageArray addObject:[NSString stringWithFormat:@"%d-%d", (int)indexPath.row+1, i]];
            }
            break;
        }
            
        case 1: case 4:{
            for (int i = 1; i<=14; i++) {
                [imageArray addObject:[NSString stringWithFormat:@"%d-%d", (int)indexPath.row+1, i]];
            }
            cell = [tableView dequeueReusableCellWithIdentifier:reuseMainType2CellIdentifier];
            break;
        }
            
        case 2: case 5: case 7:{
            for (int i = 1; i<=12; i++) {
                [imageArray addObject:[NSString stringWithFormat:@"%d-%d", (int)indexPath.row+1, i]];
            }
            cell = [tableView dequeueReusableCellWithIdentifier:reuseMainType3CellIdentifier];
            break;
        }
        case 3:{
            for (int i = 1; i<=13; i++) {
                [imageArray addObject:[NSString stringWithFormat:@"%d-%d", (int)indexPath.row+1, i]];
            }
            cell = [tableView dequeueReusableCellWithIdentifier:reuseMainType4CellIdentifier];
            break;
        }
   
        default:
            break;
    }
    [cell setImageNameArray:imageArray];
    [cell maskingViewTweenedAnimation];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (IBAction)backgroundTouchUpInside:(UIControl *)sender {
    HomePageViewController *homePageViewController = [[HomePageViewController alloc]initWithNibName:@"HomePageViewController" bundle:nil];
    [self.navigationController pushViewController:homePageViewController animated:YES];
}
@end
