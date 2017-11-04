//
//  HomeViewController.h
//  PuTaoShuPro
//
//  Created by CK GuoZi on 2017/11/1.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "BaseViewController.h"
//#import "AdvertisingColumn.h"

@interface HomeViewController : BaseViewController<UIScrollViewDelegate,UIAlertViewDelegate>{
    UIImageView *topImgView;
    //    EMConnectionState _connectionState;
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    UITableView *tableview;
    NSMutableArray *arryTalbe;
    UIAlertView *activityAlert;//活动提示框
    UIAlertView *addCommunityAlert;//添加社区提示框
    UIAlertView *verifyNameAlert;//实名认证提示框
    UIAlertView *noCommunityAlert;
    
    UIAlertView *youkeyAlert;
    
    UITapGestureRecognizer *tapGesture;
}
@property (nonatomic,strong)NSString *popTitle;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;
//@property (nonatomic,strong)AdvertisingColumn *topImgView;


@property(nonatomic,strong)NSDictionary*dic;
-(void)initView;
@end
