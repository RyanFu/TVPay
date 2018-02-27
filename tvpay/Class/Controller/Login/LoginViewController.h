//
//  LoginViewController.h
//  tvpay
//
//  Created by dust.zhang on 2018/1/30.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HideTabBarViewController.h"
#import "ImageDraw.h"
#import "ServiceLogin.h"
#import "JKCountDownButton.h"

@interface LoginViewController : HideTabBarViewController
{
    UITextField             *textTel;
    UITextField             *textVerCode;
    JKCountDownButton       *btnCode;
}
@end
