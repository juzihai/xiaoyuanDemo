//
//  User.h
//  单例练习
//
//  Created by CK GuoZi on 2017/10/31.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCopying>

@property(nonatomic,copy)NSString*name;
@property(nonatomic,copy)NSString*password;

//单例的类方法命名一般用share+当前类名
+(instancetype)shareUser;

@end
