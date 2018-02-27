//
//  AppDelegate.m
//  TVWallets
//
//  Created by dust.zhang on 2018/1/24.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    //初始化tabbar
    [self initTabbar];
    [self updateToken];
    return YES;
}

-(void) initTabbar
{
    NSArray *tabImageLight = [NSArray arrayWithObjects:@"tab_mainIcon_s.png",@"tab_setIcon_d.png", nil];
    NSArray *tabLabelName = [NSArray arrayWithObjects:@"电视钱包",@"设置", nil];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self._tabBarView=[[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-tabbarHeight, SCREEN_WIDTH,tabbarHeight)];
    //首页
    MainViewController *mainController = [[MainViewController alloc] init];
    navMainController = [[UINavigationController alloc] initWithRootViewController:mainController];
    [navMainController setNavigationBarHidden:YES];
    //设置
    SetViewController *setController = [[SetViewController alloc] init];
    navSetController = [[UINavigationController alloc] initWithRootViewController:setController];
    [navSetController setNavigationBarHidden:YES];

    [self.window setRootViewController:mainController];
    [self.window makeKeyAndVisible];
    
    for (int i = 0; i < [tabImageLight count]; i++)
    {
        //点击的按钮
        _btnTabBar[i] = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnTabBar[i].frame = CGRectMake((SCREEN_WIDTH/[tabImageLight count])*i, 0, SCREEN_WIDTH /[tabImageLight count], tabbarHeight);
        [_btnTabBar[i] setBackgroundColor:COLORHEX(0xfafafa,1)];
        _btnTabBar[i].tag=1000+i;
        [_btnTabBar[i] addTarget:self action:@selector(clickBtnTabBar:) forControlEvents:UIControlEventTouchUpInside];
        [self._tabBarView addSubview:_btnTabBar[i]];
        
        //按钮上的图片
        _imageTabBar[i] = [[UIImageView alloc] initWithFrame:CGRectMake((_btnTabBar[i].frame.size.width-(84/3))/2, 6, 84/3, 84/3)];
        _imageTabBar[i].backgroundColor = [UIColor clearColor];
        [_imageTabBar[i] setImage:[UIImage imageNamed:tabImageLight[i] ]];
        [_btnTabBar[i] addSubview:_imageTabBar[i]];
        
        
        //按钮上的文字
        _labelTabBar[i] = [[UILabel alloc] initWithFrame:CGRectMake( (SCREEN_WIDTH/2)*i, 6+56/2 +4, SCREEN_WIDTH/2, 14)];
        _labelTabBar[i].backgroundColor = [UIColor clearColor];
        [_labelTabBar[i] setFont:TVMFONT(11)];
        [_labelTabBar[i] setTextAlignment:NSTextAlignmentCenter];//文字居中对齐
        [_labelTabBar[i] setText:tabLabelName[i]];
        [self._tabBarView addSubview:_labelTabBar[i]];
    }
    [self.window addSubview:self._tabBarView];
    [self.window bringSubviewToFront:self._tabBarView];
    [self clickBtnTabBar:_btnTabBar[0]];
}

-(void)clickBtnTabBar:(UIButton *)btn
{
    switch (btn.tag)
    {
        case 1000:
        {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
            [_imageTabBar[0] setImage:[UIImage imageNamed:@"tab_mainIcon_s.png" ]];
            [_imageTabBar[1] setImage:[UIImage imageNamed:@"tab_setIcon_d.png" ]];
            
            [_labelTabBar[0] setTextColor:COLORHEX(0xf55245,1)];
            [_labelTabBar[1] setTextColor:COLORHEX(0xa0a0a0,1)];
            
            [self.window setRootViewController:navMainController];
        }
            break;
        case 1001:
        {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
            [_imageTabBar[0] setImage:[UIImage imageNamed:@"tab_mainIcon_d.png" ]];
            [_imageTabBar[1] setImage:[UIImage imageNamed:@"tab_setIcon_s.png" ]];
            
            [_labelTabBar[0] setTextColor:COLORHEX(0xa0a0a0,1)];
            [_labelTabBar[1] setTextColor:COLORHEX(0xf55245,1)];
            
            [self.window setRootViewController:navSetController];
          
        }
            break;
        default:
            break;
    }
    [self.window bringSubviewToFront:self._tabBarView];
}

#pragma mark 更新token
-(void) updateToken
{
//    [ServicesUser updateToken:[TVMConfig getTvmid] token:[TVMConfig getToken] macaddress:[Tool getMacAddress] model:^(TVMTokenModel *model)
//    {
//
//    } failure:^(NSError *error) {
//
//    }];
}
#pragma -- mark 系统回调
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
