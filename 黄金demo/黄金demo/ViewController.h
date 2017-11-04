//
//  ViewController.h
//  黄金demo
//
//  Created by CK GuoZi on 2017/9/21.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,strong)UIScrollView*Scrview;
@property(nonatomic,strong)UIScrollView*Scrview1;
@property(nonatomic,strong)UIScrollView*Scrview2;
@property(nonatomic,strong)UITableView*tableview1;
@property(nonatomic,strong)UITableView*tableview2;
@property(nonatomic,strong)UITableView*tableview3;
@end

