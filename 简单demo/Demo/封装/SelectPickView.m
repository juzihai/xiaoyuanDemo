//
//  SelectPickView.m
//  GodOfWealth
//
//  Created by 赵惊奇 on 2017/6/27.
//  Copyright © 2017年 guozikeji. All rights reserved.
//

#import "SelectPickView.h"

@implementation SelectPickView

-(instancetype)initWithFrame:(CGRect)frame{
    
    
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=COLOR_backHui;
        
        [self  initView];
    }
    return self;
    
}

-(void)initView{
    
    self.cancerBtn=[UIButton new];
    [self  addSubview:self.cancerBtn];
    self.pickTitleL=[UILabel new];
    [self  addSubview:self.pickTitleL];
    self.sureCity=[UIButton new];
    [self  addSubview:self.sureCity];
    
    self.cancerBtn.frame=CGRectMake(20, 0, 60, 40);
    [ self.cancerBtn  setTitle:@"取消" forState:0];
    [ self.cancerBtn  setTitleColor:COLOR_textHui forState:0];
    
    self.pickTitleL.frame=CGRectMake(CGRectGetMaxX(self.cancerBtn.frame), 0, SCREEN_WIDTH-160, 40);
    self.pickTitleL.font=[UIFont  systemFontOfSize:15];
    self.pickTitleL.textAlignment=NSTextAlignmentCenter;
    
    self.sureCity.frame=CGRectMake(SCREEN_WIDTH-80, 0, 60, 40);
    [self.sureCity  setTitle:@"确定" forState:0];
    [self.sureCity setTitleColor:COLOR_HONG forState:0];
    
    self.selectPick=[[UIPickerView  alloc]init];
    self.selectPick.frame=CGRectMake(0, 40, SCREEN_WIDTH, CGRectGetHeight(self.frame)-40);
    self.selectPick.backgroundColor=[UIColor  whiteColor];
    [self  addSubview:self.selectPick];
   

    
    
}
-(void)setTag:(NSInteger)tag{
    
  self.sureCity.tag=tag;
 self.cancerBtn.tag=tag;
    
}
- (void)setPickTitle:(NSString *)pickTitle{
    self.pickTitleL.text=pickTitle;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
