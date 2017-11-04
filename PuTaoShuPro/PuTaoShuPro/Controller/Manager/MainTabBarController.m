//
//  MainTabBarController.m
//  PuTaoShuPro
//
//  Created by CK GuoZi on 2017/11/1.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "SerivceViewController.h"
#import "CenterViewController.h"
#import "CustomNavigationController.h"
#import "RDVTabBarItem.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

-(instancetype)init{
    self=[super init];
    if (self) {
        HomeViewController *book=[[HomeViewController alloc]init];
       // book.title=@"1";
        SerivceViewController *search=[[SerivceViewController alloc]init];
       // search.title=@"2";
        //    load 个人中心界面
        CenterViewController *UCenter=[[CenterViewController alloc]init];
        //UCenter.title=@"3";
        CustomNavigationController *bookNav = [[CustomNavigationController alloc] initWithRootViewController:book];
        CustomNavigationController *serviceNav = [[CustomNavigationController alloc] initWithRootViewController:search];
        //        CustomNavigationController *orderNav = [[CustomNavigationController alloc] initWithRootViewController:order];
        CustomNavigationController *centerNav = [[CustomNavigationController alloc] initWithRootViewController:UCenter];
        UIView *separaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.5)];
        separaView.backgroundColor = [UIColor lightGrayColor];
        separaView.alpha = 0.4f;
        
        [self tabBar].backgroundColor = RGBACOLOR(240, 240, 240, 1);
        [self tabBar].contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [self tabBar].contentMode = UIViewContentModeScaleAspectFill;
        //[[self tabBar] setHeight:83];
        //[[self tabBar] setHeight:49];
        [self tabBar].backgroundView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1.0];
        [self tabBar].delegate = self;
        [self setViewControllers:[NSArray arrayWithObjects:bookNav,serviceNav,centerNav,nil]];
        [self setupTabbarItems];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        [[self tabBar] addSubview:separaView];
        //        [self.navigationController setNavigationBarHidden:YES];
        //        self.navigationController.navigationBarHidden = YES;
    }
    return self;
}
- (void)setupTabbarItems{
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSInteger index = 1;
    for (RDVTabBarItem *item in [[self tabBar] items]) {
        item.titlePositionAdjustment = UIOffsetMake(2, 4);
        item.imagePositionAdjustment = UIOffsetMake(0, 0);
        item.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0f];
        item.unselectedTitleAttributes = @{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],NSForegroundColorAttributeName : [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0f]};
        item.selectedTitleAttributes = @{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue" size:10.0f],NSForegroundColorAttributeName : [UIColor colorWithRed:0 green:153/255.0 blue:0 alpha:1.0f]};
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *unselectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"tabbar%ld",(long)(index )]];
        UIImage *selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"tabbar%ld_sel",(long)(index)]];
        [item setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:unselectedImage];
        index++;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
