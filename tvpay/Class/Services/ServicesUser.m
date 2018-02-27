//
//  ServicesUser.m
//  tvpay
//
//  Created by dust.zhang on 2018/2/27.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import "ServicesUser.h"

@implementation ServicesUser


+ (void)getUserInfo:(NSString *)tvmid token:(NSString *)token
               model:(void (^)( TVMUserModel *model ))success failure:(void (^)(NSError *error))failure
{
    NSDictionary *body = @{@"tvmid":[Tool urlIsNull:tvmid],
                           @"token":[Tool urlIsNull:token]
                           };
    
    TVMReachability *reachor = [TVMReachability reachabilityWithHostName:URL_GETUSERINFO];
    if ( reachor == AFNetworkReachabilityStatusNotReachable)
    {
        if(failure)
            failure([NSError errorWithDomain:requestErrorTip code:noNetWorkCode  userInfo:nil]);
    }
    else
    {
        [MKNetWorkRequest POST:URL_GETUSERINFO parameters:body success:^(NSURLSessionDataTask *task, id responseObject)
         {
             NSLog(@"%@",[responseObject JSONString]);
             
             RequestResultsModel *model =[[RequestResultsModel alloc] initWithDictionary:responseObject  error:nil];
             if ([model.status intValue] == 0)
             {
                TVMUserModel *userModel =[[TVMUserModel alloc] initWithDictionary:responseObject  error:nil];
                if(success)
                          success(userModel);
             }
             else
             {
                 if(failure)
                     failure([NSError errorWithDomain:model.msg code:[model.status intValue]  userInfo:nil]);
             }
             
         } failure:^(NSURLSessionDataTask *task, NSError *error) {
             if(failure)
                 failure([NSError errorWithDomain:[error localizedDescription] code:error.code userInfo:nil]);
         }];
    }
}

+ (void)getGoldCoinCount:(NSString *)tvmid token:(NSString *)token
              model:(void (^)( GoldCoinModel *model ))success failure:(void (^)(NSError *error))failure
{
    NSDictionary *body = @{@"tvmid":[Tool urlIsNull:tvmid],
                           @"token":[Tool urlIsNull:token]
                           };
    
    TVMReachability *reachor = [TVMReachability reachabilityWithHostName:URL_GETGOLDCOINCOUNT];
    if ( reachor == AFNetworkReachabilityStatusNotReachable)
    {
        if(failure)
            failure([NSError errorWithDomain:requestErrorTip code:noNetWorkCode  userInfo:nil]);
    }
    else
    {
        [MKNetWorkRequest POST:URL_GETGOLDCOINCOUNT parameters:body success:^(NSURLSessionDataTask *task, id responseObject)
         {
             NSLog(@"%@",[responseObject JSONString]);
             
             RequestResultsModel *model =[[RequestResultsModel alloc] initWithDictionary:responseObject  error:nil];
             if ([model.status intValue] == 0)
             {
                 GoldCoinModel *GCModel =[[GoldCoinModel alloc] initWithDictionary:responseObject  error:nil];
                 if(success)
                     success(GCModel);
             }
             else
             {
                 if(failure)
                     failure([NSError errorWithDomain:model.msg code:[model.status intValue]  userInfo:nil]);
             }
             
         } failure:^(NSURLSessionDataTask *task, NSError *error) {
             if(failure)
                 failure([NSError errorWithDomain:[error localizedDescription] code:error.code userInfo:nil]);
         }];
    }
}

+ (void)updateToken:(NSString *)tvmid token:(NSString *)token macaddress:(NSString *)macaddress
                   model:(void (^)( TVMTokenModel *model ))success failure:(void (^)(NSError *error))failure
{
    NSDictionary *body = @{@"tvmid":[Tool urlIsNull:tvmid],
                           @"token":[Tool urlIsNull:token],
                           @"macaddress":[Tool urlIsNull:[Tool getMacAddress]]
                           };
    
    TVMReachability *reachor = [TVMReachability reachabilityWithHostName:URL_UPDATETOKEN];
    if ( reachor == AFNetworkReachabilityStatusNotReachable)
    {
        if(failure)
            failure([NSError errorWithDomain:requestErrorTip code:noNetWorkCode  userInfo:nil]);
    }
    else
    {
        [MKNetWorkRequest POST:URL_UPDATETOKEN parameters:body success:^(NSURLSessionDataTask *task, id responseObject)
         {
             NSLog(@"%@",[responseObject JSONString]);
             
             RequestResultsModel *model =[[RequestResultsModel alloc] initWithDictionary:responseObject  error:nil];
             if ([model.status intValue] == 0)
             {
                 TVMTokenModel *tokenModel =[[TVMTokenModel alloc] initWithDictionary:responseObject  error:nil];
                 if(success)
                     success(tokenModel);
             }
             else
             {
                 if(failure)
                     failure([NSError errorWithDomain:model.msg code:[model.status intValue]  userInfo:nil]);
             }
             
         } failure:^(NSURLSessionDataTask *task, NSError *error) {
             if(failure)
                 failure([NSError errorWithDomain:[error localizedDescription] code:error.code userInfo:nil]);
         }];
    }
}

@end
