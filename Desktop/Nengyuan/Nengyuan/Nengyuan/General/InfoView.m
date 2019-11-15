//
//  InfoView.m
//  Nengyuan
//
//  Created by hui on 2019/11/14.
//  Copyright © 2019 hui. All rights reserved.
//

#import "InfoView.h"
#import "InfoTableViewCell.h"

@interface InfoView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UILabel *yearLab;     //年份

@property (nonatomic,strong) UILabel *firstLab;
@property (nonatomic,strong) UILabel *secondLab;
@property (nonatomic,strong) UILabel *thirdLab;
@property (nonatomic,strong) UIView *firstView;
@property (nonatomic,strong) UIView *secondView;
@property (nonatomic,strong) UIView *thirdView;


@end


@implementation InfoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initTableView];
//        [self initViewWithColor:colorArr];
    }
    return self;
}
- (void)initTableView {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = ColorWithRGB(110, 110, 110);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
}

- (void)initViewWithColor:(NSMutableArray *)colorArr {
    [self.yearLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self);
        make.right.equalTo(self);
        make.height.mas_equalTo(20);
    }];
    [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self.yearLab.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    [self.firstLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.firstView.mas_right).offset(5);
        make.right.equalTo(self);
        make.centerY.equalTo(self.firstView);
        make.height.mas_equalTo(20);
    }];


    [self.secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self.firstLab.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    [self.secondLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.secondView.mas_right).offset(5);
        make.right.equalTo(self);
        make.centerY.equalTo(self.secondView);
        make.height.mas_equalTo(20);
    }];

    [self.thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self.secondLab.mas_bottom).offset(5);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    [self.thirdLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.thirdView.mas_right).offset(5);
        make.right.equalTo(self);
        make.centerY.equalTo(self.thirdView);
        make.height.mas_equalTo(20);
    }];
 
//    NSArray *arr = [[colorArr reverseObjectEnumerator] allObjects];
    NSInteger count = colorArr.count;
    self.firstView.backgroundColor = [colorArr dd_objectAtIndex:count - 1];
    self.secondView.backgroundColor = [colorArr dd_objectAtIndex:count - 2];
    self.thirdView.backgroundColor = [colorArr dd_objectAtIndex:count - 3];
}

-(void)reloadData {
    [self.tableView reloadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 25)];
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.bounds.size.width, 25)];
    titleLab.textColor = [UIColor whiteColor];
    titleLab.font = [UIFont systemFontOfSize:15];
    titleLab.text = self.yearStr;
    [headView addSubview:titleLab];
    return headView;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InfoTableViewCell *cell = [InfoTableViewCell cellForTableView:tableView];
    cell.contentLab.text = self.dataArray[indexPath.row];
    cell.colorView.backgroundColor = self.colorArr[ indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(NSMutableArray *)colorArr {
    if (!_colorArr) {
        _colorArr = [NSMutableArray array];
    }
    return _colorArr;
}

@end
