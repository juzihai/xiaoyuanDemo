//
//  ViewController.m
//  快捷支付demo
//
//  Created by CK GuoZi on 2017/10/13.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "ViewController.h"
#import "MyUtil.h"
#import "DataVerify.h"
@interface ViewController (){
    UITextField*Name;
    UITextField*IdCard;
    UITextField*BankCard;
    UITextField*Phone;
    UITextField*Time;
    UIButton*addbtn;
    
    CGFloat index;
    NSMutableArray*btnArr;
}
@property (nonatomic,strong)UIButton *Card;//储蓄卡
@property (nonatomic,strong)UIButton *CreditCard;//信用卡

@property(nonatomic,weak)UIButton*selectedBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    [self initView];
}
-(void)initView{
    NSArray*arr=@[@"储蓄卡",@"信用卡"];
    for (int i=0; i<2; i++) {
        _Card=[MyUtil buttonWithFrame:CGRectMake(10+110*i, 10, 100, 40) Title:arr[i] titleColor:[UIColor grayColor] backgroundColor:nil addTarget:self action:@selector(Change:) forControlEvents:UIControlEventTouchUpInside];
        _Card.layer.borderColor=[UIColor grayColor].CGColor;
        _Card.layer.borderWidth=1.0;
        [_Card setTitleColor:[UIColor greenColor] forState:UIControlStateSelected];
        
        _Card.tag=i;
        index=_Card.tag;
        [btnArr addObject:_Card];
        [self.view addSubview:_Card];
    }
    
//    [_DebitCard setImage:@"s" forState:UIControlStateNormal];
//    [_DebitCard setImage:@"s" forState:UIControlStateHighlighted];
//    [_DebitCard setImage:@"s" forState:UIControlStateSelected];
    Name=[MyUtil textFieldWithFrame:CGRectMake(10, 100, 300, 40) placeholder:@"持卡人姓名"];
    IdCard=[MyUtil textFieldWithFrame:CGRectMake(10, 200, 300, 40) placeholder:@"证件类型：身份证号"];
    BankCard=[MyUtil textFieldWithFrame:CGRectMake(10, 300, 300, 40) placeholder:@"银行卡号"];
    Phone=[MyUtil textFieldWithFrame:CGRectMake(10, 400, 300, 40) placeholder:@"银行卡注册手机号"];

    addbtn=[MyUtil buttonWithFrame:CGRectMake(10, 500, 300, 40) Title:@"ss" titleColor:nil backgroundColor:[UIColor greenColor] addTarget:self action:@selector(ss) forControlEvents:UIControlEventTouchUpInside];
    
    
    

    [self.view addSubview:Name];
    [self.view addSubview:IdCard];
    [self.view addSubview:BankCard];
    [self.view addSubview:Phone];
    [self.view addSubview:addbtn];
    [self initView2];
}
-(void)initView2{
    UIView*CardView=[[UIView alloc]initWithFrame:CGRectMake(0, 320, 320, 200)];
    Time=[MyUtil textFieldWithFrame:CGRectMake(10, 0, 300, 40) placeholder:@"信用卡有效期"];
    [CardView addSubview:Time];
    [self.view addSubview:CardView];
}
//其实就是判断点击的按钮是否是选中状态，是的话不用变化。不是的话，把记录的全局按钮的选中状态改为NO,重新把点击的按钮记录下，选中状态改为YES。
-(void)Change:(UIButton*)btn{
    if (btn.tag==0) {
        btn.selected=YES;
        NSLog(@"0");
    }else{
        btn.selected=YES;
    }
    
    if (btn!=self.selectedBtn) {
        self.selectedBtn.selected=NO;
        self.selectedBtn=btn;
       NSLog(@"2");
    }
    self.selectedBtn.selected=YES;

}
-(void)ss{
    //NSLog(@"%d",[DataVerify validateBankCardNumber:BankCard.text]);
    
    if ([DataVerify validateName:Name.text]==0) {//正则算法判断0错／1对
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的用户姓名" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
        return;
    }
    if ([DataVerify validateIDCardNumber:IdCard.text]==0) {
        
        UIAlertView *alertView1 = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的身份证号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView1 show];
        return;
    }
    
    if ([DataVerify validateBankCardNumber:BankCard.text]==0) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的银行卡号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
        return;
    }
    if ([DataVerify validateMobile:Phone.text]) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的手机号" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
        return;

    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
