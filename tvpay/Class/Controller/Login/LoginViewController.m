//
//  LoginViewController.m
//  tvpay
//
//  Created by dust.zhang on 2018/1/30.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self._labelTitle.text = @"手机登录";
    [self._btnBack setHidden:YES];
    [self initController];
}
-(void) initController
{
    UIImageView *imageViewbg = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"image_loginbackground.png"]];
    imageViewbg.frame = CGRectMake(0, self._viewTop.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT);
    [imageViewbg setContentMode:UIViewContentModeScaleToFill];
    [self.view addSubview:imageViewbg];
    
    UIImageView *imageViewLogo = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"image_login_logo.png"]];
    imageViewLogo.frame = CGRectMake((SCREEN_WIDTH-300/3)/2, self._viewTop.frame.origin.y+self._viewTop.frame.size.height+48, 300/3, 72/3);
    [self.view addSubview:imageViewLogo];
    
    UILabel *labelVersion = [[UILabel alloc ] initWithFrame:CGRectMake(0, imageViewLogo.frame.origin.y+imageViewLogo.frame.size.height+12, SCREEN_WIDTH, 20)];
    [labelVersion setText:[NSString stringWithFormat:@"V%@",[Tool getAppVersion]] ];
    [labelVersion setFont:TVMFONT(20)];
    [labelVersion setTextColor:COLORHEX(0xc9c9c9, 1)];
    [labelVersion setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:labelVersion];
    
    //手机号输入
    UIImageView *imageViewTel = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"image_login_tel.png"]];
    imageViewTel.frame = CGRectMake((46+18)/2, labelVersion.frame.origin.y+labelVersion.frame.size.height+40, 60/3, 60/3);
    [self.view addSubview:imageViewTel];
    
    textTel = [[UITextField alloc ] initWithFrame:CGRectMake(imageViewTel.frame.origin.x+imageViewTel.frame.size.width+10,
                                                                          imageViewTel.frame.origin.y,
                                                                          SCREEN_HEIGHT-64,
                                                                          20)];
    [textTel setPlaceholder:@"请输入手机号"];
    [textTel setFont:TVMFONT(15)];
    [textTel setTextColor:[UIColor blackColor]];
    [textTel setKeyboardType:UIKeyboardTypePhonePad];
    [self.view addSubview:textTel];
    [textTel addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    UILabel *labelLine = [[UILabel alloc ] initWithFrame:CGRectMake(23, textTel.frame.origin.y+20+10, SCREEN_WIDTH-46, 1)];
    [labelLine setBackgroundColor:COLORHEX(0xc8c8c8, 1)];
    [self.view addSubview:labelLine];
    
    //验证码输入
    UIImageView *imageViewVerCode = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"image_login_ver.png"]];
    imageViewVerCode.frame = CGRectMake((46+18)/2, labelLine.frame.origin.y+labelLine.frame.size.height+40, 60/3, 60/3);
    [self.view addSubview:imageViewVerCode];
    
    textVerCode = [[UITextField alloc ] initWithFrame:CGRectMake(imageViewVerCode.frame.origin.x+imageViewVerCode.frame.size.width+10,
                                                                          imageViewVerCode.frame.origin.y,
                                                                          SCREEN_HEIGHT-64,
                                                                          20)];
    [textVerCode setPlaceholder:@"请输入验证码"];
    [textVerCode setFont:TVMFONT(15)];
    [textVerCode setTextColor:[UIColor blackColor]];
    [textVerCode setKeyboardType:UIKeyboardTypePhonePad];
    [self.view addSubview:textVerCode];
    
    //获取验证码
    btnCode = [[JKCountDownButton alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH-90-33,textVerCode.frame.origin.y , 90, 25)];
    [btnCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    [btnCode setBackgroundImage:[ImageDraw createImageWithColor:COLORHEX(0xf55145, 1)] forState:UIControlStateNormal];
    [btnCode setBackgroundImage:[ImageDraw createImageWithColor:COLORHEX(0xf13129, 1)] forState:UIControlStateHighlighted];
    [btnCode.titleLabel setFont:TVMFONT(15)];
    [btnCode.titleLabel setTextColor:RGBA(0, 0, 0, 1)];
    [btnCode.layer setCornerRadius:25/2 ];
    [btnCode.layer setMasksToBounds:YES];
    [btnCode addTarget:self action:@selector(onButtonCode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnCode];
    
    labelLine = [[UILabel alloc ] initWithFrame:CGRectMake(23, textVerCode.frame.origin.y+20+10, SCREEN_WIDTH-46, 1)];
    [labelLine setBackgroundColor:COLORHEX(0xc8c8c8, 1)];
    [self.view addSubview:labelLine];
    
    UILabel *labelTip = [[UILabel alloc ] initWithFrame:CGRectMake(0, labelLine.frame.origin.y+56/2, SCREEN_WIDTH, 14)];
    [labelTip setTextColor:COLORHEX(0xf55145, 1)];
    [labelTip setText:@"仅供中国大陆(+86)手机号注册使用"];
    [labelTip setTextAlignment:NSTextAlignmentCenter];
    [labelTip setFont:TVMFONT(14)];
    [self.view addSubview:labelTip];
    
    //登录按钮
    UIButton *btnLogin = [[UIButton alloc ] initWithFrame:CGRectMake(23, labelLine.frame.origin.y+136/2, SCREEN_WIDTH-46, 45)];
    [btnLogin setTitle:@"登录" forState:UIControlStateNormal];
    [btnLogin setBackgroundImage:[ImageDraw createImageWithColor:COLORHEX(0xf55145, 1)] forState:UIControlStateNormal];
    [btnLogin setBackgroundImage:[ImageDraw createImageWithColor:COLORHEX(0xf13129, 1)] forState:UIControlStateHighlighted];
    [btnLogin.titleLabel setFont:TVMFONT(17)];
    [btnLogin.titleLabel setTextColor:RGBA(0, 0, 0, 1)];
    [btnLogin.layer setCornerRadius:45/2 ];
    [btnLogin.layer setMasksToBounds:YES];
    [btnLogin addTarget:self action:@selector(onButtonLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLogin];
}

-(void) onButtonLogin
{
    if ( textTel.text.length != 11 )
    {
        [Tool showWarningTip:@"手机号错误"  time:1];
        return;
    }
    if ( textTel.text.length == 0 )
    {
        [Tool showWarningTip:@"请输入手机号"  time:1];
        return;
    }
    if ( textVerCode.text.length == 0 )
    {
        [Tool showWarningTip:@"请输入验证码"  time:1];
        return;
    }
    [self requestLogin];
    
}

#pragma mark 调取登录接口
-(void) requestLogin
{
    [ServiceLogin requestLogin:textTel.text authCode:textVerCode.text model:^(TVMLoginModel *LoginModel)
    {
        [TVMConfig saveLoginState:@"YES"];
        [TVMConfig saveToken:LoginModel.data.token];
        [TVMConfig saveTvmid:LoginModel.data.data.tvmid];
        
        [self.navigationController popViewControllerAnimated:YES];
        [Tool showTabBar];
        
        //刷新首页用户头像和金币
        [[NSNotificationCenter defaultCenter ] postNotificationName:NOTIFICATION_REFRESHUSERINFO object:nil];
        [[NSNotificationCenter defaultCenter ] postNotificationName:NOTIFICATION_REFRESHGOLDCOIN object:nil];
        
    } failure:^(NSError *error) {
        [Tool showWarningTip:error.domain time:1];
    }];
    
}
-(void)textFieldDidChange:(UITextField*)textField
{
    int maxLength = 0;
    if (textField == textTel && textField.text.length > 11)
    {
        maxLength = 11;
        textField.text = [textField.text substringToIndex:maxLength];
    }
    
}

#pragma mark 获取验证码
-(void) onButtonCode:(JKCountDownButton*) sender
{
    if ( textTel.text.length != 11 )
    {
        [Tool showWarningTip:@"手机号错误"  time:1];
        return;
    }
    if ( textTel.text.length == 0 )
    {
        [Tool showWarningTip:@"请输入手机号"  time:1];
        return;
    }
    
    [ServiceLogin getLoginCode:textTel.text model:^(RequestResultsModel *model)
    {
        [sender setEnabled:NO];
        __weak typeof(self) weakSelf = self;
        [sender setTitle:@"60s" forState:UIControlStateNormal];
        [btnCode setTitleColor:RGBA(194, 194, 194, 1) forState:UIControlStateNormal];
        [btnCode.titleLabel setTextAlignment:NSTextAlignmentRight];
        [btnCode setBackgroundImage:[ImageDraw createImageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
        
        [sender startWithSecond:60];
        [sender didChange:^NSString *(JKCountDownButton *button,int second)
         {
             NSString *title = [NSString stringWithFormat:@"%ds",second];
             return title;
         }];
        
        [sender didFinished:^NSString *(JKCountDownButton *button, int second)
         {
             [weakSelf showButton];
             return @"获取验证码";
         }];
        
    } failure:^(NSError *error) {
        [Tool showWarningTip:error.domain time:1];
    }];
}
-(void) showButton
{
    [btnCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    [btnCode setBackgroundImage:[ImageDraw createImageWithColor:COLORHEX(0xf55145, 1)] forState:UIControlStateNormal];
    [btnCode setBackgroundImage:[ImageDraw createImageWithColor:COLORHEX(0xf13129, 1)] forState:UIControlStateHighlighted];
    [btnCode setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnCode setEnabled:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
