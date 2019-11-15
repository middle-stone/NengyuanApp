//
//  ChartLeftOneZhu.m
//  GGCharts
//
//  Created by 齐陈欢 on 2019/11/14.
//  Copyright © 2019 I really is a farmer. All rights reserved.
//

#import "ChartLeftOneZhu.h"
#import "LineBarChart.h"
#import "PopChartView.h"
@interface ChartLeftOneZhu()<UIGestureRecognizerDelegate>

//弹出框
@property (nonatomic, strong) PopChartView *popChartView;
 

@property (nonatomic, strong)LineBarChart*lineBarChart;
@property (nonatomic, strong) BarData * barData;
@property (nonatomic, strong) LineData * lineData;

//示意图view
@property (nonatomic, strong)UILabel *leftSmallL;
@property (nonatomic, strong)UILabel *rightSmallL;
@property (nonatomic, strong)UIView *leftSmallV;
@property (nonatomic, strong)UIView *rightSmallV;

////需要传输的数据
@property(nonatomic,strong)NSMutableArray *xData;
@property(nonatomic,strong)NSMutableArray *leftData;
@property(nonatomic,strong)NSMutableArray *rightData;
@property (nonatomic, copy)NSString * leftColor;
@property (nonatomic, copy)NSString * rightColor;
@property (nonatomic, copy)NSString * timeStr;//年月
@property (nonatomic, copy)NSString * leftTitle;//柱状图标题
@property (nonatomic, copy)NSString * rightTitle;//折线图标题
@property (nonatomic, assign)CGFloat lMax;
@property (nonatomic, assign)CGFloat lMin;
@property (nonatomic, assign)CGFloat rMax;
@property (nonatomic, assign)CGFloat rMin;
//Y轴需要显示的个数
@property (nonatomic, assign)NSInteger yCount;

//单位
@property (nonatomic, strong)UILabel *danweiL;
@end
@implementation ChartLeftOneZhu
- (instancetype)initWithFrame:(CGRect)frame{
    self= [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [self creatViews];
    }
    return self;
}
-(void)passTheTime:(NSString *)time andLeftTitle:(NSString *)leftTitle  withLeftData:(NSArray *)leftData withLMax:(CGFloat)lmax withLMin:(CGFloat)lmin andRightTitle:(NSString *)rightTitle withRightData:(NSArray *)rightData withRMax:(CGFloat)rmax withRMin:(CGFloat)rmin andYCount:(NSInteger)yCount andLeftColor:(NSString *)leftColor andRighttColor:(NSString *)rightColor andDanwei:(NSString *)danwei{
    self.timeStr=@"2019年";
    self.leftTitle=@"全省合计";
    self.rightTitle=@"当月环比";
    self.lMax=1000;
    self.lMin=0;
    self.rMax=0.14;
    self.rMin=-0.14;
    self.yCount=5;
    self.leftColor=@"#22528F";
    self.rightColor=@"#92C87A";
    
    self.xData=[NSMutableArray arrayWithArray:@[@"10月", @"11月", @"12月", @"1月", @"2月", @"3月", @"4月", @"5月", @"6月", @"7月", @"8月", @"9月"]];
    self.leftData=[NSMutableArray arrayWithArray:@[@870, @860, @850, @855, @800, @900, @920, @890, @880, @800, @880, @920]];
    self.rightData=[NSMutableArray arrayWithArray:@[@0.086, @-0.027999999999999997, @-0.006999999999999999, @0.013000000000000001, @-0.023, @-0.018000000000000002, @0.06, @-0.042, @-0.05, @0, @-0.1, @0.1]];
    
    // self.rightData=@[@-0.006999999999999999, @0.013000000000000001, @-0.023,@0.086, @-0.027999999999999997,  @-0.018000000000000002, @0.06, @-0.042, @-0.05, @0, @-0.1, @0.1];
    _barData = [[BarData alloc] init];
    _barData.dataAry = self.leftData;
    _barData.barWidth = 10;
    _barData.barFillColor =self.leftColor.length?[self colorWithHexStr:self.leftColor ]:[UIColor blueColor];
    
    
    _lineData = [[LineData alloc] init];
    _lineData.lineColor = self.rightColor.length?[self colorWithHexStr:self.rightColor ]:[UIColor greenColor];;
    _lineData.scalerMode = ScalerAxisRight;
    _lineData.shapeRadius = 3;
    _lineData.lineWidth=3;
    _lineData.dataAry = self.rightData;
    
    LineBarDataSet * lineBarSet = [[LineBarDataSet alloc] init];
    lineBarSet.lineBarMode=LineBarDrawParallel;
    lineBarSet.insets = UIEdgeInsetsMake(30, 40, 30, 40);
//    lineBarSet.lineAry = @[_lineData];
    lineBarSet.barAry = @[_barData];
    lineBarSet.updateNeedAnimation = YES;
    //里面的横线颜色
    lineBarSet.gridConfig.lineColor =[UIColor lightGrayColor];
    lineBarSet.gridConfig.lineWidth = .5f;
    lineBarSet.gridConfig.axisLineColor = [UIColor redColor];
    //横纵坐标文字颜色
    lineBarSet.gridConfig.axisLableColor = [UIColor blackColor];
    lineBarSet.gridConfig.axisLableFont=[UIFont systemFontOfSize:13];
    lineBarSet.gridConfig.bottomLableAxis.lables =self.xData;
    
    lineBarSet.gridConfig.bottomLableAxis.drawStringAxisCenter = YES;
    lineBarSet.gridConfig.bottomLableAxis.showSplitLine = NO;//是否显示网格线
    lineBarSet.gridConfig.bottomLableAxis.over = 2;
    lineBarSet.gridConfig.bottomLableAxis.showQueryLable = YES;
    
    
    lineBarSet.gridConfig.leftNumberAxis.splitCount = self.yCount;
    lineBarSet.gridConfig.leftNumberAxis.max=[NSNumber numberWithFloat: self.lMax];
    lineBarSet.gridConfig.leftNumberAxis.min=[NSNumber numberWithFloat: self.lMin];
    lineBarSet.gridConfig.leftNumberAxis.dataFormatter = @"%.0f";
    lineBarSet.gridConfig.leftNumberAxis.showSplitLine = YES;
    lineBarSet.gridConfig.leftNumberAxis.showQueryLable = YES;
    
       _lineBarChart.lineBarDataSet = lineBarSet;
    
    [self.lineBarChart drawLineBarChart];
    self.leftSmallV.backgroundColor=self.leftColor.length?[self colorWithHexStr:self.leftColor ]:[UIColor blueColor];
    self.leftSmallL.text=self.leftTitle;
    _danweiL.text=danwei.length?[NSString stringWithFormat:@"单位: %@",danwei]:@"" ;
   
}
-(void)creatViews{
    
    
    
    
    
    
    
    //柱状图和折线图
    [self zhuzhuangzhexian];
    
    
}
-(void)zhuzhuangzhexian{
    
    
    _danweiL=[[UILabel alloc]initWithFrame:CGRectMake(self.bounds.size.width-100, 60, 100, 20)];
    _danweiL.font=[UIFont systemFontOfSize:15];
    [self addSubview:_danweiL];
    
    
    // LineBar Demo 1
    _lineBarChart = [[LineBarChart alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 200)];
    
    [self addSubview:_lineBarChart];
    //创建下方提示
    
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapPoint:)];
    [_lineBarChart addGestureRecognizer:tap];
 
    //[_lineBarChart drawLineBarChart];
    
    [_lineBarChart startLineAnimationsWithType:LineAnimationRiseType duration:.8f];
    [_lineBarChart startBarAnimationsWithType:BarAnimationRiseType duration:.8f];
    CALayer*leftLineLayer=[CALayer layer];
    leftLineLayer.backgroundColor=[[UIColor blackColor]CGColor];
    leftLineLayer.frame=CGRectMake(37, 20,1,_lineBarChart.gg_height-50);
    [_lineBarChart.layer addSublayer:leftLineLayer];
    
    CALayer*bootomLineLayer=[CALayer layer];
    bootomLineLayer.backgroundColor=[[UIColor blackColor]CGColor];
    bootomLineLayer.frame=CGRectMake(37, _lineBarChart.gg_height-30,_lineBarChart.gg_width-74,1);
    [_lineBarChart.layer addSublayer:bootomLineLayer];
    
    
    
    _leftSmallL=[[UILabel alloc]initWithFrame:CGRectMake((self.bounds.size.width/2)-40, 310, 80, 15)];
    _leftSmallL.textColor=[UIColor blackColor];
    _leftSmallL.font=[UIFont systemFontOfSize:13];
    [self addSubview:_leftSmallL];
    
    _leftSmallV=[[UIView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_leftSmallL.frame)-15, 312.5, 10, 10)];
    _leftSmallV.backgroundColor=[UIColor clearColor];
    [self addSubview:_leftSmallV];
    
    
    
}
/**
 
 * @param point 视图响应的点
 */
- (void)tapPoint:(UITapGestureRecognizer*)tap{
    //取得所点击的点的坐标
    CGPoint point = [tap locationInView:self];
    
    
    // 判断该点在不在区域内
    // CGRect rect=self.lineBarChart.frame;
    if (CGRectContainsPoint(self.lineBarChart.frame, point)) {
        NSLog(@"");
        //计算出位置CGRectMake(45, 240,_lineBarChart.gg_width-80,1);
        CGFloat oneWidth=(self.lineBarChart.gg_width-74)/self.xData.count;
        NSInteger index=(point.x-37)/oneWidth;
        NSLog(@"在第：%ld个",index);
        [self showPopViewinLineBarChart:self.lineBarChart withXpoint:point.x andIndex:index];
    }else{NSLog(@"不在");}
    
}
-(void)showPopViewinLineBarChart:(LineBarChart *)lineBarChart  withXpoint:(CGFloat)x andIndex:(NSInteger)index{
    
    if (!_popChartView) {
        _popChartView=[[PopChartView alloc]initWithFrame:CGRectMake(x<150?0:x-150, 0, 200, 5*20) ];
        _popChartView.backgroundColor=[UIColor darkGrayColor];
    } else{
        _popChartView.frame=CGRectMake(x<150?0:x-150,  0, 200, 5*20);
    }
    // title isHide color isYuanxing 需要的字段
    
    
    
    NSDictionary *dic1=@{@"title":@"全省统计 1221万吨",@"isHide":@"0",@"color":@"#0000FF",@"isYuanxing":@"0"};
    NSDictionary *dic2=@{@"title":@"当月环比 8.6%",@"isHide":@"0",@"color":@"#FF1493",@"isYuanxing":@"1"};
    NSDictionary *dic3=@{@"title":@"累计统计 28191万吨",@"isHide":@"1",@"color":@"",@"isYuanxing":@""};
    NSDictionary *dic4=@{@"title":@"当月环比 8.9%",@"isHide":@"1",@"color":@"",@"isYuanxing":@""};
    self.popChartView.dataArr=[NSMutableArray arrayWithArray:@[dic1,dic2,dic3,dic4]];
    self.popChartView.timeStr=@"2019-09";
    [_popChartView updateAllData];
    [lineBarChart addSubview:_popChartView];
    NSLog(@"%ld",index);
//    _label2.text=[NSString stringWithFormat:@"%@ %@万吨", self.leftTitle,[self.leftData objectAtIndex:index]];
//    _label3.text=[NSString stringWithFormat:@"%@  %.2f%%", self.rightTitle,[[self.rightData objectAtIndex:index]floatValue]*100];
//    _label4.text=[NSString stringWithFormat:@"%@ %@万吨", self.leftTitle,[self.leftData objectAtIndex:index]];
//    _label5.text=[NSString stringWithFormat:@"%@  %.2f%%", self.rightTitle,[[self.rightData objectAtIndex:index]floatValue]*100];
    
    
   
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_popChartView) {
        [_popChartView removeFromSuperview];
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
- (NSMutableArray *)xData{
    if (!_xData) {
        _xData=[NSMutableArray array ];
    }
    return _xData;
}
- (NSMutableArray *)leftData{
    if (!_leftData) {
        _leftData=[NSMutableArray array ];
    }
    return _leftData;
}
- (NSMutableArray *)rightData{
    if (!_rightData) {
        _rightData=[NSMutableArray array ];
    }
    return _rightData;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
