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

@end

NS_ASSUME_NONNULL_END
