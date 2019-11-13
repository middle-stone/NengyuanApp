//
//  ModelNetWorkingHelper.m
//  QunChuang
//
//  Created by itrax on 2017/7/3.
//  Copyright © 2017年 itrax. All rights reserved.
//

#import "ModelNetWorkingHelper.h"
//#import "RegularExpression.h"
//#import "AppInfo.h"

@implementation ModelNetWorkingHelper

/**
 *  自己封装的post方法
 *  
 */
+(NSURLSessionDataTask *)modelDataTaskPostNetWorkingWithURLString:(NSString *)URLString otherHeaderFields:(NSDictionary *)otherHeaderFields parameters:(id)parameters success:(void (^)(id _Nullable))success failure:(void (^)(NSString * _Nonnull, NSInteger))failure
{
    NSMutableDictionary *headerFields = [self LoginDefinedHTTPHeaderFields];
    if (otherHeaderFields != nil) {
        [headerFields setValuesForKeysWithDictionary:otherHeaderFields];
    }
    
    return [NetWorkingHelper dataLoginTaskPostWithURLString:URLString
                                               headerFields:headerFields
                                                 parameters:parameters
                                                    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                                                        if (response.statusCode == 200) {
                                                            if (success) {
                                                                success(responseObject);
                                                            }
                                                        }
                                                        
                                                    } failure:^(NSURLSessionDataTask * _Nullable task, NSString * _Nonnull error) {
                                                        
                                                        if (failure) {
                                                            NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                                                            
                                                            failure(error,response.statusCode);
                                                        }
                                                    }];
}

+(NSURLSessionDataTask *)modelDataTaskGetNetWorkingWithURLString:(NSString *)URLString otherHeaderFields:(NSDictionary *)otherHeaderFields parameters:(id)parameters success:(void (^)(id _Nullable))success failure:(void (^)(NSString * _Nonnull, NSInteger))failure
{
    NSMutableDictionary *headerFields = [self LoginDefinedHTTPHeaderFields];
    if (otherHeaderFields != nil) {
        [headerFields setValuesForKeysWithDictionary:otherHeaderFields];
    }
    return [NetWorkingHelper dataMyTaskGetWithURLString:URLString headerFields:headerFields parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        if (response.statusCode == 200) {
            if (success) {
                success(responseObject);
            }
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSString * _Nonnull error) {
        if (failure) {
            NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
            
            failure(error,response.statusCode);
        }

    }];
}

+ (NSURLSessionDataTask *)modelPostNetWorkingWithURLString:(NSString *)URLString otherHeaderFields:(nullable NSDictionary *)otherHeaderFields parameters:(nullable id)parameters constructingBodyWithBlock:(nullable void (^)(id<AFMultipartFormData> formData))block success:(nullable void (^)(id _Nullable dataObject))success failure:(nullable void (^)(NSString * _Nonnull, NSInteger))failure
{
    NSMutableDictionary *headerFields = [self LoginDefinedHTTPHeaderFields];
    if (otherHeaderFields != nil) {
        [headerFields setValuesForKeysWithDictionary:otherHeaderFields];
    }
    
    return [NetWorkingHelper postWithURLString:URLString
                                  headerFields:headerFields
                                    parameters:parameters
                     constructingBodyWithBlock:block
                                      progress:nil
                                       success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
                                         
                                           NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                                           if (response.statusCode == 200) {
                                               if (success) {
                                                   success(responseObject);
                                               }
                                           }
                                       }
                                       failure:^(NSURLSessionDataTask *_Nullable task, NSString *_Nonnull error) {
                                           if (failure) {
                                               NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                                               
                                               failure(error,response.statusCode);
                                           }
                                       }];
}

+(NSMutableDictionary *)LoginDefinedHTTPHeaderFields
{
    NSMutableDictionary *headDic = [NSMutableDictionary dictionary];
    [headDic setObject:@"application/json; charset=utf-8" forKey:@"Content-Type"];
//    NSString *token =  [[NSUserDefaults standardUserDefaults] objectForKey:@"MStoken"];
//    [headDic setValue:token forKey:@"Authorization"];
    return headDic;
}


@end
