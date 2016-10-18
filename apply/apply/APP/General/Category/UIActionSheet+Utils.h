//
//  UIAlertView+Block.h
//  FenQiBao
//
//  Created by guojiang on 15/1/6.
//  Copyright (c) 2015年 DaChengSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActionSheet (Utils)

- (void)showInView:(UIView *)view completeBlock:(void (^)(NSInteger btnIndex)) block;

@end
