//
//  ServicesUser.h
//  tvpay
//
//  Created by dust.zhang on 2018/2/27.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TVMUserModel.h"
#import "GoldCoinModel.h"

@interface ServicesUser : NSObject

//获取用户数据
+ (void)getUserInfo:(NSString *)tvmid token:(NSString *)token
              model:(void (^)( TVMUserModel *model ))success failure:(void (^)(NSError *error))failure;

//获取金币钻石碎片数量
+ (void)getGoldCoinCount:(NSString *)tvmid token:(NSString *)token
                   model:(void (^)( GoldCoinModel *model ))success failure:(void (^)(NSError *error))failure;

//更新Token
+ (void)updateToken:(NSString *)tvmid token:(NSString *)token macaddress:(NSString *)macaddress
              model:(void (^)( TVMTokenModel *model ))success failure:(void (^)(NSError *error))failure;

@end
