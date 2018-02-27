//
//  ShowTabBarViewController.m
//  supercinema
//
//  Created by dust on 16/10/12.
//
//

#import "ShowTabBarViewController.h"

@interface ShowTabBarViewController ()

@end

@implementation ShowTabBarViewController

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [Tool showTabBar];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    //电池条变为黑色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    [Tool showTabBar];
    
    [self initTopView];
}

-(void)initTopView
{
    //顶部View
    self._viewTop = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    self._viewTop.backgroundColor = RGBA(249, 250, 251, 1);
    [self.view addSubview:self._viewTop];
    
    //标题
    self._labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(41, 30, SCREEN_WIDTH-41*2, 17)];//23+15;SCREEN_WIDTH-(23+15)*2
    [self._labelTitle setBackgroundColor:[UIColor clearColor]];
    [self._labelTitle setTextColor:RGBA(51, 51, 51,1)];
    [self._labelTitle setTextAlignment:NSTextAlignmentCenter];
    [self._labelTitle setFont:TVMFONT(17)];
    [self._labelTitle setUserInteractionEnabled:YES];
    [self._viewTop addSubview:self._labelTitle];
    
    //描边
    self._labelLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 63.5, SCREEN_WIDTH, 0.5)];
    [self._labelLine setBackgroundColor:RGBA(0, 0, 0, 0.05)];
    [self._viewTop addSubview:self._labelLine];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
