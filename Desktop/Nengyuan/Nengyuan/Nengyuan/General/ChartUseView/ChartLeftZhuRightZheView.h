//
//  ChartLeftZhuRightZheView.h
//  GGCharts
//
//  Created by 齐陈欢 on 2019/11/13.
//  Copyright © 2019 I really is a farmer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChartLeftZhuRightZheView : UIView


/// 左右显示图表 左边柱状图 右边折线图
-(void)passTheTime:(NSString *)time andLeftTitle:(NSString *)leftTitle  withLeftData:(NSArray *)leftData withLMax:(CGFloat)lmax withLMin:(CGFloat)lmin andRightTitle:(NSString *)rightTitle withRightData:(NSArray *)rightData withRMax:(CGFloat)rmax withRMin:(CGFloat)rmin andYCount:(NSInteger)yCount andLeftColor:(NSString *)leftColor andRighttColor:(NSString *)rightColor andDanwei:(NSString *)danwei;
@end

NS_ASSUME_NONNULL_END
