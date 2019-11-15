//
//  UIViewController+SuperBase.m
//  Nengyuan
//
//  Created by hui on 2019/11/13.
//  Copyright © 2019 hui. All rights reserved.
//

#import "UIViewController+SuperBase.h"
#import "NSArray+DDKit.h"
//#import <JSONKit>

@implementation UIViewController (SuperBase)

-(void)loadWhiteBackButtonFunction
{
    self.navigationController.navigationBar.barTintColor = ColorWithRGB(69, 139, 251);
    self.navigationItem.hidesBackButton = NO;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"navi_back_white"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(clickBackButtonAction:)];
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor whiteColor],
      NSFontAttributeName:[UIFont systemFontOfSize:17]};
//    [self setStatusBarBackgroundColorWithBlueColor];
    [self hiddenNavigationLine];
    
}

//设置状态栏颜色
- (void)setStatusBarBackgroundColorWithBlueColor {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = ColorWithRGB(20, 29, 67);
    }
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    // 隐藏导航栏的黑线
    [self hiddenNavigationLine];
}

// 隐藏导航栏的黑线
-(void)hiddenNavigationLine
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (!kDevice_Is_iPhoneX) {
        return;
    }
    CGRect frame = self.tabBarController.tabBar.frame;
    if (frame.origin.y < ([UIScreen mainScreen].bounds.size.height - 83)) {
        frame.origin.y = [UIScreen mainScreen].bounds.size.height - 83;
        self.tabBarController.tabBar.frame = frame;
    }
    
}

-(NSDictionary*)dictionaryWithJsonString:(NSString*)jsonString {
    
    if(jsonString ==nil) {
        return nil;
    }
    
    NSData*jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
   
    NSError*err;
    NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                       options:NSJSONReadingMutableContainers
                                                         error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
