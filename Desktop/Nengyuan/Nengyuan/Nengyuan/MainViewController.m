//
//  MainViewController.m
//  Nengyuan
//
//  Created by hui on 2019/11/11.
//  Copyright © 2019 hui. All rights reserved.
//

#import "MainViewController.h"
#import "NYMainCollectionViewCell.h"
#import "NYYearGeneralController.h"

@interface MainViewController ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView * collectionView;
@property (strong,nonatomic)NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray * imageArray;

@end

@implementation MainViewController
static NSString * const reuseIdentifier = @"NYMainCollectionViewCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"能源信息";
    self.navigationController.navigationBar.barTintColor = ColorWithRGB(69, 139, 251);
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]}; // title颜色

    [self initView];
    self.dataArray = @[@"年度概况",@"煤炭",@"油气",@"电力",@"可再生能源",@"价格",@"规上工业",@"能源报告"].mutableCopy;
    [self.collectionView reloadData];
}

-(void)initView {
    UIBarButtonItem *addnew = [self barButtonItemWithTitle:@"退出"target:self action:@selector(ClickNavigationAction)];
    self.navigationItem.rightBarButtonItem = addnew;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    CGFloat layoutWidth = ScreenWidth / 4.0;
    CGFloat layoutHeight = 30;
    layout.itemSize = CGSizeMake(layoutWidth, layoutHeight);
    layout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.headerReferenceSize = CGSizeMake(ScreenWidth, 44);

    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, NavHeight + 50, ScreenWidth, ScreenHeight - NavHeight - 50) collectionViewLayout:layout];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([NYMainCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
}

-(UIBarButtonItem *)barButtonItemWithTitle:(NSString *)titleName target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(-20, 10, 25, 25);
    [button setTitleColor:ColorFromHex(0x3E729A) forState:(UIControlStateNormal)];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    button.imageView.contentMode = UIViewContentModeCenter;
    [button setTitle:titleName forState:(UIControlStateNormal)];
    button.adjustsImageWhenHighlighted = NO;
    [button addTarget:target action:action forControlEvents:(UIControlEventTouchUpInside)];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)ClickNavigationAction {
    NSLog(@"退出");
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NYMainCollectionViewCell *cell = [NYMainCollectionViewCell cellForTableView:collectionView WithIndexPath:indexPath];
    cell.itemTitleLab.text = self.dataArray[indexPath.row];
    cell.itemImg.image = [UIImage imageNamed:@""];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat layoutWidth = (ScreenWidth - 40 ) / 2.0;
    return CGSizeMake(layoutWidth, 90);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
// sectionHeader的高度
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(0, 0);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:{
            NYYearGeneralController *yearVC = [[NYYearGeneralController alloc]init];
            [self.navigationController pushViewController:yearVC animated:YES];
            
            break;
        }
        default:
            break;
    }
    NSLog(@"index:%ld",indexPath.row);
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
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
