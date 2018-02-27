//
//  NSString+Extension.m
//  TVMShakeTV
//
//  Created by 张宏伟 on 2016/12/20.
//  Copyright © 2016年 TVM. All rights reserved.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Extension)

+ (BOOL)isNilValue:(NSString *)value{
    if (!value) {
        return YES;
    }
    
    if (![value isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if (value.length <= 0) {
        return YES;
    }
    
    if ([value isEqualToString:@""]) {
        return YES;
    }
    
    if ([value isEqualToString:@"null"]) {
        return YES;
    }
    
    if ([value isEqualToString:@"nil"]) {
        return YES;
    }
    
    
    return NO;
}

+ (instancetype)defaultValue:(NSString *)str{
    return [self placeholer:@"" forString:str];
}

+ (instancetype)placeholer:(NSString *)placeholer forString:(NSString *)str{
    if ([NSString isNilValue:str]) {
        return placeholer;
    }
    return str;
}

+ (NSString *)JsonStringFromObject:(id)object
{
    if (object) {
        if ([object isKindOfClass:[NSDictionary class]] ||
            [object isKindOfClass:[NSArray class]]) {
            
            NSError *error;
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                               options:NSJSONWritingPrettyPrinted
                                                                 error:&error];
            NSString *jsonString;
            if (!jsonData) {
                return nil;
            }else{
                jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
            }
            
            NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
            NSRange range = {0,jsonString.length};
            //去掉字符串中的空格
            [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
            NSRange range2 = {0,mutStr.length};
            //去掉字符串中的换行符
            [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
            return mutStr;
        }
    }
    
    return nil;
}

- (NSMutableAttributedString *)stringWithAttributes:(NSDictionary *)attributes regex:(NSString *)regex
{
    if (!self || self.length <= 0) {
        return nil;
    }
    
    NSMutableAttributedString *mutableStr = [[NSMutableAttributedString alloc] initWithString:self];
    if (!attributes || attributes.count <= 0) {
        return mutableStr;
    }
    if (!regex || regex.length <= 0) {
        [mutableStr addAttributes:attributes range:NSMakeRange(0, mutableStr.length)];
        return mutableStr;
    }
    
    NSError *error;
    NSRegularExpression* regexpress = [NSRegularExpression regularExpressionWithPattern:regex
                                                                                options:0
                                                                                  error:&error];
    if (!error) {
        NSArray *results = [regexpress matchesInString:self options:0 range:NSMakeRange(0, self.length)];
        for (NSTextCheckingResult *result in results) {
            [mutableStr addAttributes:attributes range:result.range];
        }
    }

    return mutableStr;
}

- (BOOL)containsEmojiCode
{
    if (self.length <= 0) {
        return NO;
    }
    
    __block BOOL isFinded =NO;
    NSString *sstring = [self copy];
    NSUInteger strLength = [sstring length];
    [sstring enumerateSubstringsInRange:NSMakeRange(0, strLength)
                                options:NSStringEnumerationByComposedCharacterSequences
                             usingBlock:^(NSString *substring,
                                          NSRange substringRange,
                                          NSRange enclosingRange,
                                          BOOL *stop) {
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800) {
            if (0xd800 <= hs && hs <= 0xdbff) {
                if (substring.length > 1) {
                    const unichar ls = [substring characterAtIndex:1];
                    const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                    if (0x1d000 <= uc && uc <= 0x1f77f) {
                        isFinded =YES;
                    }
                }
            }else if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                if (ls == 0x20e3) {
                    isFinded =YES;
                }
            }else {
                // non surrogate
                if (0x2100 <= hs && hs <= 0x27ff) {
                    isFinded =YES;
                }else if (0x2B05 <= hs && hs <= 0x2b07) {
                    isFinded =YES;
                }else if (0x2934 <= hs && hs <= 0x2935) {
                    isFinded =YES;
                }else if (0x3297 <= hs && hs <= 0x3299) {
                    isFinded =YES;
                }else if (hs == 0xa9 || hs == 0xae || hs == 0x303d
                          || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c
                          || hs == 0x2b1b || hs == 0x2b50) {
                    isFinded =YES;
                }
            }
        }
    }];
    return isFinded;
}

- (NSString *)md5String
{
    const char* str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    uint32_t length = (CC_LONG)strlen(str);
    CC_MD5(str, length, result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
    return ret;
    
    return nil;
}
@end
