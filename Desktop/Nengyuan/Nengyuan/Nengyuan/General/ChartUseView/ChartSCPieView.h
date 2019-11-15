//
//  ChartSCPieView.h
//  GGCharts
//
//  Created by 齐陈欢 on 2019/11/14.
//  Copyright © 2019 I really is a farmer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChartSCPieView : UIView
/// 饼状图
-(void)passTheTime:(NSString *)time andTitle:(NSString *)title  withData:(NSArray *)Data withtitleArr:(NSArray *)titles  andColors:(NSArray *)colors andDanwei:(NSString*)danwei;
@end

NS_ASSUME_NONNULL_END
