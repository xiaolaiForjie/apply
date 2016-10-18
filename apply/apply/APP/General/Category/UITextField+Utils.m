//
//  UITextField+Utils.m
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/7/8.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#import "UITextField+Utils.h"

@implementation UITextField (Utils)

-(void)setPlaceholderTextColor:(UIColor *)color
{
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:color}];
}

@end
