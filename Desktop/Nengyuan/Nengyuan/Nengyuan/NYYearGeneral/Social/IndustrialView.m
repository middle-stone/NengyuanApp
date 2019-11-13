//
//  IndustrialView.m
//  Nengyuan
//
//  Created by hui on 2019/11/13.
//  Copyright © 2019 hui. All rights reserved.
//
// 河南省产业结构
#import "IndustrialView.h"
#import "BarLineChartView.h"

@implementation IndustrialView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
      
    }
    return self;
}

- (void)reloadData{
    [self initView];
}

-(void)initView {
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 80)];
    [self addSubview:topView];
    UIView *tipView = [[UIView alloc]init];
    tipView.backgroundColor = [UIColor blackColor];
    [topView addSubview:tipView];
    [tipView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView).offset(25);
        make.centerY.equalTo(topView).offset(10);
        make.size.mas_equalTo(CGSizeMake(5, 20));
    }];
    
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.text = @"河南省产业结构";
    titleLab.font = [UIFont systemFontOfSize:17];
    [topView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tipView.mas_right).offset(10);
        make.centerY.equalTo(tipView);
        make.height.mas_equalTo(40);
    }];
    
    UIView *bottomView = [[UIView alloc]init];
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(70);
    }];
    UIView *bgView = [[UIView alloc]init];
    [bottomView addSubview:bgView];
    NSArray *colorArr = @[ColorWithRGB(85, 141, 214),ColorWithRGB(255, 213, 4),ColorWithRGB(171, 204, 100)];
    NSArray *titleArr = @[@"第一产业",@"第二产业",@"第三产业"];
    for (int i = 0; i < 3; i++) {
        UIView *colorV = [[UIView alloc]initWithFrame:CGRectMake(70*i, 0, 10, 10)];
        colorV.backgroundColor = colorArr[i];
        [bgView addSubview:colorV];
        UILabel *titleL = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(colorV.frame), 0, 50, 10)];
        titleL.font = [UIFont systemFontOfSize:12];
        titleL.text = titleArr[i];
        [bgView addSubview:titleL];
    }
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(210, 10));
        make.centerX.equalTo(bottomView.mas_centerX);
        make.centerY.equalTo(bottomView.mas_centerY);
    }];
    
    BarLineChartView *barView = [[BarLineChartView alloc]initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 200) withYLines:self.leftYLines withMutiple:self.leftYMutiple withRightYlines:self.rightYLines withRightMut:self.rightYMutiple];
    [self addSubview:barView];
    barView.xdataArr = self.xdataArr;
    barView.barDataArr = self.barDataArr;
    barView.barPercentArr = self.barPercentArr;
    barView.isShowLine = self.isShowLine;
    barView.lineDataArr = self.lineDataArr;
    [barView reloadData];
}

@end
