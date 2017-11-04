//
//  DDMainVC.m
//  01APP标签导航控制器框架搭建demo
//
//  Created by CK GuoZi on 2017/9/21.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "DDMainVC.h"
#import "DiscoverVC.h"
#import "DDMineVC.h"
@interface DDMainVC ()

@end

@implementation DDMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
     UIViewController *mainVC = [self getClassName:@"DiscoverVC" nameTitle:@"首页" imageName:@"home_line"];
    UIViewController*mineVC=[self getClassName:@"DDMineVC" nameTitle:@"w " imageName:@""];
    self.viewControllers=@[mainVC,mineVC];
}
-(UIViewController*)getClassName:(NSString*)classStr nameTitle:(NSString*)nameTitle imageName:(NSString*)imaggeName{
    Class cLs=NSClassFromString(classStr);
    UIViewController*vc=[[cLs alloc]init];
    NSAssert([vc isKindOfClass:[UIViewController class]], @"%@类名写错了",classStr);
              vc.title=nameTitle;
              vc.tabBarItem.image=[UIImage imageNamed:imaggeName];
              UINavigationController*nav=[[UINavigationController alloc]initWithRootViewController:vc];
              return nav;
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
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
