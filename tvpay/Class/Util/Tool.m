//
//  Tool.m
//  movikr
//
//  Created by zeyuan on 15/5/27.
//  Copyright (c) 2015年 zeyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tool.h"

@implementation Tool



+(void)hideTabBar
{
    [UIView animateWithDuration:0.2
                     animations:^{
                         AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                         delegate._tabBarView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, tabbarHeight);
                     }];
}

+(void)showTabBar
{
    [UIView animateWithDuration:0.2
                     animations:^{
                         AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                         delegate._tabBarView.frame = CGRectMake(0, SCREEN_HEIGHT-tabbarHeight, SCREEN_WIDTH, tabbarHeight);
                     }];
}


+ (void)downloadImage:(NSString *)urlString button:(UIButton*)btn imageView:(UIImageView*)imageView defaultImage:(NSString*)defaultStr
{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    NSURL* url = [NSURL URLWithString:urlString];
    BOOL existBool = [manager diskImageExistsForURL:url];//判断是否有缓存
    if (existBool)
    {
        UIImage* image =  [[manager imageCache]imageFromDiskCacheForKey:url.absoluteString];
        if (btn)
        {
            [btn setBackgroundImage:image forState:UIControlStateNormal];
        }
        if (imageView)
        {
            imageView.image = image;
        }
    }
    else
    {
        if (btn)
        {
            [btn setBackgroundImage:[UIImage imageNamed:defaultStr] forState:UIControlStateNormal];
        }
        if (imageView)
        {
            imageView.image = [UIImage imageNamed:defaultStr];
        }
        [manager downloadImageWithURL:[NSURL URLWithString:urlString]
                                                       options:0
                                                      progress:nil
                                                     completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                                                         if (!error && image)
                                                         {
                                                             if (btn)
                                                             {
                                                                 [btn setBackgroundImage:image forState:UIControlStateNormal];
                                                             }
                                                             if (imageView)
                                                             {
                                                                 imageView.image = image;
                                                             }
                                                         }
                                                     }];
    }
}

+(NSNumber *) getSystemTime
{
    UInt64 systime = [[NSDate date] timeIntervalSince1970]*1000;
    NSNumber *newSystime = [NSNumber numberWithUnsignedInteger:systime];
    return newSystime;
}
+(NSMutableAttributedString *)setKeyAttributed:(NSString *)originResult key:(NSString *)searchKey fontSize:(UIFont*) font
{
    // 获取关键字的位置
    NSRange range = [[originResult lowercaseString] rangeOfString:[searchKey lowercaseString]];
    // 转换成可以操作的字符串类型.
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:originResult];
    // 添加属性(粗体)
    [attribute addAttribute:NSFontAttributeName value:font range:range];
    // 关键字高亮
    [attribute addAttribute:NSForegroundColorAttributeName value:RGBA(117, 112, 255, 1) range:range];
    return attribute;
}

/*
 fontText:要显示的文本内容
 imageName:图片名
 imageSize:图片的位置大小
 index:要把图片插入到哪个位置
*/
+(void)setLabelImageFont:(NSString *)fontText
                   image:(NSString *)imageName
               imageSize:(CGRect ) imageSize
             insertIndex:(NSInteger)index
                   label:(UILabel *)label
{
    // 1.创建一个富文本
    NSMutableAttributedString *attri =  [[NSMutableAttributedString alloc] initWithString:fontText];
    // 2.添加表情图片
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = [UIImage imageNamed:imageName];
    // 设置图片大小
    attch.bounds = imageSize;
    // 创建带有图片的富文本
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    // 插入某个位置
    [attri insertAttributedString:string atIndex:index];
    label.attributedText = attri;
}

/**
 *  获取系统版本号
 *
 *  @return 单精度版本号
 */
+(NSString *) getAppVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    //NSLog(@"%@",[infoDictionary objectForKey:@"CFBundleShortVersionString"]);
    return  [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

+(void) showWarningTip:(NSString *) message time:(float) delayTime
{
    if([message isEqualToString:@"未能找到使用指定主机名的服务器。"])
    {
        message = @"似乎已断开与互联网的连接";
    }
    if ([message isEqualToString:@"NSURLErrorDomain"])
    {
        return;
    }
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [FVCustomAlertView hideAlertFromView:window fading:NO];
    [FVCustomAlertView showDefaultWarningAlertOnView:window withTitle:message withBlur:NO allowTap:YES];
    [self performSelector:@selector(hideWarningTip:) withObject:window afterDelay:delayTime];
}
+(void)hideWarningTip:(UIWindow*)window
{
    UIWindow *window1 = [UIApplication sharedApplication].keyWindow;
    [FVCustomAlertView hideAlertFromView:window1 fading:NO];
}

+(NSString *)urlIsNull:(NSString *)url
{
    if([Tool isBlankString:url])
    {
        return @"";
    }
    else
    {
        return url;
    }
}

+(BOOL) isBlankString:(NSString *)string
{
    if (string == nil || string == NULL)
    {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)
    {
        return YES;
    }
    if ([string isEqualToString:@"(null)"])
    {
        return YES;
    }
    return NO;
}

+(NSString *) GoldCoinIsNull:(NSNumber *)count
{
    if ([count intValue] == 0)
    {
        return @"0";
    }
    if ([count intValue] >= 1000)
    {
        return [NSString stringWithFormat:@"%.2fk", [count floatValue]/1000 ];
    }
    else
    {
        [NSString stringWithFormat:@"%@k",count ];
    }
    return @"0";
}

+ (NSString *)getMacAddress
{
    return @"";//[UIDevice VKeyUUID];
}
@end
