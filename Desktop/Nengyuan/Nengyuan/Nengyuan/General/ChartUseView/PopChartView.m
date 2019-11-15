//
//  PopChartView.m
//  GGCharts
//
//  Created by 齐陈欢 on 2019/11/14.
//  Copyright © 2019 I really is a farmer. All rights reserved.
//

#import "PopChartView.h"
#import "PopTableViewCell.h"


@interface PopChartView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tabView;
@property(nonatomic,strong)UILabel *headL;
@end
@implementation PopChartView
-(instancetype)initWithFrame:(CGRect)frame{
    self= [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        self.headL=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 20)];
        self.headL.backgroundColor=[UIColor darkGrayColor];
        self.headL.font=[UIFont systemFontOfSize:14];
        self.headL.textColor=[UIColor whiteColor];
        self.tabView.tableHeaderView=self.headL;
    }
    return self;
}
-(void)updateAllData{
    self.headL.text=[NSString stringWithFormat:@" %@",self.timeStr];
    [self.tabView reloadData];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 20;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIden=@"cellIden";
    // title isHide color isYuanxing 需要的字段
//    PopTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIden forIndexPath:indexPath];
//    if (!cellIden) {
       PopTableViewCell * cell=[[[NSBundle mainBundle]loadNibNamed:@"PopTableViewCell" owner:self options:nil]lastObject];
    
    cell.backgroundColor=[UIColor darkGrayColor];
    NSDictionary *dic=self.dataArr[indexPath.row];
     [cell cellWithTitle:dic[@"title"] isHidLeftV:dic[@"isHide"] viewColor:dic[@"color"] isYuan:dic[@"isYuanxing"]];
    return cell;
}
- (UITableView *)tabView{
    if (!_tabView) {
        _tabView=[[UITableView alloc]initWithFrame:self.bounds];
        _tabView.backgroundColor=[UIColor groupTableViewBackgroundColor];
         _tabView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tabView.sectionHeaderHeight=20;
        _tabView.scrollEnabled=NO;
        _tabView.delegate=self;
        _tabView.dataSource=self;
        [self addSubview:_tabView];
        [_tabView registerNib:[UINib nibWithNibName:@"PopTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellIden"];
    }
    return _tabView;
}
- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr=[NSMutableArray array ];
    }
    return _dataArr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
