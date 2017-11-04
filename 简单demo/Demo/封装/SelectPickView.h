//
//  SelectPickView.h
//  GodOfWealth
//
//  Created by 赵惊奇 on 2017/6/27.
//  Copyright © 2017年 guozikeji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectPickView : UIView


@property(nonatomic,strong)UIPickerView*selectPick;

@property(nonatomic,strong)UILabel*pickTitleL;

@property(nonatomic,strong)UIButton*cancerBtn;

@property(nonatomic,strong)UIButton*sureCity;


@property(nonatomic,strong)NSString*pickTitle;

@property(nonatomic,assign)NSInteger  tag;

 
@end
