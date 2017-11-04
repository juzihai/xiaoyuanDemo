//
//  ReadyPufaPayViewController.m
//  Demo
//
//  Created by CK GuoZi on 2017/9/9.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "ReadyPufaPayViewController.h"

@interface ReadyPufaPayViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIPickerView*pickerView;
    NSArray*array;
}

@end

@implementation ReadyPufaPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString*guid=[[NSUUID UUID]UUIDString];
    NSLog(@"guid=%@",guid);
    array=@[@"1",@"2",@"3"];
    pickerView=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 100, 300, 200)];
    pickerView.delegate=self;
    pickerView.dataSource=self;
    [self.view addSubview:pickerView];
}
//指定pickerview有几个表盘
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
//指定每个表盘上有几行数据
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return array.count;
}
//指定每行如何展示数据（此处和tableview类似）
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString*title=nil;
    title=array[row];
    return title;
}
//选中时回调的委托方法
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString*str=array[row];
    NSLog(@"%@",str);
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
