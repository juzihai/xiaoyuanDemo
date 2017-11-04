//
//  AppDelegate.m
//  单例练习
//
//  Created by CK GuoZi on 2017/10/31.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark 系统自动生成一个窗体

//1.当Applaction对象被实例化后，程序启动调用这个方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"输出系统自己创建的window=%@",self.window);
#pragma mark  手动创建一个UIwindow对象
    /*
    //1).创建一个window对象
    //UIWindow*window=[[UIWindow alloc]init];
    //2).获取到UIScreen对象
    UIScreen*screen=[UIScreen mainScreen];
    //4).给window设置一个位置和尺寸
    CGRect rect=[screen bounds];//自动获得当前所选择的模拟器的窗体大小
    UIWindow*window=[[UIWindow alloc]initWithFrame:rect];
    //5).给窗体设置背景颜色
    window.backgroundColor=[UIColor orangeColor];
    //6).给window设置一个根控制器，window和控制共同协作起来显示界面
    window.rootViewController=[[UIViewController alloc]init];
    //7).将customwindow赋值给self.window
    self.window=window;
    //8).把定义的window作为主window,并显示出来
    [window makeKeyWindow];
    
    #pragma mark  在桌面上放一些hs
    //用试图做一个王字玩玩
    //第1个竖
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(140, 50, 40, 380);
    view.backgroundColor = [UIColor yellowColor];
    [self.window addSubview:view];
    
    //第1个横
    UIView *view1 = [[UIView alloc]init];
    view1.frame = CGRectMake(50, 50, 220, 40);
    view1.backgroundColor = [UIColor greenColor];
    [self.window addSubview:view1];
    
    //第2个横
    UIView *view2 = [[UIView alloc]init];
    view2.frame = CGRectMake(50, 220, 220, 40);
    view2.backgroundColor = [UIColor redColor];
    [self.window addSubview:view2];
    
    //第3个横
    UIView *view3 = [[UIView alloc]init];
    view3.frame = CGRectMake(40, 390, 240, 40);
    view3.backgroundColor = [UIColor purpleColor];
    [self.window addSubview:view3];
    */
    
    
    
    NSLog(@"程序启动");

    
    
    
    
    //self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    
    
    return YES;
}

//3.当应用程序将要进入非活跃状态执行，比如来电话了、锁屏等。
- (void)applicationWillResignActive:(UIApplication *)application {

     NSLog(@"程序进不活跃状态");
}

//4.一般程序进入后台，就会进入非活跃状态，但如果你的程序支持后台，程序在后台也保持活跃状态
- (void)applicationDidEnterBackground:(UIApplication *)application {
     NSLog(@"程序进入后台");
}

//5.程序进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"程序进入前台");
}

//2.当应用程序进入活跃状态执行
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"程序变成活跃状态");
}

//6.当程序将要退出是被调用，通常是用来保存数据和一些退出前的清理工作
- (void)applicationWillTerminate:(UIApplication *)application {
   NSLog(@"程序退出");
}


@end
