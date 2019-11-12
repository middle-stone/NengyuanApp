//
//  NYMainCollectionViewCell.h
//  Nengyuan
//
//  Created by hui on 2019/11/12.
//  Copyright © 2019 hui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NYMainCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *itemTitleLab;
@property (weak, nonatomic) IBOutlet UIImageView *itemImg;

+(instancetype)cellForTableView:(UICollectionView *)collectionView WithIndexPath:(NSIndexPath *)indexPath;


@end

NS_ASSUME_NONNULL_END
