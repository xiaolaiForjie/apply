//
//  ZxkAnimation.m
//  Ucard
//
//  Created by Ucard on 14-3-1.
//  Copyright (c) 2014年 Orange. All rights reserved.
//

#import "ZxkAnimation.h"
#import <QuartzCore/QuartzCore.h>

@implementation ZxkAnimation

//透明+缩放
+ (void)animation:(UIView *)view isExist:(BOOL)exist
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    // 动画持续1.5s
    anim.duration = 0.6;
    // scale在0与1之间互换
    if(!exist)
    {
        anim.fromValue = [NSNumber numberWithFloat:0.0f];
        anim.toValue = [NSNumber numberWithFloat:1.0f];
        [self hidden:view :YES];
    }
    else
    {
        anim.fromValue = [NSNumber numberWithFloat:1.0];
        anim.toValue = [NSNumber numberWithFloat:0.0f];
        [self hidden:view :NO];
    }
    
    //动画开始结束的快慢，设置为加速
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    // 设置动画的代理
    anim.delegate = self;
    
    // 保持动画执行后的状态
    anim.removedOnCompletion = YES;
    anim.fillMode = kCAFillModeForwards;
    
    // 添加动画对象到图层上
    [view.layer addAnimation:anim forKey:@"scale"];
}

+ (void)hidden:(UIView *)view :(BOOL)hidden
{
    [UIView beginAnimations:@"scale" context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    if(hidden)
    {
        view.alpha = 1;
    }
    else
    {
        view.alpha = 0;
    }
    [UIView commitAnimations];
}

+ (void)cutAnimationWithViewController:(UIViewController *)vc      ispush:(BOOL)push            pushViewController:(UIViewController *)pc        type:(NSString *)type subtype:(NSString *)subtype
{
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = type;
    animation.subtype = subtype;
    [vc.navigationController.view.layer addAnimation:animation forKey:nil];
    if(push)
    {
        [vc.navigationController pushViewController:pc animated:NO];
    }
    else
    {
        [vc.navigationController popViewControllerAnimated:NO];
    }
}

+ (void)moveAnimationWithView:(UIView *)v ToPoint:(CGPoint)p Duration:(NSTimeInterval)d
{
    [UIView beginAnimations:@"move" context:nil];
    [UIView setAnimationDuration:d];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    v.center = CGPointMake(p.x, p.y);
    [UIView commitAnimations];
}

+ (void)fanzhuanAnimationWithView:(UIView *)v FromIndex:(NSInteger)f ToIndex:(NSInteger)t  Duration:(NSTimeInterval)d
{
    [UIView beginAnimations:@"fanzhuan" context:nil];
    [UIView setAnimationDuration:d];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp  forView:v cache:YES];
    [v exchangeSubviewAtIndex:f withSubviewAtIndex:t];
    [UIView commitAnimations];
}

+ (void)rotationAnimationWithView:(UIView *)v Angle:(double)a Duration:(NSTimeInterval)d
{
    [UIView beginAnimations:@"rotation" context:nil];
    [UIView setAnimationDuration:d];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    v.transform = CGAffineTransformMakeRotation(a);
    [UIView commitAnimations];
}

+ (void)moveAnimationWithView:(UIView *)v fromPoint:(CGPoint)f ToPoint:(CGPoint)t Duration:(NSTimeInterval)d
{
    // 说明这个动画对象要对CALayer的position属性执行动画
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];
    // 动画持续
    anim.duration = d;
    
    // position属性值从(50, 80)渐变到(300, 350)
    anim.fromValue = [NSValue valueWithCGPoint:f];
    anim.toValue = [NSValue valueWithCGPoint:t];
    
    [self hidden:v :YES];
    // 设置动画的代理
//    anim.delegate = self;
    // 保持动画执行后的状态
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.autoreverses = NO;
    
    // 添加动画对象到图层上
    [v.layer addAnimation:anim forKey:nil];
}

+ (void)shakeAnimationWithView:(UIView *)v fromValue:(CGFloat)f ToValue:(CGFloat)t Duration:(NSTimeInterval)d
{
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    shake.fromValue = [NSNumber numberWithFloat:f];
    
    shake.toValue = [NSNumber numberWithFloat:t];
    
    shake.duration = d;
    
    shake.autoreverses = YES; //是否重复
    
    shake.repeatCount = 10;
    
    [v.layer addAnimation:shake forKey:nil];
}

+ (void)scaleAnimationWithView:(UIView *)v fromValue:(CGFloat)f ToValue:(CGFloat)t Duration:(NSTimeInterval)d
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    // 动画持续1.5s
    anim.duration = d;
    
    // position属性值从(50, 80)渐变到(300, 350)
    anim.fromValue = [NSNumber numberWithFloat:f];
    anim.toValue = [NSNumber numberWithFloat:t];
    
    //动画开始结束的快慢，设置为加速
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    // 设置动画的代理
    anim.delegate = self;
    
    // 保持动画执行后的状态
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.autoreverses = YES;
    
    // 添加动画对象到图层上
    [v.layer addAnimation:anim forKey:@"scale"];
}

+ (void)colorAnimationWithView:(UIView *)v fromValue:(UIColor *)f ToValue:(UIColor *)t Duration:(NSTimeInterval)d
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    // 动画持续
    anim.duration = d;
    
    // position属性值从(50, 80)渐变到(300, 350)
    anim.fromValue = (id)f.CGColor;
    anim.toValue = (id)t.CGColor;
    
    //动画开始结束的快慢，设置为加速
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    // 设置动画的代理
    anim.delegate = self;
    
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.autoreverses = YES;
    
    // 添加动画对象到图层上
    [v.layer addAnimation:anim forKey:nil];
}

+ (void)animationWithBlock:(void(^)(void))block Duration:(NSTimeInterval)d
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:d];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    block();
    [UIView commitAnimations];
}


@end
