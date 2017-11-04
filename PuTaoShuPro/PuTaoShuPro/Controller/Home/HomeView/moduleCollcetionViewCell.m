//
//  moduleCollcetionViewCell.m
//  PuTaoShuPro
//
//  Created by CK GuoZi on 2017/11/2.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "moduleCollcetionViewCell.h"

@implementation moduleCollcetionViewCell
- (instancetype)init{
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    self.backgroundColor = [UIColor whiteColor];
    _iconView = [[UIImageView alloc] init];
    [self addSubview:_iconView];
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.font = [UIFont systemFontOfSize:12.5f];
    [self addSubview:_nameLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = CGRectGetWidth(self.frame);
    self.iconView.frame = CGRectMake(width * 0.25, width * 0.1, width * 0.5, width * 0.5);
    self.nameLabel.frame = CGRectMake(0, width * 0.6, width, width * 0.25);
    //self.badgeCenterOffset = CGPointMake(-(width * 0.3), width * 0.3);
}

@end
