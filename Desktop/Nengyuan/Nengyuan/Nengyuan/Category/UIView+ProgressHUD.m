//
//  UIView+ProgressHUD.m
//  QunChuang
//
//  Created by itrax on 2017/6/30.
//  Copyright © 2017年 itrax. All rights reserved.
//

#import "UIView+ProgressHUD.h"

@implementation UIView (ProgressHUD)
-(void)showHUDWithText:(NSString *)text
{
    [self showHUDWithText:text interval:1.0];
}

-(void)showHUDWithText:(NSString *)text interval:(NSTimeInterval)interval
{
    MBProgressHUD *tmpHUD = [MBProgressHUD showHUDAddedTo:self animated:YES];
    tmpHUD.mode = MBProgressHUDModeText;
//    tmpHUD.bezelView.color = [UIColor redColor];
    tmpHUD.bezelView.backgroundColor = ColorWithRGB(238, 238, 238);
    tmpHUD.label.text = text;
    tmpHUD.label.textColor = [UIColor blackColor];
    [tmpHUD hideAnimated:YES afterDelay:interval];
}

#pragma mark - 长时间显示
- (void)showHUDLongTimeWithText:(NSString *)text
{
    MBProgressHUD *tmpHUD = [MBProgressHUD showHUDAddedTo:self animated:YES];
    tmpHUD.mode = MBProgressHUDModeIndeterminate;
//    [tmpHUD setActivityIndicatorColor:[UIColor whiteColor]];
    tmpHUD.bezelView.color = ColorWithRGB(40, 40, 40);
    tmpHUD.activityIndicatorColor = [UIColor whiteColor];
    
//    tmpHUD.color = ColorWithRGB(88, 88, 88);
//    tmpHUD.bezelView
    
    tmpHUD.label.text = text;
    tmpHUD.label.textColor = ColorWithRGB(237, 237, 237);
}

-(void)showHUDLoading
{
     [self showHUDLongTimeWithText:@""];
}

#pragma mark - loading，自动消失
- (void)showHUDLoadingAutoHideDefaultTime
{
    [self showHUDLoadingAutoHideDefaultTimeWithDelegate:nil];
}

- (void)showHUDLoadingAutoHideDefaultTimeWithDelegate:(id)delegate
{
    MBProgressHUD *tmpHUD = [MBProgressHUD showHUDAddedTo:self animated:YES];
    tmpHUD.mode = MBProgressHUDModeIndeterminate;
    tmpHUD.bezelView.color = [UIColor blackColor];
    tmpHUD.label.text = @"";
    tmpHUD.delegate = delegate;
    [tmpHUD hideAnimated:YES afterDelay:30.0];
}

- (void)showHUDBottomWithText:(NSString *)text
{
    MBProgressHUD *tmpHUD = [MBProgressHUD showHUDAddedTo:self animated:NO];
    tmpHUD.mode = MBProgressHUDModeText;
    tmpHUD.detailsLabel.text = text;
    tmpHUD.bezelView.color = [UIColor blackColor];
    //    tmpHUD.yOffset = 0.5 * SCREEN_W;
    CGPoint offset = tmpHUD.offset;
    offset.y = 0.5 * ScreenHeight;
    tmpHUD.offset = offset;
    [tmpHUD hideAnimated:YES afterDelay:1];
}

/**
 *  长时间显示提示语
 *  带有灰色背景
 *  @param text 提示语
 */
- (void)showHUDLongTimeWithBackGroundViewWithText:(NSString *)text
{
    MBProgressHUD *tmpHUD = [MBProgressHUD showHUDAddedTo:self animated:YES];
    tmpHUD.mode = MBProgressHUDModeIndeterminate;
    tmpHUD.backgroundView.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    tmpHUD.bezelView.color = [UIColor blackColor];
    tmpHUD.label.text = text;
}

- (void)hideHUDLongTime
{
    NSEnumerator *subviewsEnum = [self.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:MBProgressHUD.class]) {
            [subview removeFromSuperview];
        }
    }
}
@end
