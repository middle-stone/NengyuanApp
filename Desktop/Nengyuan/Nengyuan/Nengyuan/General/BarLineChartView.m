//
//  BarLineChartView.m
//  demo
//
//  Created by hui on 2019/11/12.
//  Copyright © 2019 hui. All rights reserved.
//

#import "BarLineChartView.h"
//#import "Masonry/Masonry.h"
@interface BarLineChartView()

@property (nonatomic, strong) CAShapeLayer *lineChartLayer;

/** 渐变背景视图 */
@property (nonatomic, strong) UIView *gradientBackgroundView;
/** 渐变图层 */
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
/** 颜色数组 */
@property (nonatomic, strong) NSMutableArray *gradientLayerColors;
/** 虚线 */
@property (nonatomic, strong) CAShapeLayer * dashLayer;
@property (nonatomic, assign) NSInteger Ylines;           // 右侧y轴的行数
@property (nonatomic, assign) NSInteger lineMultiple;     // 折线倍数
@property (nonatomic,assign) CGFloat barWith; // 柱状图的宽度
@end

@implementation BarLineChartView
static CGFloat bounceX = 20;
static CGFloat bounceY = 20;
static NSInteger countq = 0;
static CGFloat marge = 15; // 调整间距

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame withYLines:(NSInteger)ylines withMutiple:(NSInteger)mutiple withRightYlines:(NSInteger)rightLines withRightMut:(NSInteger)rightMut{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.lineMultiple = rightMut;
        self.Ylines = rightLines;
        [self createLabelY:ylines multiple:mutiple];
//        [self createRightLabelY:rightLines multiple:rightMut];
        [self setLineDashWithYines:ylines];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    /*******画出坐标轴********/
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.5);
    CGContextSetRGBStrokeColor(context, 100.0/255.0, 100.0/255.0, 100.0/255.0, 0.5);
    CGContextMoveToPoint(context, bounceX + marge, bounceY/2);
    CGContextAddLineToPoint(context, bounceX + marge, rect.size.height - bounceY);
    CGContextAddLineToPoint(context,rect.size.width -  2*bounceX, rect.size.height - bounceY);
    if (self.isShowLine) {
        CGContextMoveToPoint(context, rect.size.width -  2*bounceX, rect.size.height - bounceY);
        CGContextAddLineToPoint(context, rect.size.width -  2*bounceX, bounceY/2);
    }
    CGContextStrokePath(context);

    
}

#pragma mark 添加虚线
- (void)setLineDashWithYines:(CGFloat)ylines{
    
    self.gradientBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(bounceX + marge, bounceY, self.bounds.size.width - bounceX*2, self.bounds.size.height - 2*bounceY)];
    [self addSubview:self.gradientBackgroundView];
    
    for (NSInteger i = 0;i < ylines; i++ ) {
        CAShapeLayer * dashLayer = [CAShapeLayer layer];
        dashLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        dashLayer.fillColor = [[UIColor lightGrayColor] CGColor];
        // 默认设置路径宽度为0，使其在起始状态下不显示
        dashLayer.lineWidth = 1;
        
        // 数组里第一个数字是虚线的长度,第二个参数是虚线的间隔
        dashLayer.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:0], nil];
        
        UILabel * label1 = (UILabel*)[self viewWithTag:2000 + i];
        label1.alpha = 1;
        UIBezierPath * path = [[UIBezierPath alloc]init];
        path.lineWidth = 1.0;
        [path moveToPoint:CGPointMake( 0, label1.frame.origin.y - bounceY * 0.75)];
        [path addLineToPoint:CGPointMake(self.bounds.size.width - 3*bounceX - marge,label1.frame.origin.y - bounceY* 0.75)];
        CGFloat dash[] = {10,10};
        [path setLineDash:dash count:2 phase:10];
        [path stroke];
        dashLayer.path = path.CGPath;
        [self.gradientBackgroundView.layer addSublayer:dashLayer];
    }
}

#pragma mark 创建左侧y轴数据
- (void)createLabelY:(CGFloat)ylines multiple:(NSInteger)mutiple
{
    for (NSInteger i = 0; i < ylines+1; i++) {
        UILabel * labelYdivision = [[UILabel alloc]initWithFrame:CGRectMake(5, (self.frame.size.height - 2 * bounceY)/ylines *i + 0.75 * bounceX , bounceY + 10 , bounceY/2.0)];
        labelYdivision.tag = 2000 + i;
        labelYdivision.textAlignment = NSTextAlignmentRight;
        NSNumber *YtextNum = [NSNumber numberWithInteger:(ylines - i)*mutiple];
        labelYdivision.text = [NSString stringWithFormat:@"%@",YtextNum];
        labelYdivision.font = [UIFont systemFontOfSize:12];
        labelYdivision.textColor = [UIColor blackColor];
        [self addSubview:labelYdivision];
    }
}
#pragma mark 创建右侧y轴数据
- (void)createRightLabelY:(CGFloat)ylines multiple:(NSInteger)mutiple
{
    for (NSInteger i = 0; i < ylines + 1; i++) {
        UILabel * labelYdivision = [[UILabel alloc]initWithFrame:CGRectMake(self.bounds.size.width - 2*bounceX + 3, self.bounds.size.height -(bounceY*1.25 + (self.bounds.size.height - 2*bounceY)/ylines*i ),bounceY + 12 , bounceY/2.0)];
        labelYdivision.textAlignment = NSTextAlignmentLeft;
        labelYdivision.text = [NSString stringWithFormat:@"%ld",i*mutiple];
        labelYdivision.font = [UIFont systemFontOfSize:12];
        labelYdivision.textColor = [UIColor blackColor];
        [self addSubview:labelYdivision];
    }
}

#pragma mark 创建x轴的数据
- (void)createLabelXWithXdataArray:(NSMutableArray *)dataArray{
    NSInteger count = dataArray.count;
    NSNumber *countNum = [NSNumber numberWithInteger:count];
    CGFloat width = (self.bounds.size.width - 80 )/[countNum floatValue] / 2.0;
    for (NSInteger i = 0; i < count ; i++) {
        UILabel *xLabel = [[UILabel alloc]init];
        xLabel.tag = 1000 + i;
        xLabel.font = [UIFont systemFontOfSize:10];
        xLabel.textColor = [UIColor blackColor];
        xLabel.transform = CGAffineTransformMakeRotation(-M_PI_2);
        xLabel.text = [NSString stringWithFormat:@"%@",dataArray[i]];
        [self addSubview:xLabel];
        CGFloat pointx = 28 + 2 * width * i;
        [xLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(pointx);
            make.bottom.equalTo(self.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(35,15));
        }];
        
    }
}

#pragma mark -- 画柱状图
- (void)drawBarChartViewWithData:(NSMutableArray *)barData withPercent:(NSMutableArray *)percentArr{
    NSInteger count = barData.count;
    NSNumber *countNum = [NSNumber numberWithInteger:count];
    CGFloat width = (self.bounds.size.width - 80 )/[countNum floatValue] / 2.0;
    self.barWith = width;
    for (int i = 0; i < barData.count; i++) {
        UIView *bgview = [[UIView alloc]init];
        bgview.backgroundColor = [UIColor clearColor];
        bgview.tag = 100 + i;
        [self addSubview:bgview];
        [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(40 + 2*width*i);
            make.bottom.equalTo(self.mas_bottom).offset(-20);
            make.size.mas_equalTo(CGSizeMake(width, self.bounds.size.height - 40));
        }];
        bgview.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tagClick:)];
        [bgview addGestureRecognizer:tap];
        NSArray *colorArray = @[ColorWithRGB(85, 141, 214),ColorWithRGB(255, 213, 4),ColorWithRGB(171, 204, 100),ColorWithRGB(76, 173, 229)];


        float lastPercent = 0;    // 线的初始位置的百分比
        float lastEndPercent = 0; // 线的结束时的百分比
        for (int j = 0; j <percentArr.count; j++) {
            NSString *percentStr;
          
            switch (j) {
                case 0:
                    lastPercent = 0;
                     percentStr = percentArr[j][i];
                    lastEndPercent = percentStr.floatValue;
                    break;
                case 1:
                    percentStr = percentArr[j - 1][i];
                    lastPercent = lastPercent + percentStr.floatValue;
                    
                    percentStr = percentArr[j][i];
                    lastEndPercent = lastEndPercent + percentStr.floatValue;
                    break;
                case 2:{
                    NSString *secondStr = percentArr[j - 1][i];
                    float secondCount = secondStr.floatValue;
                    lastPercent = lastPercent + secondCount;
                    
                    percentStr = percentArr[j][i];
                    lastEndPercent =lastEndPercent + percentStr.floatValue;
                    break;
                }
                case 3:{
                    NSString *thirdStr = percentArr[j - 1][i];
                    float thirdCount = thirdStr.floatValue;
                    lastPercent = lastPercent + thirdCount;
                    
                    percentStr = percentArr[j][i];
                    lastEndPercent =lastEndPercent + percentStr.floatValue;
                    break;
                }
                default:
                    break;
            }
            UIBezierPath *linePath = [[UIBezierPath alloc]init];
            [linePath moveToPoint:CGPointMake(width + 2*width*i, lastPercent *(self.bounds.size.height - 45) + 5)];
            CAShapeLayer *layer = [CAShapeLayer new];
            layer.strokeColor = ((UIColor *)colorArray[j]).CGColor;
            layer.fillColor = [UIColor clearColor].CGColor;
            layer.lineCap = kCALineCapSquare;
            layer.lineJoin = kCALineJoinBevel;
            layer.lineWidth = width;
            [linePath addLineToPoint:CGPointMake(width + 2*width*i,(self.bounds.size.height - 45) * lastEndPercent)];
            layer.path = linePath.CGPath;
            [self.gradientBackgroundView.layer addSublayer:layer];
        }
        
    }
    
}

#pragma mark -- 画折线图
-(void)drawLineChartWithData:(NSMutableArray *)lineData
{
    // y轴的最大值
    CGFloat maxNum = [NSString stringWithFormat:@"%.0ld", self.Ylines * self.lineMultiple].floatValue;
    CGFloat firstPointX = 40 + self.barWith/2.0;
    NSInteger count = lineData.count;
    NSNumber *countNum = [NSNumber numberWithInteger:count];
    CGFloat width = (self.bounds.size.width - 80 )/[countNum floatValue] / 2.0;
    CGFloat firstPointY = (maxNum - [lineData[0] floatValue])/maxNum *(self.bounds.size.height - bounceY);
    UIBezierPath * path = [[UIBezierPath alloc]init];
    path.lineWidth = 2.0;
    [path moveToPoint:CGPointMake(firstPointX - 3*width, firstPointY)];
 
    if (lineData.count) {

        for (NSInteger i = 0; i < lineData.count; i++) {
            CGFloat pointX = firstPointX + 2*width*i;
            CGFloat pointY = (maxNum - [lineData[i] floatValue])/maxNum *(self.bounds.size.height - bounceY);
            [path addLineToPoint:CGPointMake(pointX - 3*width, pointY)];
        }
     
        self.lineChartLayer = [CAShapeLayer layer];
        self.lineChartLayer.strokeColor = [UIColor redColor].CGColor;
        self.lineChartLayer.fillColor = [[UIColor clearColor] CGColor];
        self.lineChartLayer.lineCap = kCALineCapSquare;
        self.lineChartLayer.lineJoin = kCALineJoinMiter;
        self.lineChartLayer.lineWidth = 2;
        [self.gradientBackgroundView.layer addSublayer:self.lineChartLayer];//直接添加导视图上
        self.lineChartLayer.path = path.CGPath;
        
        for (NSInteger i = 0; i <lineData.count; i++) {
            CGFloat pointX = firstPointX + 2*width*i;
            CGFloat pointY = (maxNum - [lineData[i] floatValue])/maxNum *(self.bounds.size.height - bounceY);
            CAShapeLayer *layer = [CAShapeLayer new];
            //圆环的颜色
            layer.strokeColor = [UIColor redColor].CGColor;
            //背景填充色
            layer.fillColor = [[UIColor whiteColor] CGColor];
            layer.lineCap = kCALineCapSquare;
            layer.lineJoin = kCALineJoinMiter;
            layer.lineWidth = 1;
            UIBezierPath *roundPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(pointX - 3*width, pointY) radius:2.5 startAngle:0 endAngle:2*M_PI clockwise:true];
            layer.path = [roundPath CGPath];
            [self.gradientBackgroundView.layer addSublayer:layer];
        }
    }
    
}

- (void)tagClick:(UITapGestureRecognizer *)recog {
    
    UITapGestureRecognizer *singleTap = (UITapGestureRecognizer *)recog;
    NSLog(@"%ld",[singleTap view].tag);
    
}

- (void)reloadData{
    [self createLabelXWithXdataArray:self.xdataArr];
    [self drawBarChartViewWithData:self.barDataArr withPercent:self.barPercentArr];
    if (self.isShowLine && self.lineDataArr.count) {
        [self createRightLabelY:self.Ylines multiple:self.lineMultiple];
        [self drawLineChartWithData:self.lineDataArr];
    }

   
}

- (NSMutableArray *)barDataArr {
    if (!_barDataArr) {
        _barDataArr = [[NSMutableArray alloc]init];
    }
    return _barDataArr;
}

- (NSMutableArray *)lineDataArr {
    if (!_lineDataArr) {
        _lineDataArr = [[NSMutableArray alloc]init];
    }
    return _lineDataArr;
}

@end
