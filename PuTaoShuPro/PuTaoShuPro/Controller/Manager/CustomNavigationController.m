//
//  CustomNavigationController.m
//  PuTaoShuPro
//
//  Created by CK GuoZi on 2017/11/1.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = COLOR_NAVIVIEW;
    self.navigationBar.tintColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    // self.interactivePopGestureRecognizer.enabled = NO;//取消侧滑返回功能
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
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
