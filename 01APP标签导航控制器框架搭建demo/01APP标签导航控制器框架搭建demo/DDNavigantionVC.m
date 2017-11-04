//
//  DDNavigantionVC.m
//  01APP标签导航控制器框架搭建demo
//
//  Created by CK GuoZi on 2017/9/21.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "DDNavigantionVC.h"

@interface DDNavigantionVC ()

@end

@implementation DDNavigantionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.view.frame=CGRectMake(0, 0, CGRectGetWidth(self.view.frame), UINavigationControllerHideShowBarDuration);
//    for (UIView*view in self.view.subviews) {
//        if ([NSStringFromClass([view class]) containsString:@"Background"]) {
//             view.frame = self.view.bounds;
//        }else if ([NSStringFromClass([view class]) containsString:@"ContentView"]) {
//            CGRect frame = view.frame;
//            frame.origin.y = ;
//            frame.size.height = self.bounds.size.height - frame.origin.y;
//            view.frame = frame;
//        }
    //}
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
