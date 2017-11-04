//
//  FinancialProductsVc.m
//  PuTaoShuPro
//
//  Created by CK GuoZi on 2017/11/2.
//  Copyright © 2017年 CK GuoZi. All rights reserved.
//

#import "FinancialProductsVc.h"
#import "SimTableViewCell.h"
#import "SimModel.h"
@interface FinancialProductsVc ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableDictionary *cellDic;
@property(nonatomic,strong)UITableView*mainTableView;
//@property(nonatomic,strong)NSMutableArray*dataArr;
@property(nonatomic,strong)NSArray*dataArr;
@end

@implementation FinancialProductsVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor  whiteColor];
    self.title=@"金融产品";
    self.dataArr = [[NSMutableArray alloc] init];
    [self CreatUI];//tab页面
    [self getDataSource];
}
-(void)getDataSource{
    _dataArr=@[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
}
-(void)CreatUI
{
    
    
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVHEIGHT, SCREEN_WIDTH, SCREEN_HEIHT-NAVHEIGHT-64) style:UITableViewStylePlain];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:self.mainTableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ // 每次先从字典中根据IndexPath取出唯一标识符
    //NSString *huodeCell=[_cellDic objectForKey:[NSString stringWithFormat:@"%@", indexPath]];
    NSString *huodeCell= [NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row];
    // 通过不同标识创建cell实例
    SimTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:huodeCell];
    if(!cell){
        cell=[[SimTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:huodeCell];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    if (self.dataArr.count>0) {
        
        //SimModel *aToutiao = [_dataArr objectAtIndex:indexPath.row];
        cell.titleLab.text=_dataArr[indexPath.row];
        cell.timeLab.text=_dataArr[indexPath.row];
      
        
        
        }
        
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    SimModel*Sim=[_dataArr objectAtIndex:indexPath.row];
//    NSDictionary*NSDic=@{
//                         @"id":Sim.SimId,
//                         };
//    [Other returnDic:NSDic Method:@"bankNotice.asmx/getInfo" Block:^(NSDictionary *dic, NSError *error) {
//        NSLog(@"金融产品url==%@==",dic);
//        if (!error) {
//
//            if ([[NSFileManager defaultManager] fileExistsAtPath:FinancialProductsVcPath]) {
//                FMDatabase*db=[FMDatabase databaseWithPath:FinancialProductsVcPath];
//                if ([db open]) {
//                    [db executeUpdateWithFormat:@"delete from FinancialProductsNoti where  typeid=%@",Sim.SimId];
//                }
//                [db close];
//            }
//            [self.mainTableView reloadData];
//            NSString*state=dic[@"state"];
//            if ([state isEqualToString:@"0"]) {
//                CangWebController *web = [[CangWebController alloc] init];
//                web.string =dic[@"messageJson"];
//                web.titleText = @"详情";
//                [self.navigationController pushViewController:web animated:YES];
//            }
//        }
//
//    }];
//
    
}
-(void)clearBadge{
    
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
