//
//  SocialViewController.m
//  Nengyuan
//
//  Created by hui on 2019/11/13.
//  Copyright © 2019 hui. All rights reserved.
//

#import "SocialViewController.h"
#import "YearGeneralManager.h"
#import "IndustrialView.h"
#import "CityPersonRateView.h"
#import "IndustrialNationalView.h"

static CGFloat const viewHeight = 350;

@interface SocialViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;
@property (nonatomic,strong) IndustrialView *indusView;         // 河南产业结构
@property (nonatomic,strong) CityPersonRateView *cityRateView;  // 常住人口及城镇化率
@property (nonatomic,strong) IndustrialNationalView *nationalView; // 河南省与全国、典型省份产业结构对比

@end

@implementation SocialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self reloadData];
    [self test];

}

- (void)initView {
    self.bgScrollView.contentSize = CGSizeMake( ScreenWidth, 2800);
    self.bgScrollView.showsHorizontalScrollIndicator  = NO;
    self.bgScrollView.delegate = self;
    [self initIndustrialView];
}
-(void)reloadData {
    [self reloadIndustrialData];
    [self reloadCityPersonData];
    [self reloadNationalData];
}

-(void)test {
    [YearGeneralManager testsuccess:^(id  _Nonnull response) {
        
    } failure:^(NSString * _Nonnull errorStr, NSInteger retcode) {
        
    }];
}

-(void)initIndustrialView {
    // 河南产业结构
    self.indusView = [[IndustrialView alloc]initWithFrame:CGRectMake(0, 350, ScreenWidth, viewHeight)];
    [self.bgScrollView addSubview:self.indusView];
    
    // 常住人口及城镇化率
    self.cityRateView = [[CityPersonRateView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.indusView.frame), ScreenWidth, viewHeight)];
    [self.bgScrollView addSubview:self.cityRateView];
    
    // 河南省与全国、典型省份产业结构对比
    self.nationalView = [[IndustrialNationalView alloc]initWithFrame:CGRectMake(0, 350 * 6, ScreenWidth, viewHeight)];
    [self.bgScrollView addSubview:self.nationalView];
    
}
#pragma mark -- 河南省与全国、典型省份产业结构对比
-(void)reloadNationalData {
    [YearGeneralManager returnNationalIndustrialWithDate:@"2018" success:^(id  _Nonnull response) {
        NSLog(@"%@",response);
        NSDictionary *dic = [self dictionaryWithJsonString:response];
        NSDictionary *result = dic[@"data"];
        self.nationalView.xdataArr = result[@"xdata"];
        
        NSArray *toolData = result[@"tooltipMergeData"];
        NSArray *firstD = [toolData dd_objectAtIndex:0][@"data"];
        NSArray *secondD = [toolData dd_objectAtIndex:1][@"data"];
        NSArray *thirdD = [toolData dd_objectAtIndex:2][@"data"];
        self.nationalView.barDataArr = @[firstD,secondD,thirdD].mutableCopy;
        
        NSArray *barData = result[@"ydata1"];
        NSArray *firstData = [barData dd_objectAtIndex:0][@"data"];
        NSArray *secondData = [barData dd_objectAtIndex:1][@"data"];
        NSArray *thirdData = [barData dd_objectAtIndex:2][@"data"];
//        self.nationalView.barPercentArr = @[firstData,secondData,thirdData].mutableCopy;
        self.nationalView.barPercentArr = @[thirdData,secondData,firstData].mutableCopy;
        self.nationalView.leftYLines = 5;
        self.nationalView.leftYMutiple = 20;
        self.nationalView.rightYLines = 5;
        self.nationalView.rightYMutiple = 20;
        self.nationalView.isShowLine = NO;
        [self.nationalView reloadData];
    } failure:^(NSString * _Nonnull errorStr, NSInteger retcode) {
        
    }];
}

#pragma mark -- 河南产业结构
- (void)reloadIndustrialData {
    [YearGeneralManager returnIndustrialStructureWithsuccess:^(id  _Nonnull response) {
        NSDictionary *dic = [self dictionaryWithJsonString:response];
        NSDictionary *result = dic[@"data"];
        self.indusView.xdataArr = result[@"xdata"];
        
        NSArray *toolData = result[@"tooltipMergeData"];
        NSArray *firstD = [toolData dd_objectAtIndex:0][@"data"];
        NSArray *secondD = [toolData dd_objectAtIndex:1][@"data"];
        NSArray *thirdD = [toolData dd_objectAtIndex:2][@"data"];
        self.indusView.barDataArr = @[firstD,secondD,thirdD].mutableCopy;
        
        NSArray *barData = result[@"ydata1"];
        NSArray *firstData = [barData dd_objectAtIndex:0][@"data"];
        NSArray *secondData = [barData dd_objectAtIndex:1][@"data"];
        NSArray *thirdData = [barData dd_objectAtIndex:2][@"data"];
        self.indusView.barPercentArr = @[firstData,secondData,thirdData].mutableCopy;
//        self.indusView.lineDataArr = @[@"34",@"40",@"45",@"50",@"45",@"30",@"40",@"34",@"40",@"45",@"50",@"45",@"30",@"40",@"40"].mutableCopy;
        self.indusView.leftYLines = 5;
        self.indusView.leftYMutiple = 20;
        self.indusView.rightYLines = 5;
        self.indusView.rightYMutiple = 20;
        self.indusView.isShowLine = NO;
        [self.indusView reloadData];

    } failure:^(NSString * _Nonnull errorStr, NSInteger retcode) {
        NSLog(@"%@-%ld",errorStr,retcode);
    }];
}

#pragma mark -- 河南省常住人口及城镇化率
-(void)reloadCityPersonData {
    [YearGeneralManager returnCityPersonRateWithsuccess:^(id  _Nonnull response) {
        NSLog(@"%@",response);
        NSDictionary *dic = [self dictionaryWithJsonString:response];
        NSDictionary *result = dic[@"data"];
        self.cityRateView.xdataArr = result[@"xdata"];
        NSArray *totalData = result[@"ydata1"];
        NSArray *firstArr = [totalData dd_objectAtIndex:0][@"data"];
        NSArray *secondArr = [totalData dd_objectAtIndex:1][@"data"];
        self.cityRateView.barDataArr = @[firstArr,secondArr].mutableCopy;
//        self.cityRateView.barDataArr = @[@"2019",@"2019",@"2019",@"2019",@"2019",@"2019",@"2019",@"2019",@"2019",@"2019",@"2019",@"2019",@"2019",@"2019"].mutableCopy;
        self.cityRateView.barPercentArr = @[@[@"0.5",@"0.6",@"0.4",@"0.4",@"0.2",@"0.5",@"0.5",@"0.5",@"0.5",@"0.5",@"0.5",@"0.5",@"0.5",@"0.5"],@[@"0.5",@"0.4",@"0.6",@"0.6",@"0.8",@"0.5",@"0.5",@"0.5",@"0.5",@"0.5",@"0.5",@"0.5",@"0.5",@"0.5"]].mutableCopy;
        self.cityRateView.lineDataArr = @[@"34",@"40",@"45",@"50",@"45",@"30",@"40",@"34",@"40",@"45",@"50",@"45",@"30",@"40"].mutableCopy;
        self.cityRateView.leftYLines = 5;
        self.cityRateView.leftYMutiple = 20;
        self.cityRateView.rightYLines = 5;
        self.cityRateView.rightYMutiple = 20;
        self.cityRateView.isShowLine = YES;
        [self.cityRateView reloadData];
    } failure:^(NSString * _Nonnull errorStr, NSInteger retcode) {
        
    }];
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
