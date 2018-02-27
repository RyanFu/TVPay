//
//  UrlAddress.h
//  movikr
//
//  Created by Mapollo27 on 15/5/29.
//  Copyright (c) 2015年 movikr. All rights reserved.
//

//正式环境
#ifdef TYPE_PRODUCT
#define URL_MAIN  @"http://odyssey.tvmopt.com"
#define URL_WEBURL @"http://static.tvmhb.cn/odyssey/pages/internal/"
//测试环境
#elif  TYPE_QA
#define URL_MAIN  @"http://odyssey.tvmhb.cn"
#define URL_WEBURL @"http://odyssey.tvmopt.com/pages/internal/"
#endif

//查询用户信息
#define     URL_GETUSERINFO         [URL_MAIN stringByAppendingString:@"/public/user/query"]
//查询金币钻石碎片数量
#define     URL_GETGOLDCOINCOUNT    [URL_MAIN stringByAppendingString:@"/public/finance/query"]
//发送登录短信验证码
#define     URL_SENDLOGINMSGCODE    [URL_MAIN stringByAppendingString:@"/public/user/sendvcode"]
//登录
#define     URL_LOGIN               [URL_MAIN stringByAppendingString:@"/public/user/login"]
//更新TOKEN
#define     URL_UPDATETOKEN         [URL_MAIN stringByAppendingString:@"/public/user/refreshtoken"]



