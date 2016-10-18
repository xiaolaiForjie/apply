//
//  BaseViewController.h
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/6/29.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface BaseViewController : UIViewController
//背景颜色
#define BGColor [UIColor colorWithRed:255.f/255.f green:255.f/255.f blue:255.f/255.f alpha:1.f]
//按钮
@property(nonatomic,strong)UIButton *leftBarButton;
//图标
@property(nonatomic,copy)NSString *leftBarItemIcon;
//文本
@property(nonatomic,copy)NSString *leftBarItemTitle;
//文本字体大小
@property(nonatomic,assign)float leftBarItemSize;

@property(nonatomic,strong)UIButton *rightBarButton;
@property(nonatomic,copy)NSString *rightBarItemIcon;
@property(nonatomic,copy)NSString *rightBarItemTitle;
@property(nonatomic,assign)float rightBarItemSize;

#pragma 导航栏左右按钮加载
- (void)loadLeftBarButtonItem;
- (void)loadRightBarButtonItem;

#pragma 导航栏左右按钮事件
-(void)leftBarBtnItemClick:(UIButton *)sender;
-(void)rightBarBtnItemClick:(UIButton *)sender;

@end
