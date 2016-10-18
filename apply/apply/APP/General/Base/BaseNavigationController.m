//
//  BaseNavigationController.m
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/7/1.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#import "BaseNavigationController.h"

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backGroundColor = COLOR_NAVBAR_BG;
    self.titleColor = COLOR_BAR_TITLE;
    self.titleSize = FONT_BAR_TITIE;
    [self customNavigationBar];
}

#pragma mark --自定义导航栏
-(void)customNavigationBar
{
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                               NSFontAttributeName:[UIFont boldSystemFontOfSize:self.titleSize]
                                               };
    self.navigationBar.barTintColor = self.backGroundColor;
    
    self.navigationBar.tintColor = self.titleColor;
    
}

@end
