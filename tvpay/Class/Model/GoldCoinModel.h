//
//  GoldCoinModel.h
//  tvpay
//
//  Created by dust.zhang on 2018/2/27.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface GoldCoinModel : JSONModel
@property (nonatomic , strong ) NSNumber<Optional>* coins;
@property (nonatomic , strong ) NSNumber<Optional>* diamonds;
@property (nonatomic , strong ) NSNumber<Optional>* pieces;
@end
