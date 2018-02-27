//
//  TVMConfig.m
//  TVMShakeTV
//
//  Created by dust.zhang on 2018/1/2.
//

#import "TVMConfig.h"

@protocol NSDictionary;
@implementation TVMConfig


+(void) setLocationRemind
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"1" forKey:@"userClocationAuthorIsOpen"];
    [userDefaults synchronize];
}
+(NSString *) getLocationRemind
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"userClocationAuthorIsOpen"];
}

+(void) setAppBackTime:(NSNumber *)nowDate
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:nowDate forKey:@"adLocalTime"];
    [userDefaults synchronize];
}
+(NSNumber *) getAppBackTime
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"adLocalTime"];
}

+(void)saveLoginState:(NSString *)state
{
    NSUserDefaults *startUpStatus = [NSUserDefaults standardUserDefaults];
    [startUpStatus setValue:state forKey:@"loginstatus"];
    [startUpStatus synchronize];
}

+(BOOL)getLoginState
{
    NSUserDefaults * startUpStatus = [NSUserDefaults standardUserDefaults];
    if ( ([[startUpStatus objectForKey:@"loginstatus"] isEqual:@"YES" ] )  )//&& ([[self getUserType] intValue]!= 1)
    {
        return TRUE;
    }
    return FALSE;
}

+ (void)clearUserDefaults
{
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict)
    {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
}

+(void)saveTvmid:(NSString *)tvmid
{
    NSUserDefaults *userTvmid = [NSUserDefaults standardUserDefaults];
    [userTvmid setValue:tvmid forKey:@"tvmid"];
    [userTvmid synchronize];
}

+(NSString *)getTvmid
{
    NSUserDefaults *userTvmid = [NSUserDefaults standardUserDefaults];
    return [userTvmid objectForKey:@"tvmid"];
}

+(void)saveToken:(NSString *)token
{
    NSUserDefaults *usertoken = [NSUserDefaults standardUserDefaults];
    [usertoken setValue:token forKey:@"TvmToken"];
    [usertoken synchronize];
}

+(NSString *)getToken
{
    NSUserDefaults *usertoken = [NSUserDefaults standardUserDefaults];
    return [usertoken objectForKey:@"TvmToken"];
}

@end
