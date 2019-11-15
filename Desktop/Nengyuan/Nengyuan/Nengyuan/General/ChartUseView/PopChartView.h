//
//  PopChartView.h
//  GGCharts
//
//  Created by 齐陈欢 on 2019/11/14.
//  Copyright © 2019 I really is a farmer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PopChartView : UIView
@property(nonatomic,copy)NSString *timeStr;
@property(nonatomic,strong)NSMutableArray *dataArr;
-(void)updateAllData;
@end

NS_ASSUME_NONNULL_END
