//
//  ChartSCPieView.m
//  GGCharts
//
//  Created by 齐陈欢 on 2019/11/14.
//  Copyright © 2019 I really is a farmer. All rights reserved.
//

#import "ChartSCPieView.h"
#import "SCChart.h"
#import "PopChartView.h"
@interface ChartSCPieView()<SCChartDelegate>
{
    SCPieChart *chartView;
}
//弹出框
@property (nonatomic, strong) PopChartView *popChartView;

@property (nonatomic, strong)NSArray *titleArray;
@property (nonatomic, strong)NSArray *dataArr;
@property (nonatomic, strong)NSArray *colorArray;
@property(nonatomic,assign)CGFloat totalNum;
@property(nonatomic,copy)NSString *danwei;
@end
@implementation ChartSCPieView
- (instancetype)initWithFrame:(CGRect)frame{
    self= [super initWithFrame:frame];
    if (self) {
        
        
        self.backgroundColor=[UIColor groupTableViewBackgroundColor];
        
        
    }
    return self;
}

/// 饼状图
-(void)passTheTime:(NSString *)time andTitle:(NSString *)title  withData:(NSArray *)Data withtitleArr:(NSArray *)titles  andColors:(NSArray *)colors andDanwei:(NSString*)danwei{
    if (chartView) {
        [chartView removeFromSuperview];
        chartView = nil;
    }
    self.danwei=danwei;
    self.dataArr = @[@310, @1548, @234, @335, @735, @235];
    self.titleArray = @[@"燃煤发电", @"燃气发电", @"水电", @"光伏", @"风电", @"生物质发电"];
    //NSArray * dataArray = @[@6610, @252, @408, @1006, @543,@71];
    //"#4474A4","#E7AE01","#89A751","#92D14F","#00B64D","#2177D1"
    self.colorArray = @[@"#4474A4",@"#E7AE01",@"#89A751",@"#92D14F",@"#00B64D",@"#2177D1"];
    
   
    NSMutableArray *itemsArr=[NSMutableArray array ];
    for (int i=0; i<self.dataArr.count; i++) {
        self.totalNum+=[self.dataArr[i]floatValue];
        [itemsArr addObject:[SCPieChartDataItem dataItemWithValue:[self.dataArr[i]floatValue] color:[self colorWithHexStr:self.colorArray[i]] description:self.titleArray[i]]];
    }
    
//    NSArray *items = @[[SCPieChartDataItem dataItemWithValue:10 color:SCRed description:@"A"],
//                       [SCPieChartDataItem dataItemWithValue:20 color:SCBlue description:@"B"],
//                       [SCPieChartDataItem dataItemWithValue:40 color:SCGreen description:@"C"],
//                       ];
    chartView = [[SCPieChart alloc] initWithFrame:CGRectMake(20, 100,200, 200) items:itemsArr];
    chartView.duration=0;
    chartView.descriptionTextColor = [UIColor whiteColor];
    chartView.descriptionTextFont  = [UIFont systemFontOfSize:13];//[UIFont fontWithName:@"Avenir-Medium" size:13.0];
    chartView.delegate=self;
    [chartView strokeChart];
    [self addSubview:chartView];
    
    for (int i=self.titleArray.count-1; i>=0; i--) {
        UIView *smlView=[[UIView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-140, 280-(25*(i)), 15, 15)];
        [self addSubview:smlView];
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-120, 280-(25*(i)), 100, 15)];
         label.font=[UIFont systemFontOfSize:13];
        [self addSubview:label];
        smlView.backgroundColor=[self colorWithHexStr:[self.colorArray objectAtIndex:i]];
        label.text=[NSString stringWithFormat:@"%@ %.1f%%",self.titleArray[i],([self.dataArr[i] floatValue]*100)/self.totalNum];
        
    }
}
- (void)userClickedOnPieIndexItem:(NSInteger)pieIndex{
    //CGRectMake([UIScreen mainScreen].bounds.size.width<450?([UIScreen mainScreen].bounds.size.width-220):250,  200, 200, 60)
    
    if (!_popChartView) {
        _popChartView=[[PopChartView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width<450?([UIScreen mainScreen].bounds.size.width-220):250, 200, 200, 2*20)];
        
        _popChartView.backgroundColor=[UIColor darkGrayColor];
   }
//else{
//        _popChartView.frame=CGRectMake(x<150?0:x-150,  0, 200, 5*20);
//    }
    // title isHide color isYuanxing 需要的字段
    
    
    
    NSDictionary *dic1=@{@"title":@"全省统计 1221万吨 80.9%",@"isHide":@"1",@"color":@"#0000FF",@"isYuanxing":@"0"};
     self.popChartView.dataArr=[NSMutableArray arrayWithArray:@[dic1]];
    self.popChartView.timeStr=@"2019-09";
    [_popChartView updateAllData];
    [self addSubview:_popChartView];
    
    
//    self.label1.text=@"2019年10月";
//    self.label2.text=[NSString stringWithFormat:@"%@ %@%@ %.1f%%",self.titleArray[pieIndex],self.dataArr[pieIndex], self.danwei,([self.dataArr[pieIndex]floatValue]*100)/self.totalNum];
//    //        CGRect rect = [_label2.text boundingRectWithSize:CGSizeMake(140, 40) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:_label2.font} context:nil];
//    //
//    //        _label2.frame = CGRectMake(_label2.frame.origin.x, _label2.frame.origin.y, rect.size.width, rect.size.height);
//    [self addSubview:_popView];
   
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
 
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_popChartView) {
        [_popChartView removeFromSuperview];
      // [chartView strokeChart];
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
