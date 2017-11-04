//
//  SZDoorViewController.m
//  PuTaoShuPro
//
//  Created by CK GuoZi on 2017/11/3.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "SZDoorViewController.h"

@interface SZDoorViewController ()<UIScrollViewDelegate,UIAlertViewDelegate>{
    UIView*backView;
    
    
    
    
    NSMutableArray*submitKeyArray;
    
    
    UIScrollView*scroll;
    
    
    NSString*adminID;//管理员id
    NSString*address_fID;
    NSString*address_sID;
    
    NSString*code;
    NSDictionary*CurrentKeyDic;//获取到的当前的钥匙
    
    BOOL   isConnect;
    NSInteger  index;
    BOOL  isOpenDoor;
    NSString*wuyePhone;
    
}
@property(nonatomic,strong)UIPageControl*page;
@property(nonatomic,strong)NSMutableArray*LocationkeyArray;

@property(nonatomic,strong)NSMutableArray*keyNameArray;
@property(nonatomic,strong)NSMutableArray*radioArr;//扫描到的广播的数组
@property NSTimer        *timer;
@property NSTimer        *unlockTimer;
@end

@implementation SZDoorViewController
-(NSMutableArray*)radioArr{
    
    
    if (!_radioArr) {
        
        _radioArr=[[NSMutableArray  alloc]init];
    }
    return _radioArr;
    
}
-(NSMutableArray*)keyNameArray{
    if (!_keyNameArray) {
        
        _keyNameArray=[[NSMutableArray  alloc]init];
    }
    return _keyNameArray;
    
}
-(NSMutableArray*)LocationkeyArray{
    if (!_LocationkeyArray) {
        _LocationkeyArray=[[NSMutableArray  alloc]init];
    }
    return _LocationkeyArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=self.titleString;
    self.view.backgroundColor=[UIColor  whiteColor];
    
    UIBarButtonItem*right=[[UIBarButtonItem  alloc]initWithTitle:@"申请" style:UIBarButtonItemStylePlain target:self action:@selector(applyOwnerKey)];
    self.navigationItem.rightBarButtonItem=right;
    
     [super viewDidLoad];
    [self  initView];
    
    shakeView=[[UIImageView  alloc]init];

    shakeView.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIHT);
    
    shakeView.image=[UIImage  imageNamed:@"backview"];
    
    [self.view  addSubview:shakeView];
    
    shakeView.hidden=YES;
    
    [self initShakeView];
    
    scroll=[[UIScrollView  alloc]init];
    
    self.page=[[UIPageControl  alloc]init];
}

-(void)initShakeView{
    self.imgUp=[[UIImageView  alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3, SCREEN_HEIHT/3, SCREEN_WIDTH/3, SCREEN_HEIHT/6)];
    self.imgUp.image=[UIImage  imageNamed:@"shake_1"];
    [shakeView  addSubview:self.imgUp];
    self.imgDown=[[UIImageView  alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3, SCREEN_HEIHT/2, SCREEN_WIDTH/3, SCREEN_HEIHT/6)];
    
    self.imgDown.image=[UIImage  imageNamed:@"shake_2"];
    [shakeView  addSubview:self.imgDown];
}
#pragma mark---写入新的动态码页面-----

-(void)temporaryKeys{
//    TemporaryKeysController*tamvc=[[TemporaryKeysController  alloc]init];
//    // tamvc.keyArray=keyArr;
//    [self.navigationController  pushViewController:tamvc animated:YES];
}
#pragma mark ============= 加载视图 =============
-(void)initView {
    //背景图
    UIImageView*backImageView=[[UIImageView  alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIHT)];
    backImageView.image=[UIImage  imageNamed:@"menjinbeijing"];
    backImageView.userInteractionEnabled=YES;
    [self.view  addSubview:backImageView];
    //透明的背景view
    backView=[[UIView  alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIHT)];
    backView.backgroundColor=[UIColor  blackColor];
    backView.alpha=0.4;
    [backImageView  addSubview:backView];
    CGFloat  widh=SCREEN_WIDTH/6;
    
    UIButton*shakeButton=[[UIButton  alloc]initWithFrame:CGRectMake(widh, 20, widh, widh)];
    [shakeButton  setBackgroundImage:[UIImage  imageNamed:@"xiazai"] forState:0];
    [shakeButton  addTarget:self action:@selector(temporaryKeys) forControlEvents:UIControlEventTouchUpInside];
    [shakeButton  setTitleColor:[UIColor  whiteColor] forState:0];
    [backView  addSubview:shakeButton];
    UILabel*shakeL=[[UILabel  alloc]initWithFrame:CGRectMake(widh-20, 20+widh, 100, widh)];
    shakeL.text=@"写入临时钥匙";
    shakeL.textColor=[UIColor  whiteColor];
    shakeL.font=[UIFont  systemFontOfSize:15];
    [backView  addSubview:shakeL];
    
    
    
    UIButton*keyButton=[[UIButton  alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-widh*2, 20, widh, widh)];
    [keyButton  setBackgroundImage:[UIImage  imageNamed:@"key"] forState:0];
    [keyButton  setTitleColor:[UIColor  whiteColor] forState:0];
    [keyButton  addTarget:self action:@selector(applyVisitorKeys) forControlEvents:UIControlEventTouchUpInside];
    [backView  addSubview:keyButton];
    
    UILabel*keyL=[[UILabel  alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-widh*2, 20+widh, 80, widh)];
    
    keyL.text=@"临时钥匙";
    
    keyL.textColor=[UIColor  whiteColor];
    
    keyL.font=[UIFont  systemFontOfSize:15];
    
    [backView  addSubview:keyL];
    
    
    UIButton*openDoorBtn=[[UIButton  alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-50,SCREEN_HEIHT/2-50, 100, 100)];
    [openDoorBtn  setBackgroundImage:[UIImage  imageNamed:@"open"] forState:0];
    [openDoorBtn  addTarget:self action:@selector(shakeOpenDoor) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:openDoorBtn];
    UILabel*openDoorL=[[UILabel  alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIHT/2+70, 100, 30)];
    openDoorL.text=@"点击开门";
    openDoorL.textColor=COLOR_NAVIVIEW;
    openDoorL.textAlignment=NSTextAlignmentCenter;
    openDoorL.font=[UIFont  systemFontOfSize:15];
    [self.view  addSubview:openDoorL];
    
    
    UIButton*questionBtn=[[UIButton  alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-70,SCREEN_HEIHT-SafeAreaTopHeight-SafeAreaTabbarHeight, 140, 30)];
    questionBtn.titleLabel.font=[UIFont  systemFontOfSize:14];
    [questionBtn  setTitle:@"遇到了问题？点我" forState:0];
    [questionBtn  setTitleColor:COLOR_NAVIVIEW forState:0];
    [questionBtn  addTarget:self action:@selector(question) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:questionBtn];
    
}
#pragma mark---问题解决提示----
-(void)question{
    
}
#pragma mark ============= 点击开门处理事件开门1 =============
-(void)shakeOpenDoor{
    
}
-(void)applyOwnerKey{//申请
    
}
-(void)applyVisitorKeys{//
    
}
//-(void)alertWithMessage:(NSString*)message{
//
//    UIAlertView*alert=[[UIAlertView  alloc]initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
//    [alert  show];
//}
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
