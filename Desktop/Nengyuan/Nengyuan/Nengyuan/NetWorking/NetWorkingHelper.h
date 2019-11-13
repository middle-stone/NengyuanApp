//
//  NetWorkingHelper.h
//  QunChuang
//
//  Created by itrax on 2017/7/3.
//  Copyright © 2017年 itrax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
NS_ASSUME_NONNULL_BEGIN
@interface NetWorkingHelper : NSObject

/**
 *  检查网络状况
 *
 *  @return 网络状况
 */
+ (BOOL)checkNetReachable;


/**
 *  自己封装的dataTaskPost 方法
 *
 */
+ (nullable NSURLSessionDataTask *)dataLoginTaskPostWithURLString:(NSString *)URLString headerFields:(NSDictionary *)headerFields parameters:(nullable id)parameters success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success failure:(nullable void (^)(NSURLSessionDataTask *_Nullable task, NSString *error))failure;

/**
 *  自己封装的dataTaskGet 方法
 *
 */
+ (nullable NSURLSessionDataTask *)dataMyTaskGetWithURLString:(NSString *)URLString headerFields:(NSDictionary *)headerFields parameters:(nullable id)parameters success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success failure:(nullable void (^)(NSURLSessionDataTask *_Nullable task, NSString *error))failure;


/**
 *  封装的post网络请求,文件上传
 *
 *  @param URLString      URLString
 *  @param parameters     parameters
 *  @param block          block
 *  @param uploadProgress uploadProgress
 *  @param success        success
 *  @param failure        failure
 *
 *  @return task
 */
+ (nullable NSURLSessionDataTask *)postWithURLString:(NSString *)URLString headerFields:(NSDictionary *)headerFields parameters:(nullable id)parameters constructingBodyWithBlock:(nullable void (^)(id<AFMultipartFormData> formData))block
                                            progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                             success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                             failure:(nullable void (^)(NSURLSessionDataTask *_Nullable task, NSString *error))failure;

@end
NS_ASSUME_NONNULL_END
