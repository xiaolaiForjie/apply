//
//  ZxkGCD.h
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/7/7.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZxkGCD : NSObject

//延迟GCD
+ (void)dispanchTimerWithTime:(float)time Block:(void(^)(void))block;


//定时器
+(ZxkGCD*)shareZxkGCD;

-(void)dispanchRepeatTimerWithRepeatTime:(float)time Block:(void(^)(void))block;

//开启
-(void)invalidate;

//暂停
-(void)fire;

@end
