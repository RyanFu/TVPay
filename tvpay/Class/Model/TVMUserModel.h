//
//  TVMUserModel.h
//  tvpay
//
//  Created by dust.zhang on 2018/2/27.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@interface TVMAddressModel : JSONModel
@property (nonatomic , strong ) NSString<Optional>* longitude;
@property (nonatomic , strong ) NSString<Optional>* latitude;
@property (nonatomic , strong ) NSString<Optional>* city;
@property (nonatomic , strong ) NSString<Optional>* area;
@property (nonatomic , strong ) NSString<Optional>* provice;
@end

@interface TVMUserDetailsModel : JSONModel
@property (nonatomic , strong ) NSString<Optional>* id_birthday;
@property (nonatomic , strong ) NSNumber<Optional>* id_age;
@property (nonatomic , strong ) NSNumber<Optional>* age;
@property (nonatomic , strong ) NSNumber<Optional>* kafka_status;
@property (nonatomic , strong ) NSString<Optional>* mtqsign;
@property (nonatomic , strong ) NSString<Optional>* openid;
@property (nonatomic , strong ) NSNumber<Optional>* create_time;
@property (nonatomic , strong ) NSNumber<Optional>* active_time;
@property (nonatomic , strong ) NSString<Optional>* nickname;
@property (nonatomic , strong ) NSString<Optional>* user_address;
@property (nonatomic , strong ) NSString<Optional>* addr;
@property (nonatomic , strong ) NSString<Optional>* head_img;
@property (nonatomic , strong ) NSNumber<Optional>* sex;
@property (nonatomic , strong ) NSString<Optional>* wx_token;
@property (nonatomic , strong ) NSString<Optional>* app_mobile;
@property (nonatomic , strong ) NSNumber<Optional>* info_status;
@property (nonatomic , strong ) NSString<Optional>* resume;
@property (nonatomic , strong ) NSString<Optional>* tvm_red_id;
@property (nonatomic , strong ) NSString<Optional>* app_head_img;
@property (nonatomic , strong ) NSString<Optional>* unionid;
@property (nonatomic , strong ) NSString<Optional>* mobile;
@property (nonatomic , strong ) NSString<Optional>* ttopenid;
@property (nonatomic , strong ) NSString<Optional>* tvmid;
@property (nonatomic , strong ) NSString<Optional>* app_nickname;
@property (nonatomic , strong ) NSString<Optional>* sign_info;
@property (nonatomic , strong ) NSString<Optional>* id_number;
@property (nonatomic , strong ) NSString<Optional>* receiver;
@property (nonatomic , strong ) NSNumber<Optional>* creatTime;
@property (nonatomic , strong ) TVMAddressModel<Optional>* address;
@end

@interface TVMUserDataModel : JSONModel
@property (nonatomic , strong ) NSNumber<Optional>* status;
@property (nonatomic , strong ) NSNumber<Optional>* code;
@property (nonatomic , strong ) TVMUserDetailsModel<Optional>* data;
@end

@interface TVMUserModel : JSONModel
@property (nonatomic , strong ) NSNumber<Optional>* status;
@property (nonatomic , strong ) NSString<Optional>* msg;
@property (nonatomic , strong ) TVMUserDataModel<Optional>* data;
@end



//Token model
@interface TVMTokenInfoModel : JSONModel
@property (nonatomic , strong ) NSString<Optional>* tvmid;
@property (nonatomic , strong ) NSString<Optional>* mobile_number;
@property (nonatomic , strong ) NSString<Optional>* ttopenid;
@property (nonatomic , strong ) NSString<Optional>* unionid;
@property (nonatomic , strong ) NSString<Optional>* username;
@property (nonatomic , strong ) NSString<Optional>* macaddress;
@property (nonatomic , assign ) BOOL isWelfareNewUser;
@property (nonatomic , strong ) NSString<Optional>* mtqsign;
@property (nonatomic , strong ) NSNumber<Optional>* sigExpire;
@property (nonatomic , strong ) NSString<Optional>* ttdsbappid;
@property (nonatomic , strong ) NSString<Optional>* yaoSig;
@property (nonatomic , strong ) NSString<Optional>* wxTokenSig;
@property (nonatomic , strong ) NSString<Optional>* ttdsbwx_token;
@property (nonatomic , strong ) NSNumber<Optional>* auth_flag;
@end

@interface TVMTokenDataModel : JSONModel
@property (nonatomic , strong ) NSNumber<Optional>* status;
@property (nonatomic , strong ) NSString<Optional>* token;
@property (nonatomic , strong ) TVMTokenInfoModel<Optional>* data;
@end

@interface TVMTokenModel : JSONModel
@property (nonatomic , strong ) NSNumber<Optional>* status;
@property (nonatomic , strong ) NSString<Optional>* msg;
@property (nonatomic , strong ) TVMTokenDataModel<Optional>* data;
@end
