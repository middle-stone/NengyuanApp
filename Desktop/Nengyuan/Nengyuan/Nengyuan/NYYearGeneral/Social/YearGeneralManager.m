//
//  YearGeneralManager.m
//  Nengyuan
//
//  Created by hui on 2019/11/13.
//  Copyright © 2019 hui. All rights reserved.
//

#import "YearGeneralManager.h"

@implementation YearGeneralManager

// 河南产业结构
+ (void)returnIndustrialStructureWithsuccess:(void (^)(id _Nonnull))success failure:(void (^)(NSString * _Nonnull, NSInteger))failure
{
    NSString *url = [NSString stringWithFormat:@"%@/PowerApp/economicsocietyData/getIndustrialStructure",NY_REQUEST_URLString];

    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"industrial_structure_over_year" forKey:@"belongToKey"];
    [ModelNetWorkingHelper modelDataTaskPostNetWorkingWithURLString:url otherHeaderFields:nil parameters:dic success:^(id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSString * _Nonnull error, NSInteger retCode) {
        failure(error,retCode);
    }];
}

// 河南省常住人口及城镇化率
+(void)returnCityPersonRateWithsuccess:(void (^)(id _Nonnull))success failure:(void (^)(NSString * _Nonnull, NSInteger))failure
{
    NSString *url = [NSString stringWithFormat:@"%@/PowerApp/economicsocietyData/getSocietySurvey",NY_REQUEST_URLString];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"rate_of_resident_population" forKey:@"belongToKey"];
    [ModelNetWorkingHelper modelDataTaskPostNetWorkingWithURLString:url otherHeaderFields:nil parameters:dic success:^(id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSString * _Nonnull error, NSInteger retCode) {
        failure(error,retCode);
    }];

}


 // 河南省常住人口及城镇化率
+(void)returnNationalIndustrialWithDate:(NSString *)date success:(void (^)(id _Nonnull))success failure:(void (^)(NSString * _Nonnull, NSInteger))failure
{
    NSString *url= [NSString stringWithFormat:@"%@/PowerApp/economicsocietyData/getIndustrialStructureContrast",NY_REQUEST_URLString];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"nation_typical_industrial_structure" forKey:@"belongToKey"];
    [dic setObject:date forKey:@"dateTime"];
    [ModelNetWorkingHelper modelDataTaskPostNetWorkingWithURLString:url otherHeaderFields:nil parameters:dic success:^(id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSString * _Nonnull error, NSInteger retCode) {
        failure(error,retCode);
    }];
}

 +(void)testsuccess:(void (^)(id _Nonnull))success failure:(void (^)(NSString * _Nonnull, NSInteger))failure
{
    NSString *url = @"http://172.16.4.43:8080/PowerApp/graphLoadData/get";
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:@"2019" forKey:@"dateTime"];
    [dic setValue:@"true" forKey:@"isDefault"];
    [dic setValue:@"2" forKey:@"dateType"];
    [dic setValue:@"1" forKey:@"graphicType"];
    [dic setValue:@"全省合计" forKey:@"filterParam"];
    [dic setValue:@"province_coal_output_increase" forKey:@"belongToKey"];
    [ModelNetWorkingHelper modelDataTaskPostNetWorkingWithURLString:url otherHeaderFields:nil parameters:dic success:^(id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSString * _Nonnull error, NSInteger retCode) {
        NSLog(@"----");
    }];
}

@end
