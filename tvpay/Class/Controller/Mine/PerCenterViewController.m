//
//  PerCenterViewController.m
//  tvpay
//
//  Created by dust.zhang on 2018/1/26.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import "PerCenterViewController.h"

@interface PerCenterViewController ()

@end

@implementation PerCenterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =  COLORHEX(0xf4f3f2,1);
    self._labelTitle.text = @"个人信息";
    //cell行高
    arrCellHight = @[@10, @95, @50, @20, @55, @55, @55, @55, @44, @55, @55 ];
    arrCellName  = @[@"", @"头像",@"昵称",@"",@"性别",@"地区",@"我的地址",@"个性签名",@"账号绑定",@"微信",@"手机"];

    [self initController];
}

-(void) initController
{
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self._viewTop.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-self._viewTop.frame.size.height)];
    tableView.backgroundColor =  COLORHEX(0xf4f3f2,1);
    [tableView setSeparatorColor:COLORHEX(0xe4e4e4, 1)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark TableViewDelegate
//Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [arrCellHight[indexPath.row] intValue];
}

//Cell行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrCellHight count];
}

//Cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier= @"ActivityTableViewCell";
    PerCenterTableViewCell *perCenterCell = [[PerCenterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];;
    [perCenterCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    perCenterCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 3 || indexPath.row == 0 || indexPath.row == 8)
    {
        perCenterCell.accessoryType = UITableViewCellAccessoryNone;
        [perCenterCell setBackgroundColor:RGBA(243, 243, 242, 1)];
    }
 
    NSString *strCellTextLeftName = [arrCellName objectAtIndex:indexPath.row];
    [perCenterCell setPerCenterCellText:strCellTextLeftName model:self._userModel indexRow:indexPath.row];
    
    return perCenterCell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
