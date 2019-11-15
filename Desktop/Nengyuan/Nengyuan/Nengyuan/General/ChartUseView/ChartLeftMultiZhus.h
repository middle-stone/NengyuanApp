//
//  ChartLeftMultiZhus.h
//  GGCharts
//
//  Created by 齐陈欢 on 2019/11/15.
//  Copyright © 2019 I really is a farmer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChartLeftMultiZhus : UIView
/// 左显示图表一个柱状图
-(void)passTheTime:(NSString *)time andLeftTitle:(NSString *)leftTitle withTitleArr:(NSArray *)titleArr withLeftDatas:(NSArray *)leftDatas withLMax:(CGFloat)lmax withLMin:(CGFloat)lmin andRightTitle:(NSString *)rightTitle withRightData:(NSArray *)rightData withRMax:(CGFloat)rmax withRMin:(CGFloat)rmin andYCount:(NSInteger)yCount andLeftColor:(NSString *)leftColor andRighttColor:(NSString *)rightColor andDanwei:(NSString *)danwei;
@end

NS_ASSUME_NONNULL_END
