//
//  MainViewController.m
//  Nengyuan
//
//  Created by hui on 2019/11/11.
//  Copyright © 2019 hui. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView * collectionView;
@property (strong,nonatomic)NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray * imageArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
