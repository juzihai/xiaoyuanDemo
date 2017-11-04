//
//  ViewController.m
//  Demo
//
//  Created by CK GuoZi on 2017/9/9.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "ViewController.h"
#import "PupaPayViewController.h"
#import "ReadyPufaPayViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "SelectPickView.h"
#import <MessageUI/MessageUI.h>
@interface ViewController ()<MFMessageComposeViewControllerDelegate>
{
    NSArray*array;
    UIAlertView*alt;
}
//@property (nonatomic,strong)NSArray * array;//展示
@property (nonatomic,strong)NSArray * nameArray;//展示名字
@property (nonatomic,strong)NSArray * nameArray1;//展示名字
@property (nonatomic,strong)NSArray * idArray;//展示id
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    // CFMutableStringRef类型写法
//    //CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, CFSTR("中国"));
//    // 可变字符串写法
//    NSMutableString *string = [NSMutableString stringWithString:@"中国"];
//    Boolean isSuccess =CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformMandarinLatin, NO);
//    //Boolean isSuccess = CFStringTransform(string, NULL, kCFStringTransformMandarinLatin, NO);//国语拉丁文
//    NSLog(@"%@", isSuccess ? @"YES" : @"NO");
//    // string 就是转换完的结果
//    NSLog(@"%@", string);
//    // 去掉变音符号
//    CFStringTransform((__bridge CFMutableStringRef)string, NULL, kCFStringTransformStripDiacritics, NO);
//    NSLog(@"%@", string);
//    // 这里面参数三也可以选 kCFStringTransformStripCombiningMarks 指去掉重音和变音符
    
    array=@[@"物业项目",@"地产项目"];
    _nameArray=@[@"物业-公共报修",@"物业-业主户内报修"];
    _nameArray1=@[@"地产保修期内",@"地产保修期外"];
    
    

    UIButton*btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.backgroundColor=[UIColor grayColor];
    btn.frame=CGRectMake(100, 100, 100, 40);
    btn.tag=100;
    [btn setTitle:@"1" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(Change:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
   
    UIButton*btn1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.backgroundColor=[UIColor grayColor];
    btn1.frame=CGRectMake(100, 200, 100, 40);
    btn1.tag=101;
    [btn1 setTitle:@"2" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(Change:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    

    array=@[@"1",@"2",@"3"];
//    SelectPickView*pick=[[SelectPickView alloc]initWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 200)];
//    pick.selectPick.delegate=self;
//    pick.selectPick.dataSource=self;
//    [self.view addSubview:pick];
    
//    // 设置允许摇一摇功能
//    [UIApplication sharedApplication].applicationSupportsShakeToEdit = NO;
//    // 并让自己成为第一响应者
//    [self becomeFirstResponder];
    

    

    NSLog(@"");
    
    
    

}
#pragma mark - 摇一摇相关方法
// 摇一摇开始摇动
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"开始摇动");
    
    AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate, ^{
        //播放震动完事调用的块
    });
    return;
}

// 摇一摇取消摇动
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"取消摇动");
    return;
}

// 摇一摇摇动结束
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype == UIEventSubtypeMotionShake) { // 判断是否是摇动结束
        NSLog(@"摇动结束");
    }
    return;
}

//指定pickerview有几个表盘
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
//指定每个表盘上有几行数据
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 2;
}
//指定每行如何展示数据（此处和tableview类似）
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString*title=nil;
    switch (component) {
        case 0:
            title=_nameArray[row];
            break;
        case 1:
            title=_nameArray1[row];
            break;
            
        default:
            break;
    }

    return title;
}
//选中时回调的委托方法
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//    NSString*str=array[row];
//    NSLog(@"%@",str);
}

-(void)Change:(UIButton*)btn{
    if (btn.tag==100) {
        
        //添加 字典，将label的值通过key值设置传递
        
//        NSDictionary *dict =[[NSDictionary alloc] initWithObjectsAndKeys:self.textFieldOne.text,@"textOne",self.textFieldTwo.text,@"textTwo", nil];
//        


//        PupaPayViewController*pupa=[[PupaPayViewController alloc]init];
//        [self.navigationController pushViewController:pupa animated:YES];
        //显示发短信的控制器
        
        MFMessageComposeViewController *vc =[[MFMessageComposeViewController alloc] init];
        
        // 设置短信内容
        
        vc.body = @"吃饭了没？";
        
        // 设置收件人列表
        
        vc.recipients = @[@"10086", @"13838383838"];
        
        // 设置代理
        
        vc.messageComposeDelegate = self;
        
        // 显示控制器
        
        [self presentViewController:vc animated:YES completion:nil];

    }else if (btn.tag==101){
//        ReadyPufaPayViewController*ready=[[ReadyPufaPayViewController alloc]init];
//        [self.navigationController pushViewController:ready animated:YES];
//        alt=[[UIAlertView alloc]initWithTitle:@"1" message:@"22" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:@"取消", nil];
//        [alt show];
//        NSArray*images=@[@"110.jpg"];
//        UIActivityViewController*activity=[[UIActivityViewController alloc]initWithActivityItems:images applicationActivities:nil];
//        
//        [self.navigationController presentViewController:activity animated:YES completion:nil];
        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"186xxxx6979"];
        //            NSLog(@"str======%@",str);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        

        


        
    }
    }
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView==alt&&buttonIndex==0) {
        PupaPayViewController*pupa=[[PupaPayViewController alloc]init];
    [self.navigationController pushViewController:pupa animated:YES];

    }
    }

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    // 关闭短信界面
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    if (result==MessageComposeResultCancelled) {
        NSLog(@"取消发送");
    }else if (result == MessageComposeResultSent){
        NSLog(@"已经发出");
    }else{
        NSLog(@"发送失败");
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
