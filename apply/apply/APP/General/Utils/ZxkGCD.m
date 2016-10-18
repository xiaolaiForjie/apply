//
//  ZxkGCD.m
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/7/7.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#import "ZxkGCD.h"

@interface ZxkGCD ()

@property (nonatomic) dispatch_source_t timerSource;

@end

@implementation ZxkGCD

//延迟GCD
+ (void)dispanchTimerWithTime:(float)time Block:(void(^)(void))block
{
    dispatch_time_t tim = dispatch_time(DISPATCH_TIME_NOW,(float_t)(time*NSEC_PER_SEC));
    dispatch_after(tim,dispatch_get_main_queue(), ^
                   {
                       block();
                   });
}

//定时器
+ (ZxkGCD*)shareZxkGCD {
    static ZxkGCD *gcd = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gcd = [[self alloc] init];
    });
    
    return gcd;
}

// 当第一次使用这个单例时，会调用这个init方法。
- (id)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

-(void)dispanchRepeatTimerWithRepeatTime:(int)time Block:(void(^)(void))block
{
    dispatch_queue_t queue = dispatch_queue_create("my queue", NULL);
    
    self.timerSource = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    __weak typeof(self)self1 = self;
    
    dispatch_source_set_timer(self1.timerSource, dispatch_walltime(DISPATCH_TIME_NOW, 0), time*NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(self1.timerSource, ^{
        block();
    });
    
    
}

-(void)invalidate
{
    dispatch_suspend(self.timerSource);
}

-(void)fire
{
    dispatch_resume(self.timerSource);
}

@end
