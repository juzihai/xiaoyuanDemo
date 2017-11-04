//
//  particularsVC.m
//  黄金demo
//
//  Created by CK GuoZi on 2017/9/22.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "particularsVC.h"

@interface particularsVC ()
{
    UIButton*tembtn;
    
    NSMutableArray*btnArr;
    UIPageControl* page;
    NSMutableArray*imgarr;
    CGRect temRect;
    
}
@property(nonatomic,strong)UIView*HView;
@property(nonatomic,strong)UIView*FView;
#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@end

@implementation particularsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    imgarr=[NSMutableArray new];
    btnArr=[NSMutableArray new];
    temRect=CGRectZero;
    [self creatScrollview];
    [self creatTableview];
}
-(void)creatScrollview{
    
//    _Scrview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, (SCREEN_WIDTH-40), 40)];
//    [self.view addSubview:_Scrview];
//    _Scrview.backgroundColor=[UIColor groupTableViewBackgroundColor];
//    _Scrview.delegate=self;
//    _Scrview.contentSize=CGSizeMake(SCREEN_WIDTH*2, 2);
//    _Scrview.showsHorizontalScrollIndicator=NO;
//    _Scrview.showsVerticalScrollIndicator=NO;
    
    NSArray*arr=@[@"参数规格",@"商品图片"];
    for (int i=0;i<arr.count;i++) {
        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/8+SCREEN_WIDTH/2*i, 0, SCREEN_WIDTH/4, 40)];
        btn.tag=i;
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont systemFontOfSize:14];
        [btnArr addObject:btn];
        if (i==0) {
            [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            tembtn=btn;
            temRect=btn.frame;
            
            
        }
        else
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btn_clicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:btn];
    }
    
    
    
    _Scrview1=[[UIScrollView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/8, CGRectGetMaxY(temRect), SCREEN_WIDTH/4, 2)];
    [self.view  addSubview:_Scrview1];
    _Scrview1.backgroundColor=[UIColor colorWithRed:0.95f green:0.56f blue:0.11f alpha:1.00f];
    _Scrview1.delegate=self;
    _Scrview1.contentSize=CGSizeMake(SCREEN_WIDTH*2, 2);
    _Scrview1.showsHorizontalScrollIndicator=NO;
    _Scrview1.showsVerticalScrollIndicator=NO;
    
    _Scrview2=[[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_Scrview1.frame),SCREEN_WIDTH , SCREEN_HEIGHT-CGRectGetMaxY(_Scrview.frame))];
    [self.view addSubview:_Scrview2];
    _Scrview2.delegate=self;
    _Scrview2.pagingEnabled=YES;
    [_Scrview2 addSubview:page];
    _Scrview2.showsHorizontalScrollIndicator=NO;
    _Scrview2.showsVerticalScrollIndicator=NO;
    _Scrview2.contentSize=CGSizeMake(SCREEN_WIDTH*arr.count,SCREEN_HEIGHT/2);
    
}
#pragma mark--实时监听滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView==_Scrview2) {
        _Scrview1.contentOffset=CGPointMake(_Scrview2.contentOffset.x/2, 0);
        
        _Scrview1.frame=CGRectMake(SCREEN_WIDTH/8+_Scrview2.contentOffset.x/2 , CGRectGetMaxY(temRect)-2, SCREEN_WIDTH/4, 2);
        
    }
}
#pragma mark--停止滚动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView==_Scrview2) {
        int i=_Scrview2.contentOffset.x/SCREEN_WIDTH;
        UIButton*btn=btnArr[i];
        [tembtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:0.95f green:0.56f blue:0.11f alpha:1.00f] forState:UIControlStateNormal];
        tembtn=btn;
        
    }
}
#pragma mark--文字点击事件
-(void)btn_clicked:(UIButton*)btn
{
    [tembtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0.95f green:0.56f blue:0.11f alpha:1.00f] forState:UIControlStateNormal];
    
    tembtn=btn;
    [_Scrview2 setContentOffset:CGPointMake(SCREEN_WIDTH*btn.tag, 0) animated:YES];
    
    
}
-(void)creatTableview{
    _tableview1=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetHeight(_Scrview2.frame)) style:UITableViewStylePlain];
    _tableview1.delegate=self;
    _tableview1.dataSource=self;
    _tableview1.tableFooterView=self.FView;
    
    _tableview2=[[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, CGRectGetHeight(_Scrview2.frame)) style:UITableViewStylePlain];
    _tableview2.delegate=self;
    _tableview2.dataSource=self;
    

    
    
    [self.Scrview2 addSubview:_tableview1];
    [self.Scrview2 addSubview:_tableview2];

    
}
-(UIView*)FView{
    _FView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/3)];
    _FView.backgroundColor=[UIColor groupTableViewBackgroundColor];

    UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(200, 0, 100, 40);
    btn.backgroundColor=[UIColor redColor];
    [btn setTitle:@"立即购买" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(Change) forControlEvents:UIControlEventTouchUpInside];
    [_FView addSubview:btn];
    
    UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(btn.frame), SCREEN_WIDTH, _FView.frame.size.height-40)];
    label.text=@"1.购买价格请以下单页为准。";
    [_FView addSubview:label];
    
    return _FView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*key1=@"cell1";
    static NSString*key2=@"cell2";

    
    UITableViewCell*cell;
    if (tableView==_tableview1) {
        
        cell=[_tableview1 dequeueReusableCellWithIdentifier:key1];
        if (cell==nil) {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:key1];
        }
        
        cell.textLabel.text=[NSString stringWithFormat:@"第一个table:数据%li",(long)indexPath.row];
    }
    
    if (tableView==_tableview2) {
        
        cell=[_tableview2 dequeueReusableCellWithIdentifier:key2];
        if (cell==nil) {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:key2];
        }
        
        cell.textLabel.text=[NSString stringWithFormat:@"第二个table:数据%li",(long)indexPath.row];
    }
    

    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(void)Change{
    
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
