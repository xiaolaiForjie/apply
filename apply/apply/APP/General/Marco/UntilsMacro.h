//
//  UntilsMacro.h
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/6/25.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#ifndef ZXK_FrameWork_UntilsMacro_h
#define ZXK_FrameWork_UntilsMacro_h

#import "ZxkAnimation.h"
#import "ZxkArchiveFile.h"
#import "ZxkDate.h"
#import "ZxkDeviceInfo.h"
#import "ZxkEncrypt.h"
#import "ZxkGCD.h"
#import "ZxkImageActionSheet.h"
#import "ZxkiPhoneSize.h"
#import "ZxkReflect.h"
#import "ZxkRegular.h"

//颜色
#define RGB(r, g, b)                        [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//视图
#define Size(w, h)                          CGSizeMake(w, h)
#define Point(x, y)                         CGPointMake(x, y)
#define Rect(x, y, w, h)                    CGRectMake(x, y, w, h)

//NSObject


#endif
