//
//  HomeViewController.m
//  PuTaoShuPro
//
//  Created by CK GuoZi on 2017/11/1.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "HomeViewController.h"
#import "moduleCollcetionViewCell.h"
#import "SZDoorViewController.h"
#import "SeparatorView.h"

#import "FinancialProductsVc.h"
static NSString *identifier = @"moduleCollcetionViewCell";

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    
    BOOL guestState;
    CGFloat scrollH;
    BOOL isPush;
    
    BOOL ispushShop;
    UIImageView *toutiaoView;
    UIButton *switchBtn;
    NSDictionary*tzDic;
    NSString*url;//活动url
    
    
    UIView*titleView;
    
    UILabel  *titleLabel;
    
    UIButton*leftButton;
    
    UIButton*rightButton;
    /*
     广告图片数组
     */
    NSMutableArray*ADImage;
    
    /*
     广告链接数组
     */
    NSMutableArray*ADLianjie;
    
    
    /*
     本地存储code
     */
    NSArray*mbmd_codeArray;
    
    NSString *element;
    
    BOOL  istouch;
}

//@property (nonatomic, retain) CLLocationManager* locationMgr;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *titleArr;

//@property (nonatomic,strong) ToutiaoScrollView *toutiaoSCrollView;

@property (nonatomic,strong) NSMutableDictionary *titileDictM;

//@property(nonatomic,strong)homeModel*model;

@property(nonatomic,strong)NSMutableArray*nameArray;
@property (nonatomic, strong) NSMutableDictionary *cellDic;
@property (weak, nonatomic)UIImageView *backImageView;
@end

@implementation HomeViewController
-(UIImageView*)backImageView{
    if (!_backImageView) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        
        [self.view addSubview:imageView];
        
        //_backImageView = imageView;
    }
    return _backImageView;
}
-(NSMutableArray*)nameArray{
    
    if (!_nameArray) {
        
        _nameArray=[[NSMutableArray alloc]init];
    }
    
    return _nameArray;
    
}
- (NSMutableDictionary *)titileDictM{
    if (!_titileDictM) {
        _titileDictM = [NSMutableDictionary dictionary];
    }
    return _titileDictM;
    
}

- (NSArray *)titleArr{
    if (!_titleArr) {
        _titleArr = @[@"社区公告",@"活动专区",@"社区客服",@"社区点赞",@"社区分享",@"意见反馈",@"我的报修",@"社区投票",@"我的账单",@"购物车",@"社区商超",@"社区特色",@"社区门禁",@"业主求助",@"员工评比",@"金融服务",@"社区缴费",@"金融产品"];
    }
    return _titleArr;
}



- (void)viewDidLoad {
    [super viewDidLoad];
   
    
//    NSLog(@"%d",Statusbar_Height+Navigationbar_Height);
//    NSLog(@"%f",SCREEN_HEIHT);
//    // 状态栏(statusbar)
//    NSLog(@"status height - %f", Statusbar_Height);  // 高度
//    // 导航栏（navigationbar）
//    NSLog(@"nav height - %f", Navigationbar_Height);  // 高度
    


    self.title=@"我的社区";
    //NSLog(@"%@",NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
    
    titleView=[[UIView  alloc]init];
    //titleView.backgroundColor=[UIColor  redColor];
    titleView.frame=CGRectMake(0, 0, SCREEN_HEIHT, 44);
    [self.navigationController.navigationBar  addSubview:titleView];
    
    titleLabel=[[UILabel  alloc]init];
    titleLabel.frame=CGRectMake(80, 0, SCREEN_WIDTH-160, 44) ;
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.font=[UIFont  boldSystemFontOfSize:21];
    titleLabel.textColor=[UIColor  whiteColor];
    [titleView  addSubview:titleLabel];
    
    UIButton*add = [UIButton buttonWithType:UIButtonTypeCustom];
    add.frame = CGRectMake(10, 10, 70, 24);
    //add.badgeCenterOffset = CGPointMake(-10, 5);
    [add setBackgroundImage:[UIImage imageNamed:@"t_j"] forState:UIControlStateNormal];
    [add addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [titleView  addSubview:add];
    
    switchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    switchBtn.frame = CGRectMake(SCREEN_WIDTH-80, 10, 70, 24);
    //switchBtn.badgeCenterOffset = CGPointMake(-10, 5);
    [switchBtn setBackgroundImage:[UIImage imageNamed:@"q_h"] forState:UIControlStateNormal];
    [switchBtn addTarget:self action:@selector(switchBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [titleView  addSubview:switchBtn];
    
    [self initScrollerView];//将相面所有控件都加入scrollerview中
    [self initCollectionViewAndAutoScrollView];
      NSLog(@"==%@==",scrollView);
    
}
- (void)initScrollerView{
    scrollView = [[UIScrollView alloc ] initWithFrame:CGRectMake(0, NAVHEIGHT, SCREEN_WIDTH, SCREEN_HEIHT-NAVHEIGHT-SafeAreaTopHeight-SafeAreaTabbarHeight) ];
    scrollView.backgroundColor = RGBACOLOR(240, 240, 240, 1);
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIHT - NAVHEIGHT - SafeAreaTabbarHeight);
    scrollView.delegate=self;
    scrollView.showsVerticalScrollIndicator=NO;
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.indicatorStyle=UIScrollViewIndicatorStyleBlack;
   
    
}
#pragma mark ============= UIcollectionView初始化 =============
- (void)initCollectionViewAndAutoScrollView{
    
    scrollH =60;
    toutiaoView = [[UIImageView alloc] init];
    toutiaoView.image = [UIImage imageNamed:@"toutiao"];
    //toutiaoView.badgeCenterOffset = CGPointMake(-15, 12);
    toutiaoView.frame = CGRectMake(0,  100 + 5, 85, scrollH);
    [scrollView addSubview:toutiaoView];
    
    CGFloat margin = 0.0f;
    CGFloat width = (SCREEN_WIDTH - margin * 5 ) * 0.25;
    CGFloat height = width;
    
    //SCREEN_HEIHT - CGRectGetMaxY(self.topImgView.frame) - height * 3 -  margin * 2 - 5 - TABBAR_HEIGHT - 64;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = 0.0f;
    flowLayout.minimumLineSpacing = 0.0f;
    flowLayout.itemSize = CGSizeMake(width, height);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(toutiaoView.frame) + 5, SCREEN_WIDTH, height * 5) collectionViewLayout:flowLayout];
    self.collectionView.scrollEnabled = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[moduleCollcetionViewCell class] forCellWithReuseIdentifier:identifier];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [scrollView addSubview:self.collectionView];
    
    scrollView.contentSize=CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(self.collectionView.frame));
    
//    for (int i = 1; i < 4; i++) {
//        SeparatorView *separatorView = [[SeparatorView alloc] init];
//        separatorView.frame = CGRectMake(width * i, 0, 0.5, _collectionView.height);
//        [self.collectionView addSubview:separatorView];
//    }
//
//    for (int i = 1; i < 3; i++) {
//        SeparatorView *separatorView = [[SeparatorView alloc] init];
//        separatorView.frame = CGRectMake(0, height * i, SCREEN_WIDTH, 0.5);
//        [self.collectionView addSubview:separatorView];
//    }
    
    
    //[toutiaoView showBadge];
    //[self buju];
}
-(void)buju{
    CGFloat margin = 0.0f;
    CGFloat height = (SCREEN_WIDTH - margin * 5 ) * 0.25;
    
    
    NSInteger  number;
    
    number=self.nameArray.count;
    if (number<=12) {
        
        self.collectionView .frame=CGRectMake(0, CGRectGetMaxY(toutiaoView.frame) + 5 + scrollH, SCREEN_WIDTH, height * 3 + margin * 2) ;
        for (int i = 1; i < 3; i++) {
            SeparatorView *separatorView = [[SeparatorView alloc] init];
            separatorView.frame = CGRectMake(0, height * i, SCREEN_WIDTH, 0.5);
            [self.collectionView addSubview:separatorView];
            
        }
        
        scrollView.contentSize=CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(self.collectionView.frame));
        
    }else{
        
        NSInteger  shumu;
        shumu=number%4;
        
        if (number%4==0) {
            shumu=number/4;
            
        }else{
            
            shumu=(number/4)+1;
            
        }
        
        self.collectionView .frame=CGRectMake(0, CGRectGetMaxY(toutiaoView.frame) + 5 + scrollH, SCREEN_WIDTH, height * shumu + margin * 2) ;
        
        for (int i = 1; i < shumu; i++) {
            SeparatorView *separatorView = [[SeparatorView alloc] init];
            separatorView.frame = CGRectMake(0, height * i, SCREEN_WIDTH, 0.5);
            [self.collectionView addSubview:separatorView];
            
            
        }
        
        CGFloat width = (SCREEN_WIDTH - margin * 5 ) * 0.25;
        for (int i = 1; i < 4; i++) {
            SeparatorView *separatorView = [[SeparatorView alloc] init];
            separatorView.frame = CGRectMake(width * i, 0, 0.5, 500);
            [self.collectionView addSubview:separatorView];
        }
        
        scrollView.contentSize=CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(self.collectionView.frame));
        
    }
}


-(void)initView{
    int topHeight=0;
    if (iPhone4) {
        
        topHeight=SCREEN_WIDTH * 0.3;
        
    }else{
        topHeight=SCREEN_WIDTH * 0.5;
        
    }
    //    topImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topHeight)];
    //    topImgView.contentMode=UIViewContentModeScaleToFill;
    //    topImgView.image=[UIImage imageNamed:@"guanggaowei"];
    //    [scrollView addSubview:topImgView];
    
    CGFloat width = SCREEN_WIDTH * 0.25;
    CGFloat heig = SCREEN_HEIHT -width*3 -5 - TABBAR_HEIGHT - 64-60;
    
    NSLog(@"%d   %f",topHeight,heig);
    
//    self.topImgView = [[AdvertisingColumn alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, heig)];
//    self.topImgView.backgroundColor = [UIColor blackColor];
//
//
//    [scrollView addSubview:self.topImgView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (self.nameArray.count==0) {
        
        return  self.titleArr.count;
        
    }else{
        
        return self.nameArray.count;
        
    }
    
    
    //return  self.titleArr.count;
    
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // 每次先从字典中根据IndexPath取出唯一标识符
    NSString *identifier = [_cellDic objectForKey:[NSString stringWithFormat:@"%@", indexPath]];
    // 如果取出的唯一标示符不存在，则初始化唯一标示符，并将其存入字典中，对应唯一标示符注册Cell
    if (identifier == nil) {
        identifier = [NSString stringWithFormat:@"%@",  [NSString stringWithFormat:@"%@", indexPath]];
        [_cellDic setValue:identifier forKey:[NSString stringWithFormat:@"%@", indexPath]];
        // 注册Cell
        [self.collectionView registerClass:[moduleCollcetionViewCell class]  forCellWithReuseIdentifier:identifier];
    }
    moduleCollcetionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.nameLabel.text = self.titleArr[indexPath.row];
    cell.iconView.image = [UIImage imageNamed:[NSString stringWithFormat:@"main_%ld",indexPath.row + 1]];
    
    return cell;
}
#pragma mark ============= 视图功能块点击事件 =============
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    isPush=YES;
    
    NSString*title=_titleArr[indexPath.row];
    if ([title isEqualToString:@"社区公告"]) {
        FinancialProductsVc*fvc=[[FinancialProductsVc alloc]init];
        
        [self.navigationController pushViewController:fvc animated:YES];
    }else if ([title isEqualToString:@"活动专区"]){
        SZDoorViewController*szdoor=[[SZDoorViewController alloc]init];
        szdoor.titleString=@"门禁";
        [self.navigationController pushViewController:szdoor animated:YES];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    titleView.hidden=NO;
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[self rdv_tabBarController]setTabBarHidden:NO];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    if (isPush||ispushShop) {
        [[self rdv_tabBarController] setTabBarHidden:YES];
        isPush = NO;
    }
    titleView.hidden=YES;
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated{
    
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
