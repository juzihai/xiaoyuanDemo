//
//  DDMineVC.m
//  01APP标签导航控制器框架搭建demo
//
//  Created by CK GuoZi on 2017/9/21.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "DDMineVC.h"

@interface DDMineVC ()

@end

@implementation DDMineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    UIStepper *stepper = [[UIStepper alloc] init];
    stepper.minimumValue = 0;//最大值
    stepper.maximumValue = 5;//最小值
    stepper.stepValue = 1;// 每次增减值
    stepper.value = 0;//当前值
    stepper.continuous = YES;//是否循环，默认循环
    stepper.wraps = YES;// 判断是否循环，即到最大值后又从最小值开始
    stepper.tintColor = [UIColor purpleColor];//设置按钮的颜色
    [stepper setBackgroundColor:[UIColor whiteColor]];//设置背景颜色
    stepper.center = CGPointMake(160, 240);
    [stepper addTarget:self action:@selector(valueChanged:) forControlEvents:(UIControlEventValueChanged)];
    [self.view addSubview:stepper];
    
    label = [[UILabel alloc] init];
    label.frame = CGRectMake(150, 300, 40, 30);
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
}

- (void)valueChanged:(UIStepper *)stepper
{
    [self.view viewWithTag:200].alpha = stepper.value;
    
    label.text = [NSString stringWithFormat:@"%.2f", stepper.value];
    NSLog(@"%f", stepper.value);
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
