//
//  PupaPayViewController.m
//  Demo
//
//  Created by CK GuoZi on 2017/9/9.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "PupaPayViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
@interface PupaPayViewController ()<UIWebViewDelegate>

@end

@implementation PupaPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWebView];
}
- (void)initWebView{
    // 1.创建webview，并设置大小，"20"为状态栏高度
//    CGFloat width = self.view.frame.size.width;
//    CGFloat height = self.view.frame.size.height;
//    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0,0,width,height)];
//    // 2.创建URL
//    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
//    // 3.创建Request
//    NSURLRequest *request =[NSURLRequest requestWithURL:url];
//    // 4.加载网页
//    [webView loadRequest:request];
//    // 5.最后将webView添加到界面
//    [self.view addSubview:webView];
//    
//    webView.delegate = self;
    
    
    //注册通知
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi:) name:@"tongzhi" object:nil];
}
- (void)tongzhi:(NSNotification *)text{
    
    NSLog(@"%@",text.userInfo[@"textOne"]);
    
    NSLog(@"－－－－－接收到通知------");
    
}
#pragma mark - UIWebViewDelegate代理方法
#pragma mark 开始加载
////是否允许加载网页，也可获取js要打开的url，通过截取此url可与js交互
//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request
// navigationType:(UIWebViewNavigationType)navigationType
//{
//    //截取URL，这里可以和JS进行交互，但这里没有写，因为会涉及到JS的一些知识，增加复杂性
////    NSString *urlString = [request.URL absoluteString];
////    urlString = [urlString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
////    NSArray *urlComps = [urlString componentsSeparatedByString:@"://"];
////    NSLog(@"urlString=%@---urlComps=%@",urlString,urlComps);
//    return YES;
//}

//开始加载网页
-(void)webViewDidStartLoad:(UIWebView *)webView{
    //显示网络请求加载
    [UIApplication sharedApplication].networkActivityIndicatorVisible = true;
}
//网页加载完成
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    //隐藏网络请求加载图标
    [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"系统提示"
                                                    message:@"网络连接发生错误!"
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"确定", nil];
    [alert show];
    
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

@end
