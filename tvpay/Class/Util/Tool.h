//
//  Tool.h
//  movikr
//
//  Created by zeyuan on 15/5/27.
//  Copyright (c) 2015年 zeyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import <CommonCrypto/CommonDigest.h>
//#import "UIDevice+TVMKeychainUUID.h"

@interface Tool : NSObject

//隐藏tabbar
+(void)hideTabBar;

+(void)showTabBar;

+ (void)downloadImage:(NSString *)urlString
               button:(UIButton*)btn
            imageView:(UIImageView*)imageView
         defaultImage:(NSString*)defaultStr;

+(NSNumber *) getSystemTime;

+(NSMutableAttributedString *)setKeyAttributed:(NSString *)originResult
                                           key:(NSString *)searchKey
                                      fontSize:(UIFont*) font;

+(void)setLabelImageFont:(NSString *)fontText
                   image:(NSString *)imageName
               imageSize:(CGRect ) imageSize
             insertIndex:(NSInteger)index
                   label:(UILabel *)label;


+(NSString *) getAppVersion;

+(void) showWarningTip:(NSString *) message time:(float) delayTime;

+(void)hideWarningTip:(UIWindow*)window;

+(NSString *)urlIsNull:(NSString *)url;
//金币数量显示，大于1000则显示1k
+(NSString *) GoldCoinIsNull:(NSNumber *)count;
//获取mac
+ (NSString *)getMacAddress;
@end
