//
//  LPPublishViewController.m
//  LPDemoSet
//
//  Created by SIYIN on 17/4/20.
//  Copyright © 2017年 彭利民. All rights reserved.
//

#import "LPPublishViewController.h"
#import "LPPingViewController.h"
#import "LPWIFIInfoViewController.h"
#import "LPWifiGateWayViewController.h"

@interface LPPublishViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong)NSArray *dataArray;
@end

@implementation LPPublishViewController

//- (NSMutableArray *)dataArray
//{
//    if (_dataArray == nil) {
//        _dataArray = [NSMutableArray array];
//        [_dataArray  addObject:@"Ping域名、Ping某IP"];
//    }
//    return _dataArray;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = @[
                       @"Ping域名、Ping某IP",
                       @"获取WIFI信息",
                       @"获取WIFI网关信息"
                       ];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor blueColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    NSString *str  = [NSString stringWithFormat:@"%ld——%@",indexPath.row+1,self.dataArray[indexPath.row]];
    cell.textLabel.text =str ;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
        {
            LPPingViewController *pingVc = [[LPPingViewController alloc] init];
            [self.navigationController pushViewController: pingVc animated:YES];
            break;
        }
        case 1:
        {
            LPWIFIInfoViewController *wifiVc = [[LPWIFIInfoViewController alloc] init];
            [self.navigationController pushViewController: wifiVc animated:YES];
            break;
        }
        case 2:
        {
            LPWifiGateWayViewController *wifiVc = [[LPWifiGateWayViewController alloc] init];
            [self.navigationController pushViewController: wifiVc animated:YES];
            break;
        }

        default:
            break;
    }
}



@end
