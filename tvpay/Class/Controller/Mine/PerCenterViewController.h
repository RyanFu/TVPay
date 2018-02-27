//
//  PerCenterViewController.h
//  tvpay
//
//  Created by dust.zhang on 2018/1/26.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HideTabBarViewController.h"
#import "PerCenterTableViewCell.h"
#import "TVMUserModel.h"

@interface PerCenterViewController : HideTabBarViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView         *tableView;
    NSArray             *arrCellHight;
    NSArray             *arrCellName;
}

@property (nonatomic , copy )TVMUserModel *_userModel;

@end
