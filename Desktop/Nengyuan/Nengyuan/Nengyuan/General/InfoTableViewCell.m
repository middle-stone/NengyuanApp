//
//  InfoTableViewCell.m
//  Nengyuan
//
//  Created by hui on 2019/11/14.
//  Copyright © 2019 hui. All rights reserved.
//

#import "InfoTableViewCell.h"

@implementation InfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellForTableView:(UITableView *)tableView
{
    static NSString *identity = @"InfoTableViewCell";
    InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"InfoTableViewCell" owner:self options:nil] lastObject];
    }
    return cell;
}

@end
