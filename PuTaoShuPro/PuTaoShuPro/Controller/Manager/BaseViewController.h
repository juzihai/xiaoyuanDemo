//
//  BaseViewController.h
//  PuTaoShuPro
//
//  Created by CK GuoZi on 2017/11/1.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MainTabBarController.h"

@class MainTabBarController;

@interface BaseViewController : UIViewController

@property (nonatomic,strong)UIVisualEffectView *visualEffectView;

@property (nonatomic,strong) UIView *navigationView;

@property (nonatomic,strong) MainTabBarController *rootTabbarController;
@end
