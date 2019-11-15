//
//  HeadFirstView.h
//  GGCharts
//
//  Created by 齐陈欢 on 2019/11/13.
//  Copyright © 2019 I really is a farmer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeadFirstView : UIView


@property(nonatomic,copy)NSString *titleText;
@property(nonatomic,copy)void (^choseDateBtnClick)(NSString *date);
@end

NS_ASSUME_NONNULL_END
