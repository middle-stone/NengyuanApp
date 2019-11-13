//
//  ModelNetWorkingHelper.h
//  QunChuang
//
//  Created by itrax on 2017/7/3.
//  Copyright © 2017年 itrax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkingHelper.h"
NS_ASSUME_NONNULL_BEGIN
@interface ModelNetWorkingHelper : NSObject


/**
 *  model层dataTask的post封装，
 *
 *  @param URLString            URLString
 *  @param otherHeaderFields    其它的网络请求头
 *  @param parameters           参数
 *  @param success              成功的block，返回responseObject
 *  @param failure              失败的block，返回retcode，和error(错误信息)
 *
 *  @return dataTask
 */
+ (NSURLSessionDataTask *)modelDataTaskPostNetWorkingWithURLString:(NSString *)URLString otherHeaderFields:(nullable NSDictionary *)otherHeaderFields parameters:(nullable id)parameters success:(nullable void (^)(id _Nullable responseObject))success failure:(nullable void (^)(NSString *error, NSInteger retCode))failure;

/**
 *  model层dataTask的get封装
 *
 *  @param URLString            URLString description
 *  @param otherHeaderFields    其它的网络请求头
 *  @param parameters           参数
 *  @param success              成功的block，返回data字段对应的数据
 *  @param failure              失败的block，返回retcode，和error(错误信息)
 *
 *  @return NSURLSessionDataTask
 */
+ (NSURLSessionDataTask *)modelDataTaskGetNetWorkingWithURLString:(NSString *)URLString otherHeaderFields:(nullable NSDictionary *)otherHeaderFields parameters:(nullable id)parameters success:(nullable void (^)(id _Nullable responseObject))success failure:(nullable void (^)(NSString *error, NSInteger retCode))failure;


/**
 *  model层的post请求，带参数，上传文件
 *
 *  @param URLString            URLString description
 *  @param otherHeaderFields    其它的网络请求头
 *  @param parameters           参数
 *  @param block                文件上传的block
 *  @param success              成功的block，返回data字段对应的数据
 *  @param failure              失败的block，返回retcode，和error(后台返回的错误信息)
 *
 *  @return NSURLSessionDataTask
 */
+ (NSURLSessionDataTask *)modelPostNetWorkingWithURLString:(NSString *)URLString otherHeaderFields:(nullable NSDictionary *)otherHeaderFields parameters:(nullable id)parameters constructingBodyWithBlock:(nullable void (^)(id<AFMultipartFormData> formData))block success:(nullable void (^)(id _Nullable dataObject))success failure:(nullable void (^)(NSString *errorStr, NSInteger retCode))failure;

@end
NS_ASSUME_NONNULL_END
