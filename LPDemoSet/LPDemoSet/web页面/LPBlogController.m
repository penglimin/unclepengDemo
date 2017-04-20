//
//  LPBlogController.m
//  LPDemoSet
//
//  Created by SIYIN on 17/4/20.
//  Copyright © 2017年 杨湘慧. All rights reserved.
//

#import "LPBlogController.h"

@interface LPBlogController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation LPBlogController

- (void)setUrlStr:(NSString *)urlStr
{
    _urlStr = urlStr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.urlStr);
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
//    self.webView.delegate = self;
    NSURL *url = [NSURL URLWithString:_urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    [self.view addSubview:self.webView];
}
@end
