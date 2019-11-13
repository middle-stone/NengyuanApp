//
//  QYFatherViewController.h
//  ztp2p
//
//  Created by 乔羽 on 16/3/2.
//  Copyright © 2016年 郑投网. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>
#import <Masonry/Masonry.h>

/** 文字高度  */
static CGFloat const titleH = 60;
/** 选中文字放大  */
static CGFloat const MaxScale = 1.0;

@interface QYFatherViewController : UIViewController

//@property (nonatomic, strong) JGProgressHUD * progressHUD;

@property (nonatomic, strong) MJRefreshNormalHeader * header;

@property (nonatomic, strong) UIImageView * navigationBarView;

@property (nonatomic, copy) void (^openDepositAccountBlock)(void);

- (void)initUI;

/**
 *  navigationBar背景
 */
- (void)setNavigationBarBackgroundView;

/**
 *  添加并设置navigationBar
 */
- (void)setupNavigationBar;

/**
 *  展示数据正在加载
 *  @return
 */
- (void)showProgressHUD;

- (void)openLoginViewController;
/**
 *  展示支付短信验证码发送中
 *
 */
- (void)showCodeIsSend;

/**
 *  创建底部logo
 *
 */
- (void)createBottomLog;

- (void)setSafeBar;

/**
 *  提示用户开通存管账户
 */
- (void)showPleaseOpenDepositAccountAlertView;

/**
 跳转到系统设置页面

 @param title 提示内容
 */
- (void)skipToSystemSettingWithTitle:(NSString *)title andCancle:(void (^)(void))cancle;
@end
