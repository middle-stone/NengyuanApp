//
//  IndustrialNationalView.m
//  Nengyuan
//
//  Created by hui on 2019/11/15.
//  Copyright © 2019 hui. All rights reserved.
//河南省与全国、典型省份产业结构对比

#import "IndustrialNationalView.h"
#import "BarLineChartView.h"


@interface IndustrialNationalView()
@property (nonatomic,strong) BarLineChartView *barView;


@end


@implementation IndustrialNationalView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


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
    titleLab.text = @"河南省与全国、典型省份产业结构对比";
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
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    [self addGestureRecognizer:tapGes];
    
    self.barView = [[BarLineChartView alloc]initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 200) withYLines:self.leftYLines withMutiple:self.leftYMutiple withRightYlines:self.rightYLines withRightMut:self.rightYMutiple showLeftPercent:YES showRightPercent:NO];
    [self addSubview:self.barView];
    self.barView.xdataArr = self.xdataArr;
    self.barView.barDataArr = self.barDataArr;
    self.barView.barPercentArr = self.barPercentArr;
    self.barView.isShowLine = self.isShowLine;
    self.barView.lineDataArr = self.lineDataArr;
    self.barView.colorArray = @[ColorWithRGB(171, 204, 100),ColorWithRGB(255, 213, 4),ColorWithRGB(85, 141, 214)].mutableCopy;
    NSArray *title = @[@"第一产业",@"第二产业",@"第三产业"];
    __weak typeof(self) weakSelf = self;
    self.barView.clickBar = ^(NSInteger tag) {
        NSMutableArray *infoArr = [NSMutableArray array];
        for (NSInteger i = 0; i < self.barDataArr.count; i++) {
            NSString *count = weakSelf.barDataArr[i][tag];
            NSArray *arr = [[weakSelf.barPercentArr reverseObjectEnumerator] allObjects];;
            NSString *percent = arr[i][tag];
            float tmpPer = percent.floatValue;
            NSString *per = [NSString stringWithFormat:@"%.1f",tmpPer];
            NSString *infoStr = [NSString stringWithFormat:@"%@ %@亿元 占比 %@%%",title[i],count,per];
            [infoArr addObject: infoStr];
            NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15.0f],};
            CGSize textSize = [infoStr boundingRectWithSize:CGSizeMake(ScreenWidth, 100) options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;;
            [weakSelf.barView updateInfoViewWidth:textSize.width + 60];
            weakSelf.barView.infoView.dataArray = infoArr;
            [weakSelf.barView.infoView reloadData];
            
        }
    };
    
    [self.barView reloadData];
}

- (void)tapClick:(UITapGestureRecognizer *)sender {
    for (UIView *tmpView in self.subviews) {
        if ([tmpView isKindOfClass:[BarLineChartView class]]) {
            for (UIView *tmpV in tmpView.subviews) {
                if (tmpV.tag == 9999) {
                    tmpV.hidden = YES;
                }
            }
        }
    }
}

@end
