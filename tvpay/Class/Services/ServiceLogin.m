//
//  ServiceLogin.m
//  tvpay
//
//  Created by dust.zhang on 2018/2/26.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import "ServiceLogin.h"

@implementation ServiceLogin

+ (void)requestLogin:(NSString *)mobile authCode:(NSString *)msg
                model:(void (^)( TVMLoginModel *LoginModel ))success failure:(void (^)(NSError *error))failure
{
    NSDictionary *body = @{@"uid":[Tool urlIsNull:mobile],      //手机号
                           @"authCode" :[Tool urlIsNull:msg] }; //验证码
    
    TVMReachability *reachor = [TVMReachability reachabilityWithHostName:URL_LOGIN];
    //网络状态判断
    if ( reachor == AFNetworkReachabilityStatusNotReachable)
    {
        if(failure)
            failure([NSError errorWithDomain:requestErrorTip code:noNetWorkCode  userInfo:nil]);
    }
    else
    {
        [MKNetWorkRequest POST:URL_LOGIN parameters:body success:^(NSURLSessionDataTask *task, id responseObject)
        {
             NSLog(@"%@",[responseObject JSONString]);
            
            RequestResultsModel *model =[[RequestResultsModel alloc] initWithDictionary:responseObject  error:nil];
            if ([model.status intValue] == 0)
            {
                 TVMLoginModel *Loginmodel =[[TVMLoginModel alloc] initWithDictionary:responseObject  error:nil];
//                 if ([Loginmodel.data.status intValue] == 200)
//                 {
                     if(success)
                         success(Loginmodel);
//                 }
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


+ (void)getLoginCode:(NSString *)mobile
               model:(void (^)( RequestResultsModel *model ))success failure:(void (^)(NSError *error))failure
{
    NSDictionary *body = @{@"mobile_number":[Tool urlIsNull:mobile]}; //验证码
    
    TVMReachability *reachor = [TVMReachability reachabilityWithHostName:URL_SENDLOGINMSGCODE];
    if ( reachor == AFNetworkReachabilityStatusNotReachable)
    {
        if(failure)
            failure([NSError errorWithDomain:requestErrorTip code:noNetWorkCode  userInfo:nil]);
    }
    else
    {
        [MKNetWorkRequest POST:URL_SENDLOGINMSGCODE parameters:body success:^(NSURLSessionDataTask *task, id responseObject)
         {
             NSLog(@"%@",[responseObject JSONString]);
            
             RequestResultsModel *model =[[RequestResultsModel alloc] initWithDictionary:responseObject  error:nil];
             if ([model.status intValue] == 0)
             {
                 if(success)
                     success(model);
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
