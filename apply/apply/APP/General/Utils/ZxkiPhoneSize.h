//
//  ZxkiPhoneSize.h
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/7/10.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZxkiPhoneSize : NSObject

+ (CGSize)getIphoneSizeWithIphone5Size:(CGSize)size;
+ (CGFloat)getIphoneWideWithIphone5Wide:(CGFloat)wide;
+ (CGFloat)getIphoneHeightWithIphone5Height:(CGFloat)height;

@end
