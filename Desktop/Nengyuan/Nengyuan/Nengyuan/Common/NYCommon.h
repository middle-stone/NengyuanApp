//
//  NYCommon.h
//  Nengyuan
//
//  Created by hui on 2019/11/12.
//  Copyright © 2019 hui. All rights reserved.
//

#ifndef NYCommon_h
#define NYCommon_h


//颜色和透明度设置
#define ColorWithRGBA(r, g, b, a) [UIColor colorWithRed:(float)r / 255.0f green:(float)g / 255.0f blue:(float)b / 255.0f alpha:a]
#define ColorWithRGB(r, g, b) ColorWithRGBA(r, g, b, 1.0)
#define ColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s & 0xFF00) >> 8))/255.0 blue:((s & 0xFF))/255.0  alpha:1.0]
/**
 *  通用蓝、色块文字颜色
 */
#define blueColor_one_level ColorWithRGBA(0, 116, 188, 1)
/**
 *  次级文字颜色
 */
#define WordColor_two_level ColorWithRGBA(157, 172, 182, 1)


/**< 尺寸  frame相关 */
#define kSCREEN_SIZE        [[UIScreen mainScreen] bounds].size
#define ScreenHeight        [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth         [[UIScreen mainScreen] bounds].size.width
#define nearStatusBar   (kDevice_Is_iPhoneX ? 44 : 0)
#define StatusBarHeight   (kDevice_Is_iPhoneX ? 44 : 20)
#define NavHeight   (StatusBarHeight + 44)
#define safeAreaHeight   (kDevice_Is_iPhoneX ? 34 : 0)
#define TabBarHeight      (safeAreaHeight + 49)
#define tableHeight (ScreenHeight - NavHeight)
// 判断是否是iPhone X
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define ios11                    @available(iOS 11.0, *)

//一个公共的用于处理解析数据的方法，过滤NSNull、nil、number、bool等类型转换成字符串
#define GeneralHandlerToFiltNullValue(value)                                                            \
({                                                                                                  \
id tmp;                                                                                         \
if (value == nil || [value isKindOfClass:[NSNull class]])                                       \
tmp = @"";                                                                                 \
else if (![value isKindOfClass:[NSDictionary class]] && ![value isKindOfClass:[NSArray class]]) \
tmp = [NSString stringWithFormat:@"%@", value];                                             \
else                                                                                            \
tmp = value;                                                                                \
tmp;                                                                                            \
})

//对nslog进行定制
#ifdef DEBUG
#define NSLog(s, ...) NSLog(@"%s LINE:%d < %@ >", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
#define NSLog(s, ...) nil
#endif


#endif /* NYCommon_h */
