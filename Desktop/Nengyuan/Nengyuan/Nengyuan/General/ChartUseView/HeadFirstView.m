//
//  HeadFirstView.m
//  GGCharts
//
//  Created by 齐陈欢 on 2019/11/13.
//  Copyright © 2019 I really is a farmer. All rights reserved.
//

#import "HeadFirstView.h"
 
@interface HeadFirstView()

@property(nonatomic,strong)UILabel *titleLabel;

@property(nonatomic,strong)UIButton *dateBtn;
@end
@implementation HeadFirstView

- (instancetype)initWithFrame:(CGRect)frame{
    self= [super initWithFrame:frame];
    if (self) {
         [self creatViews];
        
    }
    return self;
}
- (void)setTitleText:(NSString *)titleText{
     self.titleLabel.text=titleText;
    CGSize fontSize = [titleText sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName]];
    self.titleLabel.frame=CGRectMake(20, 10, fontSize.width, 20);
 self.dateBtn.frame=CGRectMake(CGRectGetMaxX(self.titleLabel.frame)+10, 10, 80, 20);
    
    
    
}
-(void)creatViews{
    UIView *leftV=[[UIView alloc]initWithFrame:CGRectMake(10, 15, 3, 10)];
    leftV.backgroundColor=[UIColor darkGrayColor];
    [self addSubview:leftV];
    self.titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 10, 0, 20)];
    self.titleLabel.font=[UIFont systemFontOfSize:14];
    self.titleLabel.textColor=[UIColor blackColor];
     [self addSubview:self.titleLabel];
    
    self.dateBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    self.dateBtn.frame=CGRectMake(CGRectGetMaxX(self.titleLabel.frame)+10, 10, 80, 20);
    self.dateBtn.layer.cornerRadius=5;
    self.dateBtn.layer.borderWidth=0.5;
    self.dateBtn.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.dateBtn.layer.masksToBounds=YES;
    self.dateBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [self.dateBtn addTarget:self action:@selector(dateBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.dateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.dateBtn setTitle:[self getCurrentYear] forState:UIControlStateNormal];
     [self addSubview:self.dateBtn];
}
-(void)dateBtnClick:(UIButton*)sender{
    
}
-(CGSize)getStrlenth:(NSString*)str fontSize:(UIFont*)font{
    CGSize size= [str sizeWithAttributes:@{NSFontAttributeName: font}];
    return size;
}
-(NSString *)getCurrentYear{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy"];
    NSString *thisYearString=[dateformatter stringFromDate:senddate];
    return thisYearString;
}
@end
