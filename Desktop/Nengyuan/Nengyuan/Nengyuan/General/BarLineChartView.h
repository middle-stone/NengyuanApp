//
//  BarLineChartView.h
//  demo
//
//  Created by hui on 2019/11/12.
//  Copyright © 2019 hui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BarLineChartView : UIView
/**
 * Ylines        Y轴对应的个数
 * mutiple       倍数
 */
-(instancetype)initWithFrame:(CGRect)frame withYLines:(NSInteger)ylines withMutiple:(NSInteger)mutiple withRightYlines:(NSInteger)rightLines withRightMut:(NSInteger)rightMut;

@property (nonatomic,strong) NSMutableArray *barDataArr;  // 柱状图数据
@property (nonatomic,strong) NSMutableArray *barPercentArr;
@property (nonatomic,strong) NSMutableArray *lineDataArr;  // 柱状图数据
@property (nonatomic,strong) NSMutableArray *xdataArr;     // x轴数据
@property (nonatomic,assign) BOOL isShowLine; // 是否显示折线图(yes:显示)




-(void)reloadData;

@end

NS_ASSUME_NONNULL_END
