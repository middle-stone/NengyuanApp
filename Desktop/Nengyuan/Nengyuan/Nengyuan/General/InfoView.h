//
//  InfoView.h
//  Nengyuan
//
//  Created by hui on 2019/11/14.
//  Copyright © 2019 hui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InfoView : UIView
@property (nonatomic,strong) NSString *yearStr;     //年份
@property (nonatomic,strong) NSMutableArray *colorArr; // 方块的颜色
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UITableView *tableView;

-(instancetype)initWithFrame:(CGRect)frame ;

-(void)reloadData;

@end

NS_ASSUME_NONNULL_END
