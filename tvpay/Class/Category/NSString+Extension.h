//
//  NSString+Extension.h
//  TVMShakeTV
//
//  Created by 张宏伟 on 2016/12/20.
//  Copyright © 2016年 TVM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)


/**
 是否为空值
 
 @param value 判断的字符串
 @return 是否为空
 */
+ (BOOL)isNilValue:(NSString *)value;


/**
 返回默认值
 
 @param str 判断的字符串
 @return 如果字符串为空则返回@“” 否则返回自身
 */
+ (instancetype)defaultValue:(NSString *)str;


/**
 返回默认值
 
 @param placeholer 默认字符串值
 @param str 判断的字符串值
 @return 如果str 为空 返回placeholer
 */
+ (instancetype)placeholer:(NSString *)placeholer forString:(NSString *)str;

+ (NSString *)JsonStringFromObject:(id)object;

- (NSMutableAttributedString *)stringWithAttributes:(NSDictionary *)attributes regex:(NSString *)regex;

- (BOOL)containsEmojiCode;

- (NSString *)md5String;
@end
