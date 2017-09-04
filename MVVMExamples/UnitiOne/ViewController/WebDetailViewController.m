//
//  BannerDetailViewController.m
//  CKYSPlatform
//
//  Created by 庞宏侠 on 16/10/13.
//  Copyright © 2016年 ckys. All rights reserved.
//

#import "WebDetailViewController.h"
#import <WebKit/WebKit.h>
@interface WebDetailViewController ()<WKUIDelegate,WKNavigationDelegate>
@property(nonatomic,strong)WKWebView *bannerWkWebView;
@end

@implementation WebDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"新闻详情";
    [self createWebView];
    
}

-(void)createWebView{
    

   self.bannerWkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 65, SCREEN_WIDTH, SCREEN_HEIGHT - 65)];

    self.bannerWkWebView.navigationDelegate = self;
    self.bannerWkWebView.UIDelegate = self;
    self.bannerWkWebView.backgroundColor = [UIColor whiteColor];
    NSURL *url = [NSURL URLWithString:self.detailUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:30];
    [self.bannerWkWebView loadRequest:request];
    [self.view addSubview:self.bannerWkWebView];
}
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"开始加载");
}


-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
     NSLog(@"出错了webview");
   
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"webview提交数据");

}


@end
