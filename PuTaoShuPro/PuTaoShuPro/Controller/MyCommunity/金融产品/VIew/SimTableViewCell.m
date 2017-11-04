//
//  SimTableViewCell.m
//  PuTaoShuPro
//
//  Created by CK GuoZi on 2017/11/3.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "SimTableViewCell.h"

@implementation SimTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //        if (SCREEN_HEIHT<600) {
        //            self.photoImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 70)];
        //        }else{
        //            self.photoImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 70)];
        //        }
        
        //self.photoImg.contentMode=UIViewContentModeScaleAspectFill;
        //[self addSubview:self.photoImg];
        self.titleLab=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*0.05 , 10, SCREEN_WIDTH*0.5, 40)];
        self.titleLab.textAlignment=NSTextAlignmentLeft;
        self.titleLab.font = [UIFont systemFontOfSize:14];
        self.titleLab.numberOfLines = 0;
        self.titleLab.textColor = [UIColor blackColor];
        self.titleLab.text = @"";
        [self addSubview:self.titleLab];
        
        self.timeLab = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*0.55 , 10,SCREEN_WIDTH*0.4 , 40)];
        // self.timeLab.textAlignment=NSTextAlignmentRight;
        self.timeLab.font = [UIFont systemFontOfSize:12];
        self.timeLab.textColor = [UIColor grayColor];
        self.timeLab.text = @"";
        [self addSubview:self.timeLab];
        
        //self.badgeCenterOffset=CGPointMake(-(SCREEN_WIDTH*0.75), 25);
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
