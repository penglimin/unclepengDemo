//
//  LPWIFIInfoViewController.m
//  LPDemoSet
//
//  Created by SIYIN on 17/4/20.
//  Copyright © 2017年 杨湘慧. All rights reserved.
//

#import "LPWIFIInfoViewController.h"

// 需要添加SystemConfiguration.framework 并在当前类中添加代码#import <SystemConfiguration/CaptiveNetwork.h>

#import <SystemConfiguration/CaptiveNetwork.h>


@interface LPWIFIInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *wifiName;

@end

@implementation LPWIFIInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"WIFI信息";
    
    NSDictionary *dicts = [self fetchSSIDInfo];

    self.resultLabel.text = [NSString stringWithFormat:@"%@",dicts];
    self.resultLabel.backgroundColor = [UIColor lightGrayColor];
    
    self.wifiName.text =  [NSString stringWithFormat:@"wifi名字: %@", [self fetchWiFiName]];
    
    NSLog(@"%@\n",dicts);
    NSLog(@"%@",[self fetchWiFiName]);
}

// 获取WIFI名称
- (NSString *)fetchWiFiName {
    NSArray *ifs = (__bridge_transfer NSArray *)CNCopySupportedInterfaces();
    if (!ifs) {
        return nil;
    }
    NSString *WiFiName = nil;
    for (NSString *ifnam in ifs) {
        NSDictionary *info = (__bridge_transfer NSDictionary *)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) {
            // 这里其实对应的有三个key:kCNNetworkInfoKeySSID、kCNNetworkInfoKeyBSSID、kCNNetworkInfoKeySSIDData，
            // 不过它们都是CFStringRef类型的
            WiFiName = [info objectForKey:(__bridge NSString *)kCNNetworkInfoKeySSID];
            //            WiFiName = [info objectForKey:@"SSID"];
            break;
        }
    }
    return WiFiName;
}

//获取WiFi 信息，返回的字典中包含了WiFi的名称、路由器的Mac地址、还有一个Data(转换成字符串打印出来是wifi名称)
- (NSDictionary *)fetchSSIDInfo {
    NSArray *ifs = (__bridge_transfer NSArray *)CNCopySupportedInterfaces();
    if (!ifs) {
        return nil;
    }
    
    NSDictionary *info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer NSDictionary *)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) { break; }
    }
    return info;
}

@end
