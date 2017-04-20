//
//  LPWebBlogViewController.m
//  LPDemoSet
//
//  Created by SIYIN on 17/4/20.
//  Copyright © 2017年 杨湘慧. All rights reserved.
//

#import "LPWebBlogViewController.h"
#import "LPBlogController.h"

@interface LPWebBlogViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong)NSArray *keyDataArray;
@property (nonatomic, strong)NSArray *valueDataArray;

@end

@implementation LPWebBlogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"web页面";
    self.keyDataArray = @[
                        @"iOS近场通信(蓝牙开发,WiFi开发)",
                        @"IOS客户端公共WIFI解决方案",
                        @"罗朝辉（飘飘白云",
                        @"图书列表推荐",
                        @"iOS近场通信(蓝牙开发,WiFi开发)",
                        @"iOS近场通信(蓝牙开发,WiFi开发)"
                       ];
    
    self.valueDataArray = @[
                          @"http://www.jianshu.com/p/13832a596822",
                          @"http://00red.com/blog/2015/01/14/teacher-wifi-solution/",
                          @"http://blog.csdn.net/kesalin/article/details/8801156",
                          @"https://github.com/luozhaohui/books/blob/master/reading/mindset.md",
                          @"iOS近场通信(蓝牙开发,WiFi开发)",
                          @"iOS近场通信(蓝牙开发,WiFi开发)"
                          ];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor blueColor];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.keyDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    NSString *str  = [NSString stringWithFormat:@"%ld——%@",indexPath.row+1,self.keyDataArray[indexPath.row]];
    cell.textLabel.text =str ;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LPBlogController *webVc = [[LPBlogController alloc] init];
    webVc.urlStr = self.valueDataArray[indexPath.row];
    webVc.title = self.keyDataArray[indexPath.row];

    [self.navigationController pushViewController:webVc animated:YES];
    
}
@end
