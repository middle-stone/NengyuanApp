//
//  GJMultipleMarkViewController.h
//  ztp2p
//
//  Created by Geselle_Joy on 16/11/11.
//  Copyright © 2016年 郑投网. All rights reserved.
//

#import "QYFatherViewController.h"

@interface GJMultipleMarkViewController : QYFatherViewController
/** 标签scrollView  */
@property (nonatomic, strong) UIScrollView *titleScrollView;
/** 控制器scrollView  */
@property (nonatomic, strong) UIScrollView *contentScrollView;
/** 标签title数组  */
@property (nonatomic, strong) NSArray * titlesArr;
/** 标签按钮数组  */
@property (nonatomic, strong) NSMutableArray *buttons;
/** 选中的按钮  */
@property (nonatomic, strong) UIButton * selectedBtn;
/** 按钮下方滑块  */
@property (nonatomic, strong) UIView * sliderView;

@property (nonatomic, assign) NSInteger index;

/**
 *  设置子页面和标题
 *
 *  @param childViewControllerArray 子页面数组
 *  @param titleLabelArray          标题数组
 */
- (void)setupUIWithChildViewControllers:(NSArray *)childViewControllerArray andTitles:(NSArray *)titleLabelArray;
- (void)clicked:(NSInteger)tag;

-(void)controllerIndex:(NSInteger)index;
@end
