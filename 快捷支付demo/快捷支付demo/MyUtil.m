//
//  MyUtil.m
//  快捷支付demo
//
//  Created by CK GuoZi on 2017/10/13.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "MyUtil.h"

@implementation MyUtil


//创建textField

+(UITextField*)textFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder{
    UITextField*textField=[UITextField new];
    textField.placeholder=placeholder;
    textField.frame=frame;
    textField.font=[UIFont systemFontOfSize:14];
    textField.borderStyle=UITextBorderStyleRoundedRect;
    textField.clearButtonMode=UITextFieldViewModeWhileEditing;//请空按钮
    
    return textField;
}

+(UIButton*)buttonWithFrame:(CGRect)frame Title:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)ControlEvents{
    
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    button.backgroundColor=backgroundColor;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:ControlEvents];
    
    return button;
    
}

+(UILabel*)LableWithFrame:(CGRect)frame backgroundColor:(UIColor *)color text:(NSString *)str textColor:(UIColor *)textcolor font:(UIFont *)font numberOfLines:(int)numberOfLines adjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth{
    UILabel*lable = [[UILabel alloc]initWithFrame:frame];
    
    lable.backgroundColor = color;
    lable.text = str;
    lable.textColor =textcolor;
    lable.font = font;
    lable.numberOfLines = numberOfLines;
    lable.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
    return lable;

}
@end
