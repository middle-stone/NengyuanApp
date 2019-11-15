//
//  PopTableViewCell.m
//  GGCharts
//
//  Created by 齐陈欢 on 2019/11/14.
//  Copyright © 2019 I really is a farmer. All rights reserved.
//

#import "PopTableViewCell.h"

@implementation PopTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)cellWithTitle:(NSString *)tit isHidLeftV:(NSString *)hideV  viewColor:(NSString*)color isYuan:(NSString *)isyuan{
    self.rightL.text=tit;
    
    
    if (![hideV isEqualToString:@"1"]) {
        self.leftV.hidden=NO;
        if ([isyuan isEqualToString:@"1"]) {
            self.leftV.backgroundColor=[UIColor whiteColor];
            self.leftV.layer.borderColor=[self colorWithHexStr:color].CGColor;
            self.leftV.layer.borderWidth=3.5;
            self.leftV.layer.cornerRadius=7.5;
            self.leftV.layer.masksToBounds=YES;
        }else{
            self.leftV.backgroundColor=[self colorWithHexStr:color];
        }
    }else{
        self.leftV.hidden=YES;
    }
    
}

-(UIColor *)colorWithHexStr:(NSString *)stringToConvert {
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor whiteColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor whiteColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
