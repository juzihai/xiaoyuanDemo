//
//  MyUtil.h
//  各种封装demo
//
//  Created by CK GuoZi on 2017/10/11.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MyUtil : NSObject

//创建标签方法
+(UILabel*)createLableFrame:(CGRect)frame text:(NSString*)text textColor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines;
+ (UILabel *)createLableFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor;

//创建按钮的方法

+ (UIButton *)createBtnFrame:(CGRect)frame title:(NSString *)title bgImageName:(NSString *)bgImageName target:(id)target action:(SEL)action;



//创建图片视图的方法

+ (UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName;



//类型的英文转化成中文

+ (NSString *)transferCateName:(NSString *)name;
/**
 *  动态设置label的宽高
 *
 *  @param font 字号
 *  @param str  文本
 *
 *  @return 高度
 */
+(CGSize)font:(UIFont *)font  str:(NSString *)str;

#pragma mark ============= <#注释的内容#> =============
//创建view ，指定背景色
+ (UIView*)createViewFrame:(CGRect)frame backgroundColor:(UIColor*)color;

//创建lable
+ (UILabel*)createLableFrame:(CGRect)frame  backgroundColor:(UIColor *)color  text:(NSString *)str  textColor:(UIColor *)textColor font:(UIFont *)font  numberOfLines:(int)numberOfLines   adjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth;

//创建imageView
+ (UIImageView *)creatImageViewFrame:(CGRect)frame image:(UIImage*)image;
+ (UIImageView *)creatImageViewFrame:(CGRect)frame imageName:(NSString*)imageName;

//创建button，无背景图片
+ (UIButton *)creatButtonFrame:(CGRect )frame  backgroundColor:(UIColor*)color    setTitle:(NSString *)title   setTitleColor:(UIColor *)TitleColor    addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents ;

//创建button，有背景图片,无字体
+ (UIButton *)creatButtonFrame:(CGRect )frame  setBackgroundImage:(UIImage *)image   addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

//创建button，有背景图片
+ (UIButton *)creatButtonFrame:(CGRect )frame  setBackgroundImage:(UIImage *)image  setTitle:(NSString *)title setTitleColor:(UIColor *)TitleColor  addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

//创建textField,无图片，有密码。
+(UITextField *)createTextFieldFrame:(CGRect )frame backgroundColor:(UIColor*)color secureTextEntry:(BOOL)secureTextEntry    placeholder:(NSString *)str clearsOnBeginEditing:(BOOL)clearsOnBeginEditing ;

//创建textField,无图片，无密码。
+(UITextField *)createTextFieldFrame:(CGRect )frame backgroundColor:(UIColor*)color   placeholder:(NSString *)str clearsOnBeginEditing:(BOOL)clearsOnBeginEditing ;

//创建textField,有图片，无密码。
+(UITextField *)createTextFieldFrame:(CGRect )frame background:(UIImage *)image    placeholder:(NSString *)str clearsOnBeginEditing:(BOOL)clearsOnBeginEditing ;

//创建textField,有图片，有密码。
+(UITextField *)createTextFieldFrame:(CGRect )frame background:(UIImage *)image secureTextEntry:(BOOL)secureTextEntry   placeholder:(NSString *)str clearsOnBeginEditing:(BOOL)clearsOnBeginEditing ;

@end
