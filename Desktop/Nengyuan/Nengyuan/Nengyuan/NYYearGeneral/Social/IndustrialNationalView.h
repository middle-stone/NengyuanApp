//
//  IndustrialNationalView.h
//  Nengyuan
//
//  Created by hui on 2019/11/15.
//  Copyright © 2019 hui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IndustrialNationalView : UIView
@property (nonatomic,assign) NSInteger leftYLines;       // 左侧Y轴数量
@property (nonatomic,assign) NSInteger leftYMutiple;     // 左侧Y轴倍数
@property (nonatomic,assign) NSInteger rightYLines;      // 右侧Y轴数量
@property (nonatomic,assign) NSInteger rightYMutiple;    // 右侧Y轴倍数
@property (nonatomic,strong) NSMutableArray *xdataArr;   // X轴数据
@property (nonatomic,strong) NSMutableArray *barDataArr; // 柱状图数据
@property (nonatomic,strong) NSMutableArray *barPercentArr; // 柱状图各部分所占百分比
@property (nonatomic,strong) NSMutableArray *lineDataArr;   // 折线图数据
@property (nonatomic,assign) BOOL isShowLine; // 是否显示折线图

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
