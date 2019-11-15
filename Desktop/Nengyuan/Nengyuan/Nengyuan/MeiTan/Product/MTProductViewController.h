//
//  MTProductViewController.h
//  Nengyuan
//
//  Created by 齐陈欢 on 2019/11/15.
//  Copyright © 2019 hui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MTProductViewController : UIViewController
///煤炭产量
@property(nonatomic,strong)ModularTypeModel *model1 ;

///煤炭生产
@property(nonatomic,strong)ModularTypeModel *model2 ;
///煤矿生产
@property(nonatomic,strong)ModularTypeModel *model3 ;
@end

NS_ASSUME_NONNULL_END
