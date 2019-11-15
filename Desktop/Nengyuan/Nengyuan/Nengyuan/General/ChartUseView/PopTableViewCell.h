//
//  PopTableViewCell.h
//  GGCharts
//
//  Created by 齐陈欢 on 2019/11/14.
//  Copyright © 2019 I really is a farmer. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PopTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *leftV;
@property (weak, nonatomic) IBOutlet UILabel *rightL;
-(void)cellWithTitle:(NSString *)tit isHidLeftV:(NSString *)hideV  viewColor:(NSString*)color isYuan:(NSString *)isyuan ;
@end

NS_ASSUME_NONNULL_END
