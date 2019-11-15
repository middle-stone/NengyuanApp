//
//  YearGeneralManager.h
//  Nengyuan
//
//  Created by hui on 2019/11/13.
//  Copyright © 2019 hui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YearGeneralManager : NSObject


// 河南产业结构
+(void)returnIndustrialStructureWithsuccess:(void(^)(id response))success
                                    failure:(void(^)(NSString *errorStr,NSInteger retcode))failure;

/**
 * 河南省常住人口及城镇化率
 */
+(void)returnCityPersonRateWithsuccess:(void(^)(id response))success
                                    failure:(void(^)(NSString *errorStr,NSInteger retcode))failure;

/**
 * 河南省常住人口及城镇化率
 */
+(void)returnNationalIndustrialWithDate:(NSString *)date
                                success:(void(^)(id response))success
                                failure:(void(^)(NSString *errorStr,NSInteger retcode))failure;

+(void)testsuccess:(void(^)(id response))success
           failure:(void(^)(NSString *errorStr,NSInteger retcode))failure;

@end

NS_ASSUME_NONNULL_END
