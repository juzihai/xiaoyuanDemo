//
//  ViewController.m
//  ios正则表达式demo
//
//  Created by CK GuoZi on 2017/10/12.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "ViewController.h"
#import "DataVerify.h"
#import "MyUtil.h"
@interface ViewController (){
    UITextField*tf;
    UITextField*tf1;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tf=[MyUtil createTextFieldFrame:CGRectMake(100, 100, 100, 100) backgroundColor:nil secureTextEntry:YES placeholder:@"2233" clearsOnBeginEditing:NO];
    tf1=[MyUtil createTextFieldFrame:CGRectMake(100, 200, 100, 100) backgroundColor:[UIColor yellowColor] placeholder:@"2233" clearsOnBeginEditing:YES];
    [self.view addSubview:tf];
    [self.view addSubview:tf1];
    
    NSLog(@"%d",[DataVerify validateNickname:@"aaaa"]);
     NSLog(@"%d",[DataVerify validateUserName:@"aaaaaa"]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
