//
//  BaseTabBarViewController.h
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/7/1.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Macro.h"

@interface BaseTabBarViewController : UITabBarController

//tabBar背景颜色
#define TabBarBGColor [UIColor colorWithRed:255.f/255.f green:255.f/255.f blue:255.f/255.f alpha:1.f]

//tabBar文字颜色
#define TitleColor [UIColor colorWithRed:255.f/255.f green:255.f/255.f blue:255.f/255.f alpha:1.f]



//获取storyBoard  入口VC
#define boardVc(name)     ([[UIStoryboard storyboardWithName:name bundle:nil] instantiateInitialViewController])

//标题数组
#define TitleArr @[@"1",@"2",@"3",@"4"]
@property(nonatomic,strong)NSArray *titleArr;

//图片数组 正常  图片字符串
#define NormalArr @[@"home_btn_home",@"home_btn_borrowmoney",@"home_btn_me",@"home_btn_more"]
@property(nonatomic,strong)NSArray *normalArr;

//图片数组 高亮   
#define SelectArr @[@"home_btn_home_pre",@"home_btn_borrowmoney_pre",@"home_btn_me_pre",@"home_btn_more_pre"];
@property(nonatomic,strong)NSArray *selectArr;

//viewControllers数组  可为storyBoard名称字符串
#define VcControllers @[boardVc(@"Home"),boardVc(@"Borrow"),boardVc(@"User"),boardVc(@"More")]
@property(nonatomic,strong)NSArray *vcArr;


@property(nonatomic,readonly)NSInteger lastSelectedIndex;
@property(nonatomic,readonly)NSInteger currentSelectedIndex;

@end
