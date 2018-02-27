//
//  AppDelegate.h
//  TVWallets
//
//  Created by dust.zhang on 2018/1/24.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "SetViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController  *navMainController;
    UINavigationController  *navSetController;
    UIButton                *_btnTabBar[2];
    UIImageView             *_imageTabBar[2];
    UILabel                 *_labelTabBar[2];
    
}

@property (strong, nonatomic) UIView            *_tabBarView;
@property (strong, nonatomic) UIWindow          *window;


@end

