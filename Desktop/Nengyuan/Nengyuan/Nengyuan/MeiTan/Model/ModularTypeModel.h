//
//  ModularTypeModel.h
//  Nengyuan
//
//  Created by 齐陈欢 on 2019/11/15.
//  Copyright © 2019 hui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ModularTypeModel : NSObject
///日期
//@property(nonatomic,copy)NSString * actionParameters ;
@property(nonatomic,copy)NSString * defaultDate ;
///请求拼接的url
@property(nonatomic,copy)NSString * actionUrl;
///请求的参数
@property(nonatomic,copy)NSString * belongToKey;
@end

NS_ASSUME_NONNULL_END
