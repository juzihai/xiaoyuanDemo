//
//  BaseViewController.m
//  PuTaoShuPro
//
//  Created by CK GuoZi on 2017/11/1.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "BaseViewController.h"

@implementation UIView (FindFirstResponder)

- (UIView *) findFirstResponder {
    
    if (self.isFirstResponder) return self;
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView findFirstResponder];
        if (firstResponder != nil) return firstResponder;
    }
    return nil;
}

@end

@interface BaseViewController (){
    UIImageView*imgview;
    UIButton *backBtn;
}

@end

@implementation BaseViewController
-(id)init{
    self=[super init];
    if (self) {
        //        //1.2告诉manager只下载原始数据, 不要解析数据(一定要写) AFN即可以下载网络数据, 又可以解析json数据,如果不写下面的  自动就解析json
        //        //     由于做服务器的人返回json数据往往不规范, 凡是AFN又检查很严格,导致json解析往往失败
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rootTabbarController = (MainTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }

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
