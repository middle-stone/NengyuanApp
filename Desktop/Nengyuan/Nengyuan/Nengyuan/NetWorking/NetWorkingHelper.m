//
//  NetWorkingHelper.m
//  QunChuang
//
//  Created by itrax on 2017/7/3.
//  Copyright © 2017年 itrax. All rights reserved.
//

#import "NetWorkingHelper.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "Reachability.h"
#import <objc/runtime.h>

typedef NS_ENUM(NSInteger, DataTaskHTTPMethodType) {
    /** get */
    DataTaskHTTPMethodTypeGet = 0,
    /** post */
    DataTaskHTTPMethodTypePost,
};

@implementation NetWorkingHelper

/**
 *  自己封装的dataTaskPost 方法
 */
+ (nullable NSURLSessionDataTask *)dataLoginTaskPostWithURLString:(NSString *)URLString headerFields:(NSDictionary *)headerFields parameters:(nullable id)parameters success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success failure:(nullable void (^)(NSURLSessionDataTask *task, NSString *error))failure{
    return [self dataLoginTaskWithType:DataTaskHTTPMethodTypePost URLString:URLString headerFields:headerFields parameters:parameters success:success failure:failure];
}
/**
 *  自己封装的dataTaskGet 方法
 *
 */
+ (nullable NSURLSessionDataTask *)dataMyTaskGetWithURLString:(NSString *)URLString headerFields:(NSDictionary *)headerFields parameters:(id)parameters success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSString * _Nonnull))failure
{
    return [self dataLoginTaskWithType:DataTaskHTTPMethodTypeGet URLString:URLString headerFields:headerFields parameters:parameters success:success failure:failure];
}

+ (NSURLSessionDataTask *)dataLoginTaskWithType:(DataTaskHTTPMethodType)type URLString:(NSString *)URLString headerFields:(NSDictionary *)headerFields parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                        failure:(void (^)( NSURLSessionDataTask *task, NSString *error))failure
{
    //打开状态栏开关
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
 
        if (![self checkNetReachable]) {
            if (failure) {
                failure(nil, @"请检查网络是否连接");
            }
            return nil;
        }
    
    //构建网络请求
    NSURL *URL = nil;
    NSMutableURLRequest *request = nil;
    
    if (parameters == nil) {
        parameters = @{};
    }
    
    switch (type) {
        case DataTaskHTTPMethodTypeGet: {
            NSMutableString *tmpParametersString = [NSMutableString stringWithString:@""];
            for (NSString *tmpKey in [(NSDictionary *)parameters allKeys]) {
                NSString *tmpValue = GeneralHandlerToFiltNullValue([parameters valueForKey:tmpKey]);
                
                if (![tmpValue isEqualToString:@""]) {
                    [tmpParametersString appendFormat:@"&%@=%@", tmpKey, tmpValue];
                }
            }
            
            if ([URLString rangeOfString:@"?"].location == NSNotFound) {
                URLString = [URLString stringByAppendingString:@"?"];
                if (tmpParametersString.length > 0) {
                    URLString = [URLString stringByAppendingString:[tmpParametersString substringFromIndex:1]];
                }
            }
            else {
                URLString = [URLString stringByAppendingString:tmpParametersString];
            }
            
            URL = [NSURL URLWithString:URLString];
            request = [NSMutableURLRequest requestWithURL:URL];
            [request setHTTPMethod:@"GET"];
            
            break;
        }
        case DataTaskHTTPMethodTypePost: {
            URL = [NSURL URLWithString:URLString];
            request = [NSMutableURLRequest requestWithURL:URL];
            [request setHTTPMethod:@"POST"];
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
            [request setHTTPBody:jsonData];
            break;
        }
    }
    
    request.allHTTPHeaderFields = headerFields;
    
    AFURLSessionManager *manager = [self sharedAFURLSessionManager];
    __block NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request
                                                        completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                                                            
                                                             NSHTTPURLResponse *tmpResponse = (NSHTTPURLResponse *)response;
                                                            NSString *NojsonResult = [[NSString alloc]initWithData:error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
                                                                if (tmpResponse.statusCode == 200) {
                                                                    if (error == nil) { // 当返回的结果为非json格式,走本方法
                                                                        success(dataTask,responseObject);
                                                                    }else{
                                                                        success(dataTask,NojsonResult);
                                                                    }
                                                                    
                                                                }else{

                                                                    NSDictionary *tmpErrorInfoDic = error.userInfo;
                                                                    NSString *strError = nil;
                                                                    NSError *innerError = [tmpErrorInfoDic valueForKey:@"NSUnderlyingError"];
                                                                    if (innerError) {
                                                                        NSDictionary *innerUserInfo = [[NSDictionary alloc]initWithDictionary:innerError.userInfo];
                                                                        if (innerUserInfo) { // 返回json格式错误信息
                                                                            if ([innerUserInfo objectForKey:AFNetworkingOperationFailingURLResponseDataErrorKey]) {
                                                                                strError  = [[NSString alloc]initWithData:[innerUserInfo objectForKey:AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
//                                                                                NSLog(@"error is %@",strError);
                                                                            }
                                                                        }
                                                                         failure(dataTask,strError);
                                                                    }else{ // 返回非json格式错误信息
                                                                        NSString *errorString = [[NSString alloc]initWithData:tmpErrorInfoDic[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
                                                                        failure(dataTask,errorString);
                                                                    }
//
                                                                }
                                                                
                                                        }];
    
    //开始任务
    [dataTask resume];
    return dataTask;
    
}

#pragma mark - api
+ (BOOL)checkNetReachable
{
    //检测当前网络状态
    Reachability *tmpReachability = [Reachability reachabilityForInternetConnection];
    return [tmpReachability isReachable];
}

#pragma mark -- 文件上传
+ (NSURLSessionDataTask *)postWithURLString:(NSString *)URLString headerFields:(NSDictionary *)headerFields parameters:(id)parameters constructingBodyWithBlock:(nullable void (^)(id<AFMultipartFormData> formData))block
                                   progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                    success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                    failure:(void (^)(NSURLSessionDataTask *task,  NSString *error))failure
{
    //打开状态栏开关
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
    if (![self checkNetReachable]) {
        if (failure) {
            failure(nil, @"请检查网络是否连接");
        }
        return nil;
    }
    
    AFHTTPSessionManager *manager = [self sharedAFHTTPSessionManager];
    if (headerFields != nil) {
        for (NSString *tmpKey in headerFields.allKeys) {
            NSString *tmpValue = [headerFields valueForKey:tmpKey];
            [manager.requestSerializer setValue:tmpValue forHTTPHeaderField:tmpKey];
        }
    }
    
    NSURLSessionDataTask *task = [manager POST:URLString
                                    parameters:parameters
                     constructingBodyWithBlock:block
                                      progress:uploadProgress
                                       success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
                                           
                                           if (success) {
                                               success(task, responseObject);
                                           }
                                       }
                                       failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error ) {
                                           
                                           NSString *strError = nil;
                                           NSDictionary *tmpErrorInfoDic = error.userInfo;
                                           NSError *innerError = [tmpErrorInfoDic valueForKey:@"NSUnderlyingError"];
                                           if (innerError) { // 返回json格式错误信息
                                               NSDictionary *innerUserInfo = [[NSDictionary alloc]initWithDictionary:innerError.userInfo];
                                               if (innerUserInfo) {
                                                   if ([innerUserInfo objectForKey:AFNetworkingOperationFailingURLResponseDataErrorKey]) {
                                                       strError  = [[NSString alloc]initWithData:[innerUserInfo objectForKey:AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
//                                                       NSLog(@"error is %@",strError);
                                                   }
                                               }
                                               
                                               failure(task,strError);
                                           }else{ // 返回非json格式错误信息
                                               NSString *errorString = [[NSString alloc]initWithData:tmpErrorInfoDic[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
                                               failure(task,errorString);
                                           }
                                           
                                           

                                       }];
    return task;
}


#pragma mark - private method
+ (AFURLSessionManager *)sharedAFURLSessionManager
{
    static AFURLSessionManager *manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    });
    return manager;
}

+ (AFHTTPSessionManager *)sharedAFHTTPSessionManager
{
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        //创建一个AFN对象
        manager = [AFHTTPSessionManager manager];
        //设置是否信任与无效或过期的 SSL 证书的服务器。默认为否
        manager.securityPolicy.allowInvalidCertificates = YES;
        [manager.securityPolicy setValidatesDomainName:NO];
        manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        // 设置请求格式
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        //      manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval = 15; // 请求超时设定
        manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        
        // 设置返回格式
        //      manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", @"text/long", nil];
        
    });
    return manager;
}


@end
