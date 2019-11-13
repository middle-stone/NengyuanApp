//
//  YearGeneralManager.m
//  Nengyuan
//
//  Created by hui on 2019/11/13.
//  Copyright © 2019 hui. All rights reserved.
//

#import "YearGeneralManager.h"

@implementation YearGeneralManager

+ (void)returnIndustrialStructureWithsuccess:(void (^)(id _Nonnull))success failure:(void (^)(NSString * _Nonnull, NSInteger))failure
{
//    NSString *url = @"http://172.16.4.43:8080/PowerApp/economicsocietyData/getIndustrialStructure";
    NSString *url = @"http://47.105.116.29:18888/PowerApp/economicsocietyData/getIndustrialStructure";

    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"industrial_structure_over_year" forKey:@"belongToKey"];
    [ModelNetWorkingHelper modelDataTaskPostNetWorkingWithURLString:url otherHeaderFields:nil parameters:dic success:^(id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSString * _Nonnull error, NSInteger retCode) {
        failure(error,retCode);
    }];

}
@end
