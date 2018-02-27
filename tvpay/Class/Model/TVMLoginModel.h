//
//  TVMLoginModel
//  tvpay
//
//  Created by dust.zhang on 2018/2/26.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@interface ContentInfoModel : JSONModel
@property (nonatomic , strong ) NSString<Optional>* language;
@property (nonatomic , strong ) NSString<Optional>* openid;
@property (nonatomic , strong ) NSString<Optional>* unionid;
@property (nonatomic , strong ) NSString<Optional>* province;
@property (nonatomic , strong ) NSString<Optional>* country;
@property (nonatomic , strong ) NSNumber<Optional>* sex;
@property (nonatomic , strong ) NSString<Optional>* nickname;
@property (nonatomic , strong ) NSString<Optional>* headimgurl;
@property (nonatomic , strong ) NSString<Optional>* mobile_number;
@end

@interface TVMLoginDataModel : JSONModel
@property (nonatomic , strong ) NSNumber<Optional>* isRecommend;
@property (nonatomic , strong ) NSString<Optional>* mobile_number;
@property (nonatomic , strong ) NSString<Optional>* tvmid;
@property (nonatomic , strong ) NSNumber<Optional>* isWelfareNewUser;
@property (nonatomic , strong ) NSNumber<Optional>* type;
@property (nonatomic , strong ) NSString<Optional>* ttopenid;
@property (nonatomic , strong ) NSString<Optional>* mtqsign;
@property (nonatomic , strong ) NSNumber<Optional>* sigExpire;
@property (nonatomic , strong ) NSString<Optional>* ttdsbappid;
@property (nonatomic , strong ) NSString<Optional>* yaoSig;
@property (nonatomic , strong ) NSString<Optional>* ttdsbwx_token;
@property (nonatomic , strong ) ContentInfoModel<Optional>* contentInfo;
@end

@interface TVMDataLModel : JSONModel
@property (nonatomic , strong ) NSNumber<Optional>* status;
@property (nonatomic , strong ) TVMLoginDataModel<Optional>* data;
@property (nonatomic , strong ) NSString<Optional>* token;
@end


@interface TVMLoginModel : JSONModel
@property (nonatomic , strong ) NSNumber<Optional>* status;
@property (nonatomic , strong ) NSString<Optional>* msg;
@property (nonatomic , strong ) TVMDataLModel<Optional>* data;
@end



