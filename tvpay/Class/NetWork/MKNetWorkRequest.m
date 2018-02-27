//
//  MKNetWorkRequest
//
//
//  Created by zhangjingfei on 24/3/15.
//
//

#import "MKNetWorkRequest.h"

@implementation MKNetWorkRequest

/************************************************************************
 功能：请求网络JSON数据，返回NSString
 参数：url 请求的网络url
 *************************************************************************/
+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)bodys
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
//    manager.requestSerializer.timeoutInterval = 10.f;
//    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
//    [manager.operationQueue cancelAllOperations];
    
    return [manager POST:URLString parameters:bodys progress:nil success:success failure:failure];
}

@end
