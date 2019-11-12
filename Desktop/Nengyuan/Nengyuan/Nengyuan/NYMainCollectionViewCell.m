//
//  NYMainCollectionViewCell.m
//  Nengyuan
//
//  Created by hui on 2019/11/12.
//  Copyright © 2019 hui. All rights reserved.
//

#import "NYMainCollectionViewCell.h"

@implementation NYMainCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)cellForTableView:(UICollectionView *)collectionView WithIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identity = @"NYMainCollectionViewCell";
    NYMainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identity forIndexPath:indexPath];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NYMainCollectionViewCell" owner:self options:nil] lastObject];
    }
    return cell;
}

@end
