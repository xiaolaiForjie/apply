//
//  UIView+Utils.h
//  SanLianOrdering
//
//  Created by guojiang on 14-10-10.
//  Copyright (c) 2014年 DaCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Utils)

//给label指定text的颜色、字体
-(void)addAttributesText:(NSString *)text color:(UIColor *)color font:(UIFont *)font;

//给label指定text的颜色、字体大小(系统字体)
-(void)addAttributesText:(NSString *)text color:(UIColor *)color fontSize:(int)fontSize;

//给label指定text的颜色
-(void)addAttributesText:(NSString *)text color:(UIColor *)color;

//给label指定text的字体
-(void)addAttributesText:(NSString *)text font:(UIFont *)font;

//给label指定text的字体(系统字体)
-(void)addAttributesText:(NSString *)text fontSize:(int)fontSize;

@end
