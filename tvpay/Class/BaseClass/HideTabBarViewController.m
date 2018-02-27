//
//  HideTabBarViewController.m
//  supercinema
//
//  Created by dust on 16/10/12.
//
//

#import "HideTabBarViewController.h"

@interface HideTabBarViewController ()

@end

@implementation HideTabBarViewController

- (void)viewDidLoad
{
    //电池条变为黑色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    [Tool hideTabBar];
    [super viewDidLoad];
    [self.view setBackgroundColor:RGBA(246, 246, 250, 1)];
    [self initTopView];
}

-(void)initTopView
{
    //顶部View
    self._viewTop = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    self._viewTop.backgroundColor = COLORHEX(0xfafafa,1);
    [self.view addSubview:self._viewTop];
    
    //标题
    self._labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(41, 35, SCREEN_WIDTH-41*2, 17)];//23+15;SCREEN_WIDTH-(23+15)*2
    [self._labelTitle setBackgroundColor:[UIColor clearColor]];
    [self._labelTitle setTextColor:RGBA(51, 51, 51,1)];
    [self._labelTitle setTextAlignment:NSTextAlignmentCenter];
    [self._labelTitle setFont:TVMBLODFONT(17)];
    [self._labelTitle setUserInteractionEnabled:YES];
    [self._viewTop addSubview:self._labelTitle];
    
    //描边
    self._labelLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 63.5, SCREEN_WIDTH, 0.5)];
    [self._labelLine setBackgroundColor:RGBA(0, 0, 0, 0.05)];
    [self._viewTop addSubview:self._labelLine];
    
    //返回按钮
    self._btnBack = [[UIButton alloc] initWithFrame:CGRectMake(0, 28, 82/2, 30)];
    [self._btnBack setImage:[UIImage imageNamed:@"button_back"] forState:UIControlStateNormal];
    [self._btnBack setImage:[UIImage imageNamed:@"button_back_touch"] forState:UIControlStateHighlighted];
    [self._btnBack addTarget:self action:@selector(onButtonBack) forControlEvents:UIControlEventTouchUpInside];
    [self._viewTop addSubview:self._btnBack];
}

//返回按钮
-(void)onButtonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) hideBackButton
{
    [self._btnBack setHidden:YES];
}


-(void) backViewControllor:(NSError *)error index:(int)index
{
   [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
