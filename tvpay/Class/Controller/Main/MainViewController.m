//
//  ViewController.m
//  TVWallets
//
//  Created by dust.zhang on 2018/1/24.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

-(void) viewWillAppear:(BOOL)animated
{
    [Tool showTabBar];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //白色电池条
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    arrGoldName = @[@" 游戏金币",@" 钻石",@" 碎片"];
    arrGoldImage = @[@"image_jinbi.png",@"image_zuanshi.png",@"image_suipian.png"];
    
    [self initController];
    //刷新用户头像
    [self refreshUserHead];
    //刷新用户金币
    [self refreshGold];
    
     [[NSNotificationCenter defaultCenter ] addObserver:self
                                               selector:@selector(refreshUserHead)
                                                   name:NOTIFICATION_REFRESHUSERINFO
                                                 object:nil];
    
    [[NSNotificationCenter defaultCenter ] addObserver:self
                                              selector:@selector(refreshGold)
                                                  name:NOTIFICATION_REFRESHGOLDCOIN
                                                object:nil];
}

-(void) initController
{
    UIView *viewHead = [[UIView alloc ] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40+380/2)];
    [viewHead setBackgroundColor:RGBA(241, 83, 75, 1)];
    [self.view addSubview:viewHead];
    
    //用户头像
    imageview = [[UIImageView alloc ] initWithFrame:CGRectMake(10, 44, 96/2, 96/2)];
    [imageview setUserInteractionEnabled:YES];
    [imageview.layer setMasksToBounds:YES ];
    [imageview.layer setCornerRadius:96/4];
    [imageview.layer setBorderColor:RGBA(255, 255, 255, 0.5).CGColor];
    [imageview.layer setBorderWidth:3];
    [viewHead addSubview:imageview];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc ] initWithTarget:self action:@selector(personCenter)];
    [imageview addGestureRecognizer:tap];
    //昵称
    labelNick = [[UILabel alloc ] initWithFrame:CGRectMake(imageview.frame.origin.x+imageview.frame.size.width+9, imageview.frame.origin.y, 200, imageview.frame.size.height)];
    [labelNick setFont:TVMBLODFONT(17)];
    [labelNick setTextColor:[UIColor whiteColor]];
    [viewHead addSubview:labelNick];
    
    
    //币的数量
    for (int i = 0; i < 3 ; i++ )
    {
        //数量
        labelGoldCount[i] = [[UILabel alloc ] initWithFrame:CGRectMake(i*(SCREEN_WIDTH/3), imageview.frame.origin.y+imageview.frame.size.height+28/2, SCREEN_WIDTH/3, 130/2)];
        [labelGoldCount[i] setText:@"0"];
        [labelGoldCount[i] setFont:TVMFONT(30)];
        [labelGoldCount[i] setTextColor:[UIColor whiteColor]];
        [labelGoldCount[i] setTextAlignment:NSTextAlignmentCenter];
        [viewHead addSubview:labelGoldCount[i]];
        
        UILabel *labelLine = [[UILabel alloc ] initWithFrame:CGRectMake(i*(SCREEN_WIDTH/3), labelGoldCount[i].frame.origin.y, 1, 130/2)];
        [labelLine setBackgroundColor:RGBA(255, 255, 255, 0.3)];
        [viewHead addSubview:labelLine];
        
        //游戏金币
        UILabel *labelGameGold = [[UILabel alloc ] initWithFrame:CGRectMake(i*(SCREEN_WIDTH/3), labelLine.frame.origin.y+labelLine.frame.size.height+32/2, SCREEN_WIDTH/3, 14)];
        [labelGameGold setFont:TVMFONT(14)];
        [labelGameGold setTextColor:[UIColor whiteColor]];
        [labelGameGold setTextAlignment:NSTextAlignmentCenter];
        [viewHead addSubview:labelGameGold];
        [Tool setLabelImageFont:arrGoldName[i] image:arrGoldImage[i] imageSize:CGRectMake(0,-3,42/3,42/3) insertIndex:0 label:labelGameGold];
        
    }
    
    //创建webview
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, viewHead.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-viewHead.frame.size.height) configuration:config];
    [wkWebView setBackgroundColor:RGBA(12, 28, 52, 1)];
    wkWebView.navigationDelegate = self;
    wkWebView.UIDelegate=self;
    [self.view addSubview:wkWebView];
    [wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URL_MAIN]]];

}

#pragma mark -- 个人中心
-(void)personCenter
{
    PerCenterViewController *perCenterController = [[PerCenterViewController alloc] init];
    perCenterController._userModel = userModel;
    [self.navigationController pushViewController:perCenterController animated:YES];
}

#pragma mark -- 刷新币的数量
-(void) refreshGold
{
    if ([TVMConfig getLoginState])
    {
        [ServicesUser getGoldCoinCount:[TVMConfig getTvmid] token:[TVMConfig getToken] model:^(GoldCoinModel *model)
         {
             [labelGoldCount[0] setText:[Tool GoldCoinIsNull:model.coins]  ];
             [labelGoldCount[1] setText:[Tool GoldCoinIsNull:model.diamonds]];
             [labelGoldCount[2] setText:[Tool GoldCoinIsNull:model.pieces]];
             
         } failure:^(NSError *error) {
             [Tool showWarningTip:@"错误接口：getGoldCoinCount" time:1];
         }];
    }
   
}
#pragma mark -- 刷新用户头像和昵称
-(void) refreshUserHead
{
    if ([TVMConfig getLoginState])
    {
        [ServicesUser getUserInfo:[TVMConfig getTvmid] token:[TVMConfig getToken] model:^(TVMUserModel *model)
         {
             userModel = [[TVMUserModel alloc ] init ];
             userModel = model;
             [Tool downloadImage:model.data.data.head_img button:nil imageView:imageview defaultImage:@""];
             [labelNick setText:model.data.data.nickname];
             
         } failure:^(NSError *error) {
             [Tool showWarningTip:error.domain time:1];
         }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
