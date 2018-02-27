//
//  TVMConfig.h
//  TVMShakeTV
//
//  Created by dust.zhang on 2018/1/2.
//

#import <Foundation/Foundation.h>


@interface TVMConfig : NSObject

+(void) setLocationRemind;

+(NSString *) getLocationRemind;

+(void) setAppBackTime:(NSNumber *)nowDate;

+(NSNumber *) getAppBackTime;

+(void)saveLoginState:(NSString *)state;

+(BOOL)getLoginState;
//清空数据
+ (void)clearUserDefaults;

+(void)saveTvmid:(NSString *)tvmid;

+(NSString *)getTvmid;

+(void)saveToken:(NSString *)token;

+(NSString *)getToken;

@end
