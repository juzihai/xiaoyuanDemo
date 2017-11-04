//
//  ViewController.m
//  各种封装demo
//
//  Created by CK GuoZi on 2017/10/11.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "ViewController.h"
#import "MyUtil.h"
@interface ViewController (){
    UILabel*label;
    UITextField*tf;
    UITextField*tf1;
    UITextField*tf2;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString*ss=@"ssssssssssssssssssssssssssssssssssssssssssssss";
    label=[MyUtil createLableFrame:CGRectMake(100, 100, 100, 100) text:ss textColor:[UIColor redColor]];
    tf=[MyUtil createTextFieldFrame:CGRectMake(100, 100, 100, 100) background:[UIImage imageNamed:@""] placeholder:ss clearsOnBeginEditing:YES];
    [self.view addSubview:label];
//    NSString*str=@"()";
//    NSArray*arr=str;
//    NSLog(@"%@",str);
//    NSLog(@"%@",arr);
//    {
//        UILabel *label                  = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 30)];
//        //label.layer.borderWidth         = 1.f;
//        CGPoint point                   = self.view.center;
//        point.y                         = 70;
//        label.center                    = point;
//        label.text                      = @"YouXianMing NoZuoNoDie";
//        label.textAlignment             = NSTextAlignmentCenter;
//        label.adjustsFontSizeToFitWidth = YES;
//        label.baselineAdjustment        = UIBaselineAdjustmentAlignCenters;
//        [self.view addSubview:label];
//    }
//
//    {
//        UILabel *label                  = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
//        label.layer.borderWidth         = 1.f;
//        CGPoint point                   = self.view.center;
//        point.y                         = 120;
//        label.center                    = point;
//        label.text                      = @"YouXianMing NoZuoNoDie";
//        label.textAlignment             = NSTextAlignmentCenter;
//        label.adjustsFontSizeToFitWidth = YES;
//        label.baselineAdjustment        = UIBaselineAdjustmentAlignCenters;
//        [self.view addSubview:label];
//    }
//
//    {
//        UILabel *label                  = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
//        label.layer.borderWidth         = 1.f;
//        CGPoint point                   = self.view.center;
//        point.y                         = 170;
//        label.center                    = point;
//        label.text                      = @"YouXianMing NoZuoNoDie";
//        label.textAlignment             = NSTextAlignmentCenter;
//        label.adjustsFontSizeToFitWidth = YES;
//        label.baselineAdjustment        = UIBaselineAdjustmentAlignCenters;
//        [self.view addSubview:label];
//    }
//
//    {
//        UILabel *label                  = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
//        label.layer.borderWidth         = 1.f;
//        CGPoint point                   = self.view.center;
//        point.y                         = 220;
//        label.center                    = point;
//        label.text                      = @"YouXianMing NoZuoNoDie";
//        label.textAlignment             = NSTextAlignmentCenter;
//        label.adjustsFontSizeToFitWidth = YES;
//        label.baselineAdjustment        = UIBaselineAdjustmentAlignCenters;
//        [self.view addSubview:label];
//    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
