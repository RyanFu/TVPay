//
//  PerCenterTableViewCell.h
//  tvpay
//
//  Created by dust.zhang on 2018/1/31.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TVMUserModel.h"

@interface PerCenterTableViewCell : UITableViewCell
{
    UILabel         *labelLeftName;
    UILabel         *labelRightName;
    UIImageView     *imageViewHead;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

-(void) setPerCenterCellText:(NSString *)leftName model:(TVMUserModel *)uModel indexRow:(NSInteger)row;

@end
