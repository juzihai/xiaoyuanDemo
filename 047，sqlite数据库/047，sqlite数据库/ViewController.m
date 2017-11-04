//
//  ViewController.m
//  047，sqlite数据库
//
//  Created by CK GuoZi on 2017/11/2.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray*arrtitle=[NSArray arrayWithObjects:
                      @"创建数据库",@"插入数据",@"删除数据",@"查找数据", nil];
    for (int i=0; i<4; i++) {
        UIButton*btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame=CGRectMake(100, 100+80*i, 100, 40);
        [btn addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=100+i;
        [btn setTitle:arrtitle[i] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        
        
    }
}
-(void)change:(UIButton*)btn{
    //创建打开数据库
    if (btn.tag==100) {
        //获取数据库的创建路径
        //NSHomeDirectory（）获取手机app的沙盒路径
        NSString*strPath=[NSHomeDirectory() stringByAppendingString:@"/Documents/db01.db"];
        
        //创建并且打开数据库，如果路径下面没有数据库，那就创建指定的数据库
        //如果路径下已经存在，那就加载数据库到内存
        _mDB=[FMDatabase databaseWithPath:strPath];
        if (_mDB!=nil) {
            NSLog(@"数据库创建成功");
        }
        //打开数据库
        BOOL isOpen=[_mDB open];
        if (isOpen) {
            NSLog(@"打开数据库成功");
        }
        //将sql创建语句写到字符串中
        NSString*strCreateTable=@"create table if not exists stu(id intage primary key,age integer,name varchar(20));";
        //执行sql语句，sql语句有效
        //如果返回成功，返回一个yes，失败no
        BOOL isCreate=[_mDB executeUpdate:strCreateTable];
        if (isCreate==YES) {
            NSLog(@"创建数据表成功");
        }
        //关闭数据库
        BOOL isClose=[_mDB close];
        if (isClose) {
            NSLog(@"关闭数据库成功");
        }
    }
    else if (btn.tag==101){//添加数据库数据
        NSString*strPath=[NSHomeDirectory() stringByAppendingString:@"/Documents/db01.db"];
        
        //创建并且打开数据库，如果路径下面没有数据库，那就创建指定的数据库
        //如果路径下已经存在，那就加载数据库到内存
        _mDB=[FMDatabase databaseWithPath:strPath];
        //确保数据库被加载
        if (_mDB!=nil) {
            
            //打开数据库
            if ([_mDB open]) {
                NSString*strInsert=@"insert into stu values(3,21,'will');";
                BOOL isOK=[_mDB executeUpdate:strInsert];
                if (isOK==YES) {
                    NSLog(@"添加数据成功");
                }
            }
        }
        
    }else if (btn.tag==102){//删除数据
        NSString*strPath=[NSHomeDirectory() stringByAppendingString:@"/Documents/db01.db"];
        
        //创建并且打开数据库，如果路径下面没有数据库，那就创建指定的数据库
        //如果路径下已经存在，那就加载数据库到内存
        _mDB=[FMDatabase databaseWithPath:strPath];
        //创建查找sql语句
        NSString*strdelete=@"delete from stu where id=1;";
        BOOL isOpen=[_mDB open];
        [_mDB executeUpdate:strdelete] ;
        
    }else if (btn.tag==103){//查找并打印数据
        NSString*strPath=[NSHomeDirectory() stringByAppendingString:@"/Documents/db01.db"];
        
        //创建并且打开数据库，如果路径下面没有数据库，那就创建指定的数据库
        //如果路径下已经存在，那就加载数据库到内存
        _mDB=[FMDatabase databaseWithPath:strPath];
        //创建查找sql语句
        NSString*strQuery=@"select * from stu;";
        BOOL isOpen=[_mDB open];
        if (isOpen) {
            //执行查找sql语句，将查找成功的结果用ResultSet返回
            FMResultSet*result=[_mDB executeQuery:strQuery];
            //便利所有结果
            while ([result next]) {
                NSInteger stuID=[result intForColumn:@"id"];
                NSString*strName=[result stringForColumn:@"name"];
                NSInteger*strAge=[result intForColumn:@"age"];
                
                NSLog(@"stu id=%d,name=%@,age=%d",stuID,strName,strAge);
                NSInteger stuID1=[result intForColumnIndex:0];
                NSString*strName1=[result stringForColumnIndex:2];
                NSInteger*strAge1=[result intForColumnIndex:1];
                
                NSLog(@"stuindex id=%d,name=%@,age=%d",stuID1,strName1,strAge1);
            }
            
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
