//
//  ZxkAnimation.h
//  Ucard
//
//  Created by Ucard on 14-3-1.
//  Copyright (c) 2014年 Orange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZxkAnimation : NSObject

//透明+缩放
+ (void)animation:(UIView *)view isExist:(BOOL)exist;

//转场动画
+ (void)cutAnimationWithViewController:(UIViewController *)vc      ispush:(BOOL)push            pushViewController:(UIViewController *)pc        type:(NSString *)type subtype:(NSString *)subtype;

#pragma mark 隐世动画
+ (void)moveAnimationWithView:(UIView *)v ToPoint:(CGPoint)p Duration:(NSTimeInterval)d;

+ (void)fanzhuanAnimationWithView:(UIView *)v FromIndex:(NSInteger)f ToIndex:(NSInteger)t  Duration:(NSTimeInterval)d;

+ (void)rotationAnimationWithView:(UIView *)v Angle:(double)a Duration:(NSTimeInterval)d;

#pragma mark 显示动画
+ (void)moveAnimationWithView:(UIView *)v fromPoint:(CGPoint)f ToPoint:(CGPoint)t Duration:(NSTimeInterval)d;

+ (void)shakeAnimationWithView:(UIView *)v fromValue:(CGFloat)f ToValue:(CGFloat)t Duration:(NSTimeInterval)d;

+ (void)scaleAnimationWithView:(UIView *)v fromValue:(CGFloat)f ToValue:(CGFloat)t Duration:(NSTimeInterval)d;

+ (void)colorAnimationWithView:(UIView *)v fromValue:(UIColor *)f ToValue:(UIColor *)t Duration:(NSTimeInterval)d;

+ (void)animationWithBlock:(void(^)(void))block Duration:(NSTimeInterval)d;

@end
