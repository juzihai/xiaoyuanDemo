//
//  Person.m
//  单例练习
//
//  Created by CK GuoZi on 2017/10/31.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "Person.h"
#import "User.h"
@implementation Person
-(void)outputNameAndPwd{
    User*user=[[User alloc]init];
    //NSLog(@"使用者的名字：%@，使用者的密码：%@",user.name,user.password);
    NSLog(@"使用者的名字：%@，使用者的密码：%@",[user name],[user password]);
    //两种输出一样的表达方式
}
@end
