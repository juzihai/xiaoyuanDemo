//
//  ViewController.m
//  九宫格密码demo
//
//  Created by CK GuoZi on 2017/9/22.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self authenticateUser];
}
-(void)authenticateUser{
    //创建LAContext
    LAContext*context=[[LAContext alloc]init];
    //这个属性是设置指纹输入失败之后的弹出框的选项
    context.localizedFallbackTitle=@"请在试";
    
    NSError*error=nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        NSLog(@"支持指纹识别");
        // localizedReason: 用于设置提示语，表示为什么要使用Touch ID
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"请按home键指纹解锁" reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    // Update UI in UI thread here
                    NSLog(@"验证成功 刷新主界面");
                });
                
            }else{
                NSLog(@"%@",error.localizedDescription);
                switch (error.code) {
                    case LAErrorSystemCancel:
                    {
                        NSLog(@"系统取消授权，如其他APP切入");
                        break;
                    }
                    case LAErrorUserCancel:
                    {
                        NSLog(@"用户取消验证Touch ID");
                        break;
                    }
                    case LAErrorAuthenticationFailed:
                    {
                        NSLog(@"授权失败");
                        break;
                    }
                    case LAErrorPasscodeNotSet:
                    {
                        NSLog(@"系统未设置密码");
                        break;
                    }
                    case LAErrorTouchIDNotAvailable:
                    {
                        NSLog(@"设备Touch ID不可用，例如未打开");
                        break;
                    }
                    case LAErrorTouchIDNotEnrolled:
                    {
                        NSLog(@"设备Touch ID不可用，用户未录入");
                        break;
                    }
                    case LAErrorUserFallback: // 用于设置左边的按钮的名称，默认是Enter Password
                    {
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            NSLog(@"用户选择输入密码，切换主线程处理");
                        }];
                        break;
                    }
                    default:
                    {
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            NSLog(@"其他情况，切换主线程处理");
                        }];
                        break;
                    }
                }
            }
            

            
        }];
        
        
        
        
        
        
    }else{
        NSLog(@"不支持指纹识别");
        switch (error.code) {
            case LAErrorTouchIDNotEnrolled:
            {
                NSLog(@"TouchID is not enrolled");
                break;
            }
            case LAErrorPasscodeNotSet:
            {
                NSLog(@"A passcode has not been set");
                break;
            }
            default:
            {
                NSLog(@"TouchID not available");
                break;
            }
        }
        
        NSLog(@"%@",error.localizedDescription);
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
