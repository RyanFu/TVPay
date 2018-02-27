//
//  ImageDraw.h
//  tvpay
//
//  Created by dust.zhang on 2018/1/30.
//  Copyright © 2018年 jf.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageDraw : NSObject
/*
 将颜色转成图片
 */
+ (UIImage*) createImageWithColor: (UIColor*) color;

@end
