//
//  ChartLeftLinesView.h
//  GGCharts
//
//  Created by 齐陈欢 on 2019/11/14.
//  Copyright © 2019 I really is a farmer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChartLeftLinesView : UIView
/// 左边图表 左边柱多个折线图
-(void)passTheTime:(NSString *)time andLeftTitle:(NSString *)leftTitle   withTitleArr:(NSArray *)titleArr withDatas:(NSArray *)datas andColors:(NSArray *)colors    withLMax:(CGFloat)lmax withLMin:(CGFloat)lmin     andYCount:(NSInteger)yCount  andDanwei:(NSString *)danwei;
@end

NS_ASSUME_NONNULL_END
