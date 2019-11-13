//
//  GJMultipleMarkViewController.m
//  ztp2p
//
//  Created by Geselle_Joy on 16/11/11.
//  Copyright © 2016年 郑投网. All rights reserved.
//

#import "GJMultipleMarkViewController.h"

@interface GJMultipleMarkViewController ()<UIScrollViewDelegate>


@end



@implementation GJMultipleMarkViewController

- (void)viewDidLoad {
//    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
//    [self setupNavigationBar];
}

- (void)setupUIWithChildViewControllers:(NSArray *)childViewControllerArray andTitles:(NSArray *)titleLabelArray {
    
    for (int i = 0; i < childViewControllerArray.count; i++) {
        [self addChildViewController:childViewControllerArray[i]];
    }
    
    self.titlesArr = titleLabelArray;
    
    /** 添加文字标签scrollView */
    [self setTitleScrollView];
    
    /** 添加控制器scrollView  */
    [self setContentScrollView];
    
    /** 设置标签按钮 文字 背景图  */
    [self setupTitleWithItemNumber:self.titlesArr.count];
    
    self.contentScrollView.contentSize = CGSizeMake(self.titlesArr.count * ScreenWidth, 0);
    self.contentScrollView.bounces = NO;
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.showsHorizontalScrollIndicator  = NO;
    self.contentScrollView.delegate = self;
}

- (void)setTitleScrollView {
    CGRect rect  = CGRectMake(0, NavHeight + 50, ScreenWidth, titleH);
    self.titleScrollView = [[UIScrollView alloc] initWithFrame:rect];
    [self.view addSubview:self.titleScrollView];
}
- (void)setContentScrollView {
    
    CGFloat y  = CGRectGetMaxY(self.titleScrollView.frame);
    CGRect rect  = CGRectMake(0, y, ScreenWidth, ScreenHeight - titleH - 64);
    self.contentScrollView = [[UIScrollView alloc] initWithFrame:rect];
    [self.view addSubview:self.contentScrollView];
}

- (void)setupTitleWithItemNumber:(NSInteger)num {
    CGFloat x = 0;
    CGFloat w = ScreenWidth/num;
//    CGFloat h = titleH - 1;
    CGFloat h = 15;
    CGFloat imgH = titleH - h - 15;
    self.sliderView  = [[UIView alloc] initWithFrame:CGRectMake(0, titleH - 3, ScreenWidth/num, 3)];
    self.sliderView.backgroundColor = blueColor_one_level;
    self.sliderView.userInteractionEnabled = YES;
    
    for (int i = 0; i < num; i++)
    {
        x = i * w;
        
        // 添加图片
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(x, 5, w, imgH)];
        img.contentMode = UIViewContentModeScaleAspectFit;
        img.image = [UIImage imageNamed:@"testImg"];
        [self.titleScrollView addSubview:img];
        
        // 添加标题
        CGRect titleRect = CGRectMake(x, imgH + 10, w, h);
        UILabel *titleL = [[UILabel alloc]initWithFrame:titleRect];
        titleL.text = self.titlesArr[i];
        titleL.font = [UIFont systemFontOfSize:15];
        titleL.textAlignment = NSTextAlignmentCenter;
        [self.titleScrollView addSubview:titleL];
        
        // 添加按钮
        CGRect rect = CGRectMake(x, 0, w, titleH);
        UIButton *btn = [[UIButton alloc] initWithFrame:rect];
        btn.tag = i;
//        [btn setTitle:self.titlesArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:WordColor_two_level forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
//        btn.backgroundColor = ColorWithRGB(248, 248, 248);
        
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
        
        [self.buttons addObject:btn];
        [self.titleScrollView addSubview:btn];
        
        
        if (i == 0)
        {
            [self click:btn];
        }
        
    }
    self.titleScrollView.contentSize = CGSizeMake(num * w, 0);
    self.titleScrollView.showsHorizontalScrollIndicator = NO;
    self.titleScrollView.backgroundColor = ColorWithRGBA(248, 248, 248, 1);
    [self.titleScrollView addSubview:self.sliderView];
    
}

/**
 *  选中btn产生的效果
 *
 */
- (void)click:(UIButton *)sender {
    
    [self selectTitleBtn:sender];
    NSInteger i = sender.tag;
    CGFloat x  = i * ScreenWidth;
    self.contentScrollView.contentOffset = CGPointMake(x, 0);
    
    [self setUpOneChildController:i];
}
/**
 *  选中btn产生的效果
 *
 */
- (void)clicked:(NSInteger)tag{
    
    NSInteger i = tag;
    CGFloat x  = i * ScreenWidth;
    self.contentScrollView.contentOffset = CGPointMake(x, 0);
    
    [self setUpOneChildController:i];
}

/**
 *  选中的btn变黄色，其他灰色
 *
 *  @param btn
 */
- (void)selectTitleBtn:(UIButton *)btn {
    
    [self.selectedBtn setTitleColor:WordColor_two_level forState:UIControlStateNormal];
    self.selectedBtn.transform = CGAffineTransformIdentity;
    
    [btn setTitleColor:blueColor_one_level forState:UIControlStateNormal];
    btn.transform = CGAffineTransformMakeScale(MaxScale, MaxScale);
    self.selectedBtn = btn;
    
    [self setupTitleCenter:btn];
}

/**
 *  设置button一直显示在中间（btn的总长度大于屏幕长度）
 *
 *  @param sender
 */
- (void)setupTitleCenter:(UIButton *)sender
{
    
    CGFloat offset = sender.center.x - ScreenWidth * 0.5;
    if (offset < 0) {
        offset = 0;
    }
    CGFloat maxOffset  = self.titleScrollView.contentSize.width - ScreenWidth;
    if (offset > maxOffset) {
        offset = maxOffset;
    }
    [self.titleScrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
}


- (void)setUpOneChildController:(NSInteger)index {
    _index = index;
    CGFloat x = index * ScreenWidth;
    UIViewController *vc = self.childViewControllers[index];
     [self controllerIndex:index];
    if (vc.view.superview) {
        return;
    }
    // 只会走一次
    vc.view.frame = CGRectMake(x, 0, ScreenWidth, ScreenHeight - self.contentScrollView.frame.origin.y);
    [self.contentScrollView addSubview:vc.view];
}

-(void)controllerIndex:(NSInteger)index
{
    
}

#pragma mark - UIScrollView  delegate

/**
 *  滑动结束
 *
 *  @param scrollView
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger i  = self.contentScrollView.contentOffset.x / ScreenWidth;
    _index = i;
    [self selectTitleBtn:self.buttons[i]];
    [self setUpOneChildController:i];
}

/**
 *  滑动中
 *
 *  @param scrollView
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX  = scrollView.contentOffset.x;
    NSInteger leftIndex  = offsetX / ScreenWidth;
    NSInteger rightIdex  = leftIndex + 1;
    
    UIButton *leftButton = self.buttons[leftIndex];
    UIButton *rightButton  = nil;
    if (rightIdex < self.buttons.count) {
        rightButton  = self.buttons[rightIdex];
    }
    CGFloat scaleR  = offsetX / ScreenWidth - leftIndex;
    CGFloat scaleL  = 1 - scaleR;
    CGFloat transScale = MaxScale - 1;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.sliderView.transform  = CGAffineTransformMakeTranslation((offsetX*(self.titleScrollView.contentSize.width / self.contentScrollView.contentSize.width)), 0);
    }];
    
    leftButton.transform = CGAffineTransformMakeScale(scaleL * transScale + 1, scaleL * transScale + 1);
    rightButton.transform = CGAffineTransformMakeScale(scaleR * transScale + 1, scaleR * transScale + 1);
}

#pragma mark - event response

#pragma mark - getters and setters

- (NSMutableArray *)buttons
{
    if (_buttons == nil)
    {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
