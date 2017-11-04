
//
//  SeparatorView.m
//  PuTaoShuPro
//
//  Created by CK GuoZi on 2017/11/4.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "SeparatorView.h"

@implementation SeparatorView

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
    if (self= [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    self.backgroundColor = RGBACOLOR(230, 230, 230, 1);
    
}
@end
