//
//  SetViewController.m
//  TVWallets
//
//  Created by dust.zhang on 2018/1/24.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import "SetViewController.h"

@implementation SetViewController

-(void) viewWillAppear:(BOOL)animated
{
    [self showLoginView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self._labelTitle setText:@"设置"];
    
    [self initController];
}

-(void) initController
{
    UIImageView *imageViewLogo = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"image_login_logo.png"]];
    imageViewLogo.frame = CGRectMake((SCREEN_WIDTH-300/3)/2, self._viewTop.frame.origin.y+self._viewTop.frame.size.height+134, 300/3, 72/3);
    [self.view addSubview:imageViewLogo];
    
    UILabel *labelVersion = [[UILabel alloc ] initWithFrame:CGRectMake(0, imageViewLogo.frame.origin.y+imageViewLogo.frame.size.height+12, SCREEN_WIDTH, 20)];
    [labelVersion setText:[NSString stringWithFormat:@"V%@",[Tool getAppVersion]] ];
    [labelVersion setFont:TVMFONT(20)];
    [labelVersion setTextColor:COLORHEX(0xc9c9c9, 1)];
    [labelVersion setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:labelVersion];
    
    UIButton *btnLogOut = [[UIButton alloc ] initWithFrame:CGRectMake(0, labelVersion.frame.origin.y+230, SCREEN_WIDTH, 50)];
    [btnLogOut setTitle:@"退出登录" forState:UIControlStateNormal];
//    [btnLogin setBackgroundImage:[ImageDraw createImageWithColor:RGBA(245, 246, 247, 1)] forState:UIControlStateNormal];
//    [btnLogin setBackgroundImage:[ImageDraw createImageWithColor:COLORHEX(0xc9c9c9, 1)] forState:UIControlStateHighlighted];
    [btnLogOut setBackgroundColor:RGBA(245, 246, 247, 1)];
    [btnLogOut.titleLabel setFont:TVMFONT(15)];
    [btnLogOut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal  ];
    [btnLogOut addTarget:self action:@selector(onButtonLogOut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLogOut];
}

-(void) onButtonLogOut
{
    [TVMConfig clearUserDefaults];
    [self showLoginView];
}


-(void) showLoginView
{
    if ( ![TVMConfig getLoginState] )
    {
        LoginViewController *loginView = [[LoginViewController alloc ] init ] ;
        [self.navigationController pushViewController:loginView animated:NO];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
