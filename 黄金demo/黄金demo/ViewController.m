//
//  ViewController.m
//  黄金demo
//
//  Created by CK GuoZi on 2017/9/21.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "ViewController.h"
#import "filtrateVC.h"
#import "particularsVC.h"

#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface ViewController ()
{
    UIButton*tembtn;

    NSMutableArray*btnArr;
    UIPageControl* page;
    NSMutableArray*imgarr;
    CGRect temRect;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    imgarr=[NSMutableArray new];
    btnArr=[NSMutableArray new];
    temRect=CGRectZero;
    [self creatScrollview];
    [self creatTableview];

    UIButton*filtrate=[UIButton buttonWithType:UIButtonTypeCustom];
    filtrate.frame=CGRectMake(CGRectGetMaxX(_Scrview.frame), 20, 40, 40);
    filtrate.backgroundColor=[UIColor redColor];
    [filtrate setTitle:@"筛选" forState:UIControlStateNormal];
    [filtrate addTarget:self action:@selector(Change) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:filtrate];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noti:) name:@"Noti" object:nil];
}
#pragma mark ============= 接收通知 =============
-(void)noti:(NSNotification*)noti{
    //使用userInfo处理消息
    
    NSDictionary  *dic = [noti userInfo];
    int i;
    i=[[dic objectForKey:@"index"] intValue];
    UIButton*btn=btnArr[i];
    [tembtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0.95f green:0.56f blue:0.11f alpha:1.00f] forState:UIControlStateNormal];

  
    [_Scrview2 setContentOffset:CGPointMake(SCREEN_WIDTH*i, 0) animated:YES];
    NSLog(@"接收 userInfo传递的消息：%d",i);
}
-(void)Change{
    filtrateVC*filtrate=[[filtrateVC alloc]init];
    [self presentViewController:filtrate animated:YES completion:nil];
}
-(void)creatScrollview{
    
    _Scrview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, (SCREEN_WIDTH-40), 40)];
    [self.view addSubview:_Scrview];
    _Scrview.backgroundColor=[UIColor groupTableViewBackgroundColor];
    _Scrview.delegate=self;
    _Scrview.contentSize=CGSizeMake(SCREEN_WIDTH*2, 2);
    _Scrview.showsHorizontalScrollIndicator=NO;
    _Scrview.showsVerticalScrollIndicator=NO;
    
    NSArray*arr=@[@"全部",@"金(银)条",@"金(银)币",@"金(银)钱",@"金(银)金银章",@"金(银)套装",@"金(银)摆件"];
    for (int i=0;i<arr.count;i++) {
        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(i*(SCREEN_WIDTH-40)/4, 0, (SCREEN_WIDTH-40)/4, 40)];
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

          [_Scrview addSubview:btn];
    }

    
    
    _Scrview1=[[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(temRect)-2, (SCREEN_WIDTH-40)/4, 2)];
    [_Scrview addSubview:_Scrview1];
    _Scrview1.backgroundColor=[UIColor colorWithRed:0.95f green:0.56f blue:0.11f alpha:1.00f];
    _Scrview1.delegate=self;
    _Scrview1.contentSize=CGSizeMake(SCREEN_WIDTH*2, 2);
    _Scrview1.showsHorizontalScrollIndicator=NO;
    _Scrview1.showsVerticalScrollIndicator=NO;
    
    _Scrview2=[[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_Scrview.frame),SCREEN_WIDTH , SCREEN_HEIGHT-CGRectGetMaxY(_Scrview.frame))];
    [self.view addSubview:_Scrview2];
    _Scrview2.delegate=self;
    _Scrview2.pagingEnabled=YES;
    [_Scrview2 addSubview:page];
    _Scrview2.showsHorizontalScrollIndicator=NO;
    _Scrview2.showsVerticalScrollIndicator=NO;
    _Scrview2.contentSize=CGSizeMake(SCREEN_WIDTH*arr.count,SCREEN_HEIGHT/2);

}

//#pragma mark--实时监听滚动
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    if (scrollView==_Scrview2) {
//        //_Scrview1.contentOffset=CGPointMake((_Scrview2.contentOffset.x-40)/4, 0);
//        int i=_Scrview2.contentOffset.x/SCREEN_WIDTH;
//        _Scrview1.frame=CGRectMake((_Scrview2.contentOffset.x-40*i)/4, CGRectGetMaxY(temRect)-2, (SCREEN_WIDTH-40)/4, 2);
//
//    }
//}
//#pragma mark--停止滚动
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    if (scrollView==_Scrview2) {
//        int i=_Scrview2.contentOffset.x/SCREEN_WIDTH;
//        UIButton*btn=btnArr[i];
//        [tembtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor colorWithRed:0.95f green:0.56f blue:0.11f alpha:1.00f] forState:UIControlStateNormal];
//        tembtn=btn;
//
//    }
//}
#pragma mark--文字点击事件
-(void)btn_clicked:(UIButton*)btn
{
    [tembtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0.95f green:0.56f blue:0.11f alpha:1.00f] forState:UIControlStateNormal];
    
    //tembtn=btn;
     //[_Scrview2 setContentOffset:CGPointMake(SCREEN_WIDTH*btn.tag, 0) animated:YES];
    
    
}
-(void)creatTableview{
    _tableview1=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetHeight(_Scrview2.frame)) style:UITableViewStylePlain];
    _tableview1.delegate=self;
    _tableview1.dataSource=self;
    
    _tableview2=[[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, CGRectGetHeight(_Scrview2.frame)) style:UITableViewStylePlain];
    _tableview2.delegate=self;
    _tableview2.dataSource=self;
    
    _tableview3=[[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, CGRectGetHeight(_Scrview2.frame)) style:UITableViewStylePlain];
    _tableview3.delegate=self;
    _tableview3.dataSource=self;
    
    
    [self.Scrview2 addSubview:_tableview1];
    [self.Scrview2 addSubview:_tableview2];
    [self.Scrview2 addSubview:_tableview3];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*key1=@"cell1";
    static NSString*key2=@"cell2";
    static NSString*key3=@"cell3";
    
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
    
    if (tableView==_tableview3) {
        
        cell=[_tableview3 dequeueReusableCellWithIdentifier:key3];
        if (cell==nil) {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:key3];
        }
        
        cell.textLabel.text=[NSString stringWithFormat:@"第三个table:数据%li",(long)indexPath.row];
    }
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    particularsVC*parVC=[[particularsVC alloc]init];
    [self presentViewController:parVC animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
