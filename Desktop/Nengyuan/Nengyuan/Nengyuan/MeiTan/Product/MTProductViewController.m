//
//  MTProductViewController.m
//  Nengyuan
//
//  Created by 齐陈欢 on 2019/11/15.
//  Copyright © 2019 hui. All rights reserved.
//

#import "MTProductViewController.h"

@interface MTProductViewController ()<UITableViewDelegate,UITableViewDataSource,LMJDropdownMenuDelegate>
@property(nonatomic,strong)UITableView*tabView;

@end

@implementation MTProductViewController

- (void)viewDidLoad {
    [self creattabView];
    [self getData1];
}
-(void)creattabView{
    self.tabView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tabView.backgroundColor=[UIColor whiteColor];
    self.tabView.layer.cornerRadius=10;
    self.tabView.layer.masksToBounds=YES;
    self.tabView.delegate=self;
    self.tabView.dataSource=self;
    self.tabView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tabView.tableFooterView=[UIView new];
    [self.tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIden"];
    [self.view addSubview:self.tabView];
    
    
    [self.tabView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (ios11) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);//.mas_offset(60);
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom) ;
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
        }else{
            make.top.equalTo(self.view);//.mas_offset(60);
            make.left.equalTo(self.view);
            make.bottom.equalTo(self.view) ;
            make.right.equalTo(self.view);
        }
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{return 3;}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 350;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIden=@"cellIden";
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIden];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    if (indexPath.row==0) {
        
        
        ChartLeftZhuRightZheView *charV=[[ChartLeftZhuRightZheView alloc]initWithFrame:CGRectMake(0,  0, self.view.bounds.size.width, 350)];
        
        [charV passTheTime:@"2019" andLeftTitle:nil withLeftData:nil withLMax:1000 withLMin:0 andRightTitle:nil withRightData:nil withRMax:1000 withRMin:0 andYCount:5 andLeftColor:nil andRighttColor:nil andDanwei:@"万吨"];
        [cell addSubview:charV];
        HeadFirstView *headV=[[HeadFirstView alloc]initWithFrame:CGRectMake(0, 10, self.view.bounds.size.width, 40)];
        headV.titleText=@"河南省煤炭产量及增速";
        [charV addSubview:headV];
        LMJDropdownMenu * dropdownMenu = [[LMJDropdownMenu alloc] init];
        [dropdownMenu setFrame:CGRectMake(20, 60, 150, 40)];
        [dropdownMenu setMenuTitles:@[@"总装机",@"燃煤发电",@"燃气发电",@"水电"] rowHeight:40];
        dropdownMenu.delegate = self;
        dropdownMenu.tag=10000+indexPath.row;
        [cell addSubview:dropdownMenu];
        
    }else  if (indexPath.row==1) {
        ChartLeftOneZhu *charV=[[ChartLeftOneZhu alloc]initWithFrame:CGRectMake(0,  0, self.view.bounds.size.width, 350)];
        
        [charV passTheTime:@"2019" andLeftTitle:nil withLeftData:nil withLMax:1000 withLMin:0 andRightTitle:nil withRightData:nil withRMax:1000 withRMin:0 andYCount:5 andLeftColor:nil andRighttColor:nil andDanwei:@"万吨" ];
        [cell addSubview:charV];
        HeadFirstView *headV=[[HeadFirstView alloc]initWithFrame:CGRectMake(0, 10, self.view.bounds.size.width, 40)];
        headV.titleText=@"河南省煤炭产量及增速";
        [charV addSubview:headV];
        LMJDropdownMenu * dropdownMenu = [[LMJDropdownMenu alloc] init];
        [dropdownMenu setFrame:CGRectMake(20, 60, 150, 40)];
        [dropdownMenu setMenuTitles:@[@"总装机",@"燃煤发电",@"燃气发电",@"水电"] rowHeight:40];
        dropdownMenu.delegate = self;
        dropdownMenu.tag=10000+indexPath.row;
        [cell addSubview:dropdownMenu];
    }else  if (indexPath.row==2) {
        
        
        ChartLeftOneZhu *charV=[[ChartLeftOneZhu alloc]initWithFrame:CGRectMake(0,  0, self.view.bounds.size.width, 350)];
        
        [charV passTheTime:@"2019" andLeftTitle:nil withLeftData:nil withLMax:1000 withLMin:0 andRightTitle:nil withRightData:nil withRMax:1000 withRMin:0 andYCount:5 andLeftColor:nil andRighttColor:nil andDanwei:@"万吨" ];
        [cell addSubview:charV];
        HeadFirstView *headV=[[HeadFirstView alloc]initWithFrame:CGRectMake(0, 10, self.view.bounds.size.width, 40)];
        headV.titleText=@"河南省煤炭产量及增速";
        [charV addSubview:headV];
        LMJDropdownMenu * dropdownMenu = [[LMJDropdownMenu alloc] init];
        [dropdownMenu setFrame:CGRectMake(20, 60, 150, 40)];
        [dropdownMenu setMenuTitles:@[@"总装机",@"燃煤发电",@"燃气发电",@"水电"] rowHeight:40];
        dropdownMenu.delegate = self;
        dropdownMenu.tag=10000+indexPath.row;
        [cell addSubview:dropdownMenu];
    }
    return   cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // MyOrderDetailViewController *vc=[[MyOrderDetailViewController alloc]init];//
    
    
    // [self.navigationController pushViewController:vc animated:YES];
}
-(void)getData1{
    //{"dateTime":"2019","isDefault":"true","dateType":"2","graphicType":"1","filterParam":"全省合计","belongToKey":"province_coal_output_increase"}
   //NSDictionary *dic=@{@"dateTime":_model1.defaultDate,@"isDefault":@"true",@"dateType":@"2",@"graphicType":@"1",@"filterParam":@"全省合计",@"belongToKey":_model1.belongToKey};
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"2019" forKey:@"dateTime"];
    [dic setValue:@"true" forKey:@"isDefault"];
    [dic setValue:@"2" forKey:@"dateType"];
    [dic setValue:@"1" forKey:@"graphicType"];
    [dic setValue:@"全省合计" forKey:@"filterParam"];
    [dic setValue:@"province_coal_output_increase" forKey:@"belongToKey"];
    
    [ModelNetWorkingHelper modelDataTaskPostNetWorkingWithURLString:[NSString stringWithFormat:@"%@/PowerApp/%@",NY_REQUEST_URLString,_model1.actionUrl] otherHeaderFields:nil parameters:dic success:^(id  _Nullable responseObject) {
//                NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//                NSArray *data=jsonDic[@"data"];
    } failure:^(NSString * _Nonnull error, NSInteger retCode) {
        NSLog(@"err:%@",error);
    }];
 
    
    
}
#pragma mark - LMJDropdownMenu Delegate

- (void)dropdownMenu:(LMJDropdownMenu *)menu selectedCellNumber:(NSInteger)number{
    NSLog(@"你选择了 第%ld个:%@",number,menu.titleArr[number]);
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
