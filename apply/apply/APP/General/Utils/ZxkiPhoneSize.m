//
//  ZxkiPhoneSize.m
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/7/10.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#import "ZxkiPhoneSize.h"

@implementation ZxkiPhoneSize

//转换手机尺寸
+ (CGSize)getIphoneSizeWithIphone5Size:(CGSize)size
{
    CGFloat w = size.width;
    CGFloat h = size.height;
    if([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
    {
        float f = 750.f/640.f;
        float f1 = 1334.f/1136.f;
        return CGSizeMake(w*f,h*f1);
    }
    else if ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
    {
        float f = 1080.f/640.f*0.65;
        float f1 = 1920.f/1136.f*0.65;
        return CGSizeMake(w*f,h*f1);
    }
    else
    {
        return CGSizeMake(w,h);
    }
}

//转换手机尺寸
+ (CGFloat)getIphoneWideWithIphone5Wide:(CGFloat)wide
{
    if([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
    {
        float f = 750.f/640.f;
        return wide*f;
    }
    else if ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
    {
        float f = 1080.f/640.f*0.65;
        return wide*f;
    }
    else
    {
        return wide;
    }
}

//转换手机尺寸
+ (CGFloat)getIphoneHeightWithIphone5Height:(CGFloat)height
{
    if([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
    {
        float f = 1334.f/1136.f;
        return height*f;
    }
    else if ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
    {
        float f = 1920.f/1136.f*0.65;
        return height*f;
    }
    else
    {
        return height;
    }
}


@end
