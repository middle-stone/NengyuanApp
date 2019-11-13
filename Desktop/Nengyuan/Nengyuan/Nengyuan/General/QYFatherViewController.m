//
//  QYFatherViewController.m
//  ztp2p
//
//  Created by 乔羽 on 16/3/2.
//  Copyright © 2016年 郑投网. All rights reserved.
//

#import "QYFatherViewController.h"
//#import "QYNormalTwoBtnPromptView.h"
//#import "STModal.h"
//#import "GJLoginViewController.h"
//#import "QYTools.h"
//#import "QYDBManager.h"
//#import "ztp2p-Swift.h"

@interface QYFatherViewController ()

@end

@implementation QYFatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarBackgroundView];
}
- (void)initUI {
    
}
#pragma mark - event response
- (void)back:(UITapGestureRecognizer *)tap {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - pravite methods

- (void)openLoginViewController {
//    GJLoginViewController * login = [[GJLoginViewController alloc] init];
//    login.viewModel.floor = 0;
//    NavigationController * na = [[NavigationController alloc] initWithRootViewController:login];
//    [self presentViewController:na animated:YES completion:^{
//
//    }];
}

- (void)setupNavigationBar {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    UIFont *iconfont = [UIFont fontWithName:@"IconFont" size: 25];
    label.font = iconfont;
    label.text = @"\U0000e634";
    label.textColor = [UIColor whiteColor];
    label.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(back:)];
    tap.numberOfTapsRequired = 1;
    [label addGestureRecognizer:tap];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:label];
    self.navigationItem.leftBarButtonItem = item;
}
- (void)setSafeBar{
    UIView * barview = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight-safeAreaHeight, ScreenWidth, safeAreaHeight)];
    barview.backgroundColor = blueColor_one_level;
    [self.view addSubview:barview];
}

- (void)setNavigationBarBackgroundView {
    self.navigationBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, NavHeight)];
    self.navigationBarView.backgroundColor = blueColor_one_level;
    self.navigationBarView.alpha = 1;
    [self.view addSubview:self.navigationBarView];
}

- (void)showProgressHUD {
    CGRect rect = [[UIScreen mainScreen] bounds];
//    self.progressHUD.textLabel.text = @"正在加载数据...";
//    self.progressHUD.position = JGProgressHUDPositionCenter;
//    [self.progressHUD showInRect:rect inView:self.view animated:YES];
}


- (void)showCodeIsSend {
    CGRect rect = [[UIScreen mainScreen] bounds];
//    self.progressHUD.textLabel.text = @"支付验证短信发送中...";
//    self.progressHUD.position = JGProgressHUDPositionCenter;
//    [self.progressHUD showInRect:rect inView:self.view animated:YES];
}

- (void)showPleaseOpenDepositAccountAlertView {
//    STModal *modal = [STModal modal];
//    modal.type = 1;
//    modal.hideWhenTouchOutside = NO;
//
//    QYNormalTwoBtnPromptView * view = [[QYNormalTwoBtnPromptView alloc] initAccountOpenWarnView];
//    [view setCancleBlock:^{
//        [modal hide:YES];
//    }];
//    [view setMakeSureBlock:^{
//        [modal hide:YES];
//        _openDepositAccountBlock();
//    }];
//    [modal showContentView:view animated:YES];
}

- (void)createBottomLog {
    UIView * view = [[UIView alloc] init];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-49);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    UILabel * label = [[UILabel alloc] init];
    [view addSubview:label];
    
    UILabel * label2 = [[UILabel alloc] init];
    [view addSubview:label2];
    
    UIFont *iconfont = [UIFont fontWithName:@"IconFont" size: 24];
    label.font = iconfont;
    label.text = @"\U0000e612";
    label.textColor = WordColor_two_level;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).with.offset(0);
        make.left.equalTo(view.mas_left).with.offset(0);
    }];
    
    label2.text = @"资金宜宾银行全程存管 安全·规范·透明";
    label2.textColor = WordColor_two_level;
    label2.font = [UIFont systemFontOfSize:10];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right).with.offset(0);
        make.right.equalTo(view.mas_right).with.offset(0);
        make.centerY.equalTo(label.mas_centerY).with.offset(-1);
    }];
}

#pragma mark - getters and setters
//- (JGProgressHUD *)progressHUD
//{
//    if (_progressHUD == nil) {
//        _progressHUD = [JGProgressHUD progressHUDWithStyle:JGProgressHUDStyleDark];
//    }
//    return _progressHUD;
//}

- (MJRefreshNormalHeader *)header {
    if (_header == nil) {
        _header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:nil];
        
        // 设置字体
        _header.stateLabel.font = [UIFont systemFontOfSize:12];
        _header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:12];
        
        // 设置颜色
        _header.stateLabel.textColor = [UIColor grayColor];
    }
    return _header;
}

- (void)skipToSystemSettingWithTitle:(NSString *)title andCancle:(void (^)(void))cancle {
    UIAlertController * actionSheet = [UIAlertController alertControllerWithTitle:@"" message:title preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction * cancleAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancle();
    }];
    UIAlertAction * addAction = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
            NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if( [[UIApplication sharedApplication]canOpenURL:url] ) {
                [[UIApplication sharedApplication]openURL:url options:@{}completionHandler:^(BOOL success) {
                }];
            }
        }else {
            NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if( [[UIApplication sharedApplication]canOpenURL:url] ) {
                [[UIApplication sharedApplication]openURL:url];
            }
        }
    }];
    [actionSheet addAction:cancleAction];
    [actionSheet addAction:addAction];
    [self presentViewController:actionSheet animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
