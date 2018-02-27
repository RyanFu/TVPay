//
//  RequestResultsModel.h
//  tvpay
//
//  Created by dust.zhang on 2018/2/27.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface RequestResultsModel : JSONModel
@property (nonatomic , strong ) NSNumber<Optional>* status;
@property (nonatomic , strong ) NSString<Optional>* msg;
@end

