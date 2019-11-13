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


@interface SocialViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;
@property (nonatomic,strong) IndustrialView *indusView;

@end

@implementation SocialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self reloadData];
}

- (void)initView {
    self.bgScrollView.contentSize = CGSizeMake( ScreenWidth, 2800);
    self.bgScrollView.showsHorizontalScrollIndicator  = NO;
    self.bgScrollView.delegate = self;
    [self initIndustrialView];
}

-(void)initIndustrialView {
    self.indusView = [[IndustrialView alloc]initWithFrame:CGRectMake(0, 350, ScreenWidth, 350)];
    [self.bgScrollView addSubview:self.indusView];
}

- (void)reloadData {
    [YearGeneralManager returnIndustrialStructureWithsuccess:^(id  _Nonnull response) {
        NSLog(@"%@",response);
        NSDictionary *result = [self dictionaryWithJsonString:response];
        NSDictionary *data = [self dictionaryWithJsonString:result[@"data"]];
        NSLog(@"%@",data);
        self.indusView.xdataArr = @[@"2004",@"2005",@"2006",@"2007",@"2008",@"2009",@"2010",@"2011",@"2012",@"2013",@"2014",@"2015",@"2016",@"2017",].mutableCopy;
        self.indusView.barDataArr = @[@"2019",@"2019",@"2019",@"2019",@"2019",@"2019",@"2019",@"2019",@"2019",@"2019",@"2019",@"2019",@"2019",@"2019"].mutableCopy;
        self.indusView.barPercentArr = @[@[@"0.5",@"0.6",@"0.4",@"0.4",@"0.2",@"0.5",@"0.5",@"0.5",@"0.5",@"0.5",@"0.5",@"0.5",@"0.5",@"0.5"],@[@"0.3",@"0.2",@"0.3",@"0.5",@"0.3",@"0.3",@"0.3",@"0.3",@"0.3",@"0.3",@"0.3",@"0.3",@"0.3",@"0.3"],@[@"0.2",@"0.2",@"0.3",@"0.1",@"0.5",@"0.2",@"0.2",@"0.2",@"0.2",@"0.2",@"0.2",@"0.2",@"0.2",@"0.2"]].mutableCopy;
        self.indusView.lineDataArr = @[@"34",@"40",@"45",@"50",@"45",@"30",@"40",@"34",@"40",@"45",@"50",@"45",@"30",@"40"].mutableCopy;
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
