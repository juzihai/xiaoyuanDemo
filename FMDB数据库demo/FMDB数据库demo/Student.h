//
//  Student.h
//  FMDB数据库demo
//
//  Created by CK GuoZi on 2017/10/23.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property(nonatomic,assign)int id;

@property(nonatomic,strong)NSString*name;
@property(nonatomic,strong)NSString*sex;

@property(nonatomic,assign)int age;
@end
