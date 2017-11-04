//
//  filtrateVC.m
//  黄金demo
//
//  Created by CK GuoZi on 2017/9/21.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "filtrateVC.h"

@interface filtrateVC ()
{
    CGFloat index;
}

@end

@implementation filtrateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIButton*filtrate=[UIButton buttonWithType:UIButtonTypeCustom];
    filtrate.tag=1;
    index=filtrate.tag;
    filtrate.frame=CGRectMake(100, 100, 100, 100);
    filtrate.backgroundColor=[UIColor blueColor];
    [filtrate setTitle:@"筛选" forState:UIControlStateNormal];
    [filtrate addTarget:self action:@selector(Change) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:filtrate];

}
-(void)Change{
    NSDictionary*dic=@{@"index":[NSNumber numberWithInt:index]};
    NSLog(@"%@",dic);
    [[NSNotificationCenter defaultCenter]postNotificationName:@"Noti" object:Nil userInfo:dic];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
