//
//  TVMCommonDefine.h
//  TVMShakeTV
//
//  Created by 于云浩 on 2016/12/5.
//  Copyright © 2016年 TVM. All rights reserved.
//
#import <Foundation/Foundation.h>


#define IPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(320, 640), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size)) : NO)
#define IPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)
#define IPhone7 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1440,2560), [[UIScreen mainScreen] currentMode].size)) : NO)
#define IPhone7plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920), [[UIScreen mainScreen] currentMode].size) : NO)

#define     SYSTEMVERSION          [[[UIDevice currentDevice] systemVersion] floatValue]
//获取屏幕宽度
#define     SCREEN_WIDTH           [[UIScreen mainScreen] bounds].size.width
//获取屏幕高度
#define     SCREEN_HEIGHT          [[UIScreen mainScreen] bounds].size.height
//数组是否为空
#define     ARRAY_IS_EMPTY(array)  ((!array ||[array count] == 0)? 1: 0)

#define     WeakSelf(weakSelf)      __weak __typeof(&*self)weakSelf = self;

//颜色转换
#define RGBA(r,g,b,a)                   [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define COLORHEX(hexValue,a) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:a]

//字体
#define TVMFONT(size)                    [UIFont systemFontOfSize:size]
#define TVMBLODFONT(size)                [UIFont boldSystemFontOfSize:size]

#define tabbarHeight                    110/2

#define requestErrorTip     @"网络连接失败，请稍后重试"
#define noNetWorkCode       20000

//单例化一个类
#ifndef CP_SINGLETON_DECLARE
#define CP_SINGLETON_DECLARE(classname) + (classname *)shared##classname
#endif
#ifndef CP_SINGLETON_SYNTHESIZE
#define CP_SINGLETON_SYNTHESIZE(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}
#endif

