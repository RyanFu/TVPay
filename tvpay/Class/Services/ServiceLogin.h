//
//  ServiceLogin.h
//  tvpay
//
//  Created by dust.zhang on 2018/2/26.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TVMLoginModel.h"
#import "MKNetWorkRequest.h"
#import "JSONKit.h"
#import "RequestResultsModel.h"

@interface ServiceLogin : NSObject

//登录
+ (void)requestLogin:(NSString *)mobile authCode:(NSString *)msg
               model:(void (^)( TVMLoginModel *LoginModel ))success failure:(void (^)(NSError *error))failure;

//获取登录验证码
+ (void)getLoginCode:(NSString *)mobile
               model:(void (^)( RequestResultsModel *model ))success failure:(void (^)(NSError *error))failure;

@end
