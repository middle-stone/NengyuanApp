//
//  NSArray+DDKit.m
//  DDCategory
//
//  Created by DeJohn Dong on 15/4/25.
//  Copyright (c) 2015年 DDKit. All rights reserved.
//

#import "NSArray+DDKit.h"

@implementation NSArray (DDKit)

- (id)dd_objectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

@end


@implementation NSDictionary(JSONCategories)

+(NSDictionary *)dictionaryFromJSONData:(NSData *)jsonData
{
    if (jsonData==nil) {
        return nil;
    }
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

+(NSDictionary *)dictionaryFromJSONData:(NSData *)jsonData options:(NSJSONReadingOptions)opt error:(NSError **)error
{
    id result = [NSJSONSerialization JSONObjectWithData:jsonData options:opt error:error];
    if (error != nil) return nil;
    return result;
}


-(NSData *)toJSON
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError* error = nil;
        id result = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
        if (error != nil) return nil;
        return result;
    }else{
        return nil;//[NSKeyedArchiver archivedDataWithRootObject:self];
    }
}

-(NSData *)toJSONWithoptions:(NSJSONWritingOptions)opt error:(NSError **)error
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        id result = [NSJSONSerialization dataWithJSONObject:self options:opt error:error];
        if (error != nil) return nil;
        return result;
    }else{
        return nil;
    }
}


-(NSString *)JSONString
{
    NSData* data = [self toJSON];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

@end
