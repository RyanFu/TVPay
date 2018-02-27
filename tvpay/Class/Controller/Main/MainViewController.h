//
//  ViewController.h
//  TVWallets
//
//  Created by dust.zhang on 2018/1/24.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "PerCenterViewController.h"
#import "ServicesUser.h"

@interface MainViewController : UIViewController<WKUIDelegate,WKNavigationDelegate>
{
    NSArray         *arrGoldName;
    NSArray         *arrGoldImage;
    UILabel         *labelGoldCount[3];

    UIImageView     *imageview;
    UILabel         *labelNick;
    TVMUserModel    *userModel;
    WKWebView       *wkWebView;
    
}

@end

