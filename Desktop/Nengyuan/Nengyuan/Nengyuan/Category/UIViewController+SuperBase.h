//
//  UIViewController+SuperBase.h
//  Nengyuan
//
//  Created by hui on 2019/11/13.
//  Copyright © 2019 hui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (SuperBase)
/**
 *  加载白色返回键和白色标题
 */
- (void)loadWhiteBackButtonFunction;

/**
 *  修改状态栏为蓝色
 */
-(void)setStatusBarBackgroundColorWithBlueColor;

@end

NS_ASSUME_NONNULL_END
