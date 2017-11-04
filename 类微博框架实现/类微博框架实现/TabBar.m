
//
//  TabBar.m
//  类微博框架实现
//
//  Created by CK GuoZi on 2017/9/21.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "TabBar.h"

@interface TabBar ()
@property (nonatomic, strong) UIButton *composeButton;

@end

@implementation TabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger tabBarButtonWidth = [UIScreen mainScreen].bounds.size.width * 0.2;
    NSInteger index = 0;
    
    for (UIView *value in self.subviews) {
        if ([value isKindOfClass:[NSClassFromString(@"UITabBarButton") class]]) {
            
            CGRect tabBarButtonFrame = value.frame;
            
            tabBarButtonFrame.origin.x = tabBarButtonWidth * index;
            tabBarButtonFrame.size.width = tabBarButtonWidth;
            value.frame = tabBarButtonFrame;
            index++;
            if (index == 2) {
                index++;
            }
            
        }
    }
    
    CGPoint composeButtonCenter = self.composeButton.center;
    composeButtonCenter.x = [UIScreen mainScreen].bounds.size.width * 0.5;
    composeButtonCenter.y = self.bounds.size.height * 0.5;
    self.composeButton.center = composeButtonCenter;
    
}


#pragma mark - Object Base Function

- (void)setupUI
{
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateSelected];
    [button addTarget:self action: @selector(composeButtonDidCompose) forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    self.composeButton = button;
    [self addSubview:self.composeButton];
}

- (void)composeButtonDidCompose
{
    NSLog(@"compose Button did clicked");
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
