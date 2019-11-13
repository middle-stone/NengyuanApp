//
//  NYYearGeneralController.m
//  Nengyuan
//
//  Created by hui on 2019/11/13.
//  Copyright © 2019 hui. All rights reserved.
//

#import "NYYearGeneralController.h"
#import "SocialViewController.h"
#import "EnergyViewController.h"
#import "ElectricityViewController.h"
#import "PollutantViewController.h"

@interface NYYearGeneralController ()

@end

@implementation NYYearGeneralController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
}

- (void)initView {
    NSArray * titleArray = @[@"经济社会",@"能源",@"电力",@"污染物排放"];
    SocialViewController *view1 = [[SocialViewController alloc]init];
    EnergyViewController *view2 = [[EnergyViewController alloc]init];
    ElectricityViewController *view3 = [[ElectricityViewController alloc]init];
    PollutantViewController *view4 = [[PollutantViewController alloc]init];
    [self setupUIWithChildViewControllers:@[view1,view2,view3,view4] andTitles:titleArray];

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
