//
//  ImageDraw.m
//  tvpay
//
//  Created by dust.zhang on 2018/1/30.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import "ImageDraw.h"

@implementation ImageDraw

+ (UIImage*) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0,0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
