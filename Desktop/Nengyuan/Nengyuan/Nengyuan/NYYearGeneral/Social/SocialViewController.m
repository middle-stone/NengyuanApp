//
//  SocialViewController.m
//  Nengyuan
//
//  Created by hui on 2019/11/13.
//  Copyright © 2019 hui. All rights reserved.
//

#import "SocialViewController.h"
#import "YearGeneralManager.h"


@interface SocialViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollView;

@end

@implementation SocialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    self.bgScrollView.contentSize = CGSizeMake( ScreenWidth, 2800);
    self.bgScrollView.showsHorizontalScrollIndicator  = NO;
    self.bgScrollView.delegate = self;
}

- (void)reloadData {
    [YearGeneralManager returnIndustrialStructureWithsuccess:^(id  _Nonnull response) {
        
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
