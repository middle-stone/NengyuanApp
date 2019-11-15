//
//  MeiTanViewController.m
//  Nengyuan
//
//  Created by 齐陈欢 on 2019/11/15.
//  Copyright © 2019 hui. All rights reserved.
//

#import "MeiTanViewController.h"

#import "MTProductViewController.h"
#import "MTElectricitycoalViewController.h"

@interface MeiTanViewController ()

@end
@implementation MeiTanViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title=@"煤炭";
    [self getData];
   
}


-(void)getData{
    MTProductViewController *vc1 = [[MTProductViewController alloc]init];
    MTElectricitycoalViewController *vc2 = [[MTElectricitycoalViewController alloc]init];
//    [[NetDataEngine sharedInstance]requsetGetUrl:@"" parameters:nil success:^(id responsData) {
//               NSString *jsonString =  [[NSString alloc]initWithData: responsData encoding:NSUTF8StringEncoding];
//        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
//            NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
//        NSArray *data=jsonDic[@"data"];
//        for (int i=0; i<data.count; i++) {
//            NSDictionary *dic=data[i];
//
//            ModularTypeModel *model=[ModularTypeModel alloc];
//            NSString *dateStrs=[NSString stringWithFormat:@"%@",dic[@"actionParameters"]];
//            NSRange startRange = [dateStrs rangeOfString:@"dateTime="];
//            NSRange endRange = [dateStrs rangeOfString:@"&"];
//            NSRange range = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
//            model.defaultDate = [dateStrs substringWithRange:range];
//            model.actionUrl=[NSString stringWithFormat:@"%@",dic[@"actionUrl"]];
//            model.belongToKey=[NSString stringWithFormat:@"%@",dic[@"belongToKey"]];
//            if ([dic[@"title"]isEqualToString:@"河南省煤炭产量及增速"]) {
//                vc1.model1=model;
//            }else if ([dic[@"title"]isEqualToString:@"河南省骨干煤企生产情况"]) {
//               vc1.model2=model;
//            }else if ([dic[@"title"]isEqualToString:@"河南省地方煤矿生产情况"]) {
//                vc1.model3=model;
//            }else if ([dic[@"title"]isEqualToString:@"河南省电煤库存情况"]) {
//                vc2.model4=model;
//            }else if ([dic[@"title"]isEqualToString:@"河南省煤炭企业电煤库存情况"]) {
//               vc2.model5=model;
//            }else if ([dic[@"title"]isEqualToString:@"河南省统调燃煤发电企业电煤库存情况"]) {
//               vc2.model6=model;
//            }
//        }
//        NSArray * titleArray = @[@"生产",@"电煤库存"];
//        [self setupUIWithChildViewControllers:@[vc1,vc2] andTitles:titleArray];
//    } failed:^(NSError *error) {
//        NSLog(@"error:%@",error);
//    }];
    [ModelNetWorkingHelper modelDataTaskGetNetWorkingWithURLString:[NSString stringWithFormat:@"%@PowerApp/graphicDetail/getByCategory?category=4",NY_REQUEST_URLString] otherHeaderFields:nil parameters:nil success:^(id  _Nullable responseObject) {
        NSData *jsonData = [responseObject dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
        NSArray *data=jsonDic[@"data"];
        for (int i=0; i<data.count; i++) {
            NSDictionary *dic=data[i];
            
            ModularTypeModel *model=[ModularTypeModel alloc];
            NSString *dateStrs=[NSString stringWithFormat:@"%@",dic[@"actionParameters"]];
            NSRange startRange = [dateStrs rangeOfString:@"dateTime="];
            NSRange endRange = [dateStrs rangeOfString:@"&"];
            NSRange range = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
            model.defaultDate = [dateStrs substringWithRange:range];
            model.actionUrl=[NSString stringWithFormat:@"%@",dic[@"actionUrl"]];
            model.belongToKey=[NSString stringWithFormat:@"%@",dic[@"belongToKey"]];
            if ([dic[@"title"]isEqualToString:@"河南省煤炭产量及增速"]) {
                vc1.model1=model;
            }else if ([dic[@"title"]isEqualToString:@"河南省骨干煤企生产情况"]) {
                vc1.model2=model;
            }else if ([dic[@"title"]isEqualToString:@"河南省地方煤矿生产情况"]) {
                vc1.model3=model;
            }else if ([dic[@"title"]isEqualToString:@"河南省电煤库存情况"]) {
                vc2.model4=model;
            }else if ([dic[@"title"]isEqualToString:@"河南省煤炭企业电煤库存情况"]) {
                vc2.model5=model;
            }else if ([dic[@"title"]isEqualToString:@"河南省统调燃煤发电企业电煤库存情况"]) {
                vc2.model6=model;
            }
        }
        NSArray * titleArray = @[@"生产",@"电煤库存"];
        [self setupUIWithChildViewControllers:@[vc1,vc2] andTitles:titleArray];
    } failure:^(NSString * _Nonnull error, NSInteger retCode) {
        NSLog(@"error:%@",error);
    }];
   
}
@end
