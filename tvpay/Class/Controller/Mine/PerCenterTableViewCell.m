//
//  PerCenterTableViewCell.m
//  tvpay
//
//  Created by dust.zhang on 2018/1/31.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import "PerCenterTableViewCell.h"

@implementation PerCenterTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self initCell];
        
    }
    return self;
}

//初始化
-(void)initCell
{
    [self setBackgroundColor:RGBA(246, 246, 251, 1)];
    
    labelLeftName = [[UILabel alloc ] initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH-40, 55)];
    [labelLeftName setFont:TVMFONT(17)];
    [labelLeftName setTextColor:[UIColor blackColor]];
    [labelLeftName setTextAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:labelLeftName];
    
    labelRightName = [[UILabel alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH-(SCREEN_WIDTH/3)-40, 55)];
    [labelRightName setFont:TVMFONT(17)];
    [labelRightName setBackgroundColor:[UIColor clearColor]];
    [labelRightName setTextColor:RGBA(194, 194, 194, 1)];
    [labelRightName setTextAlignment:NSTextAlignmentRight];
    [self.contentView addSubview:labelRightName];
    
    //用户头像
    imageViewHead = [[UIImageView alloc ] initWithFrame:CGRectMake(SCREEN_WIDTH-40-75, 10, 75, 75)];
    [imageViewHead setBackgroundColor:[UIColor whiteColor]];
    [imageViewHead setUserInteractionEnabled:YES];
    [imageViewHead.layer setMasksToBounds:YES ];
    [imageViewHead.layer setCornerRadius:75/2];
    [self.contentView addSubview:imageViewHead];
    [imageViewHead setHidden:YES];
}

-(void) setPerCenterCellText:(NSString *)leftName model:(TVMUserModel *)uModel indexRow:(NSInteger)row
{
    if (row == 1 )
    {
        labelLeftName.frame  = CGRectMake(20, 0, SCREEN_WIDTH-40, 110);
        [imageViewHead setHidden:NO];
        [imageViewHead sd_setImageWithURL:[NSURL URLWithString:uModel.data.data.head_img]];
    }
    if (row == 2 )//昵称
    {
        [labelRightName setText:uModel.data.data.nickname];
    }
    if (row == 4 )//性别
    {
        if ([uModel.data.data.sex intValue] == 0 )
        {
            [labelRightName setText:@"男"];
        }
        else
        {
            [labelRightName setText:@"女"];
        }
        
    }
    if (row == 5 )//地区
    {
        [labelRightName setText:uModel.data.data.user_address];
    }
    if (row == 6 )//我的地址
    {
        [labelRightName setText:uModel.data.data.addr];
    }
    if (row == 7 )//个性签名
    {
        [labelRightName setText:uModel.data.data.sign_info];
    }
    if (row == 9 )//微信
    {
//        [labelRightName setText:uModel.data.data.sign_info];
    }
    if (row == 10 )//手机
    {
        [labelRightName setText:uModel.data.data.mobile];
    }
    
    [ labelLeftName setText:leftName ];
}


@end
