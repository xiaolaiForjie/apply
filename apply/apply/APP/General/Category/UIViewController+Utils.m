//
//  UIViewController+Utils.m
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/7/14.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#import "UIViewController+Utils.h"

@implementation UIViewController (Utils)

+(UIViewController*)getCurrentKeyController
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

@end
