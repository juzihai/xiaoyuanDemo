//
//  MyUtil.h
//  快捷支付demo
//
//  Created by CK GuoZi on 2017/10/13.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MyUtil : NSObject

//创建textField
+(UITextField *)textFieldWithFrame:(CGRect)frame placeholder:(NSString*)placeholder;

+(UIButton*)buttonWithFrame:(CGRect)frame Title:(NSString*)title titleColor:(UIColor*)titleColor backgroundColor:(UIColor*)backgroundColor addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)ControlEvents;

+ (UILabel*)LableWithFrame:(CGRect)frame  backgroundColor:(UIColor *)color  text:(NSString *)str  textColor:(UIColor *)textcolor font:(UIFont *)font  numberOfLines:(int)numberOfLines adjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth;
@end
