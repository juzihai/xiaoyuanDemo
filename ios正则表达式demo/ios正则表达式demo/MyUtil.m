//
//  MyUtil.m
//  各种封装demo
//
//  Created by CK GuoZi on 2017/10/11.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "MyUtil.h"

@implementation MyUtil

+(UILabel*)createLableFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines{
    UILabel*label=[[UILabel alloc]initWithFrame:frame];
    label.text=text;
    label.textAlignment=textAlignment;
    label.numberOfLines=numberOfLines;//N行显示，0为不限行数
    
    return label;
}
+(UILabel*)createLableFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor{
    return [self createLableFrame:frame text:text textColor:textColor textAlignment:NSTextAlignmentCenter numberOfLines:1];
}
+(UIButton*)createBtnFrame:(CGRect)frame title:(NSString *)title bgImageName:(NSString *)bgImageName target:(id)target action:(SEL)action{
    UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
+(NSString*)transferCateName:(NSString *)name{
    if ([name isEqualToString:@""]) {
        return @"";
    }
    return nil;
}
- (UIImage*)clipImage:(UIImage*)bigImage inRect:(CGRect)rect

{
    
    CGImageRef imageRef =CGImageCreateWithImageInRect(bigImage.CGImage, rect);
    
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    
    return image;
    
}
//动态设置label的宽高
+(CGSize)font:(UIFont *)font  str:(NSString *)str{
    CGSize size =CGSizeMake(300,60);
    // label可设置的最大高度和宽度
    //CGSize size = CGSizeMake(300.f, MAXFLOAT);
    //    获取当前文本的属性
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName,nil];
    //ios7方法，获取文本需要的size，限制宽度
    CGSize  actualsize =[str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
    return actualsize;
}
#pragma mark ============= <#注释的内容#> =============
+(UIView *)createViewFrame:(CGRect)frame backgroundColor:(UIColor *)color{
    
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = color;
    return view;
}

+ (UILabel*)createLableFrame:(CGRect)frame  backgroundColor:(UIColor *)color  text:(NSString *)str  textColor:(UIColor *)textcolor font:(UIFont *)font  numberOfLines:(int)numberOfLines adjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth{
    
    UILabel*lable = [[UILabel alloc]initWithFrame:frame];
    
    lable.backgroundColor = color;
    lable.text = str;
    lable.textColor =textcolor;
    lable.font = font;
    lable.numberOfLines = numberOfLines;
    lable.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
    return lable;
}

+(UIImageView *)creatImageViewFrame:(CGRect)frame image:(UIImage *)image{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    [imageView setImage:image];
    return  imageView;
    
}
+(UIButton *)creatButtonFrame:(CGRect )frame   backgroundColor:(UIColor*)color setTitle:(NSString *)title  setTitleColor:(UIColor *)TitleColor   addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = frame;
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:TitleColor forState:UIControlStateNormal];
    
    button.backgroundColor = color;
    
    [button addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents];
    
    return button;
}

+(UIButton *)creatButtonFrame:(CGRect )frame   backgroundColor:(UIColor*)color    addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = frame;
    
    [button addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents];
    
    return button;
}

+(UIButton *)creatButtonFrame:(CGRect )frame  setBackgroundImage:(UIImage *)image  setTitle:(NSString *)title setTitleColor:(UIColor *)TitleColor   addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:TitleColor forState:UIControlStateNormal];
    [button addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents];
    
    return button;
    
}
+(UIImageView *)creatImageViewFrame:(CGRect)frame imageName:(NSString *)imageName{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    UIImage *image = [UIImage imageNamed:imageName];
    [imageView setImage:image];
    return imageView;
    
}
//创建textField,无图片，有密码。
+(UITextField *)createTextFieldFrame:(CGRect )frame backgroundColor:(UIColor*)color secureTextEntry:(BOOL)secureTextEntry    placeholder:(NSString *)str clearsOnBeginEditing:(BOOL)clearsOnBeginEditing {
    
    UITextField *textField = [[UITextField alloc]init];
    textField.frame = frame ;
    textField.backgroundColor = color;
    textField.secureTextEntry =secureTextEntry;//每输入一个字符就变成点 用语密码输入
    //textField.borderStyle = UITextBorderStyleLine;
    textField.placeholder = str;
    textField.clearsOnBeginEditing =clearsOnBeginEditing;
    return textField;
    
}
//创建textField,无图片，无密码。
+(UITextField *)createTextFieldFrame:(CGRect )frame backgroundColor:(UIColor*)color   placeholder:(NSString *)str clearsOnBeginEditing:(BOOL)clearsOnBeginEditing  {
    
    UITextField *textField = [[UITextField alloc]init];
    textField.frame = frame ;
    textField.backgroundColor = color;
    //textField.borderStyle = UITextBorderStyleLine;
    textField.placeholder = str;
    textField.clearsOnBeginEditing =clearsOnBeginEditing;
    
    return textField;
}

//创建textField,有图片，无密码。
+(UITextField *)createTextFieldFrame:(CGRect )frame background:(UIImage *)image    placeholder:(NSString *)str clearsOnBeginEditing:(BOOL)clearsOnBeginEditing {
    
    UITextField *textField = [[UITextField alloc]init];
    textField.frame = frame ;
    textField.background = image ;
    //textField.borderStyle = UITextBorderStyleLine;
    textField.placeholder = str;
    textField.clearsOnBeginEditing =clearsOnBeginEditing;
    
    return textField;
}
//创建textField,有图片，有密码。
+(UITextField *)createTextFieldFrame:(CGRect )frame background:(UIImage *)image secureTextEntry:(BOOL)secureTextEntry   placeholder:(NSString *)str clearsOnBeginEditing:(BOOL)clearsOnBeginEditing  {
    UITextField *textField = [[UITextField alloc]init];
    textField.frame = frame ;
    textField.background = image ;
    textField.secureTextEntry =secureTextEntry;
    // textField.borderStyle = UITextBorderStyleLine;
    textField.placeholder = str;
    textField.clearsOnBeginEditing =clearsOnBeginEditing;
    return textField;
    
}
@end

