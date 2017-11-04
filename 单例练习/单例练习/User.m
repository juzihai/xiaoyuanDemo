//
//  User.m
//  单例练习
//
//  Created by CK GuoZi on 2017/10/31.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "User.h"
//static 修饰对象，只有在程序结束时才会被释放
static User*user=nil;
@implementation User
/*
 创建单例类的步骤
 1，保留一个单例对象的静态实例
 2，声明和实现一个类方法，返回一个有值的该类对象
 3，重写allocwithzone方法，做判空处理
 4，重写copwithzone方法，防止copy时创建新对象
 */
+(instancetype)shareUser{
    //synchronized能保证里面的北荣同时只能被一个线程执行
    @synchronized(self){
        //首先判断是不是nil，如果为nil再创建
        if (user==nil) {
            user=[[User alloc]init];
        }
    }
    return user;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    if (user==nil) {
        user=[super allocWithZone:zone];
    }
    return user;
}
-(id)copyWithZone:(NSZone *)zone{
    return user;
}

@end
