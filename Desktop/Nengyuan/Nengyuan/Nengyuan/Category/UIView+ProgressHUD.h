//
//  UIView+ProgressHUD.h
//  QunChuang
//
//  Created by itrax on 2017/6/30.
//  Copyright © 2017年 itrax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UIView (ProgressHUD)

/**
 *  显示提示语
 *
 *  @param text 提示语
 */
- (void)showHUDWithText:(NSString *)text;

/**
 *  长时间显示提示语
 *
 *  @param text 提示语
 */
- (void)showHUDLongTimeWithText:(NSString *)text;


/**
 *  现实loading 圈
 */
- (void)showHUDLoading;

/**
 *  loading，默认时间消失
 */
- (void)showHUDLoadingAutoHideDefaultTime;

/**
 *  底部提示语
 *
 *  @param text 提示语
 */
- (void)showHUDBottomWithText:(NSString *)text;

/**
 *  长时间显示提示语
 *  带有灰色背景
 *  @param text 提示语
 */
- (void)showHUDLongTimeWithBackGroundViewWithText:(NSString *)text;

/**
 *  隐藏
 *
 */
- (void)hideHUDLongTime;

@end
