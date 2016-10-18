//
//  AppMacro.h
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/6/25.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#ifndef ZXK_FrameWork_AppMacro_h
#define ZXK_FrameWork_AppMacro_h

#pragma mark - 发布有关的设置




//////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - 界面相关

//屏幕rect
#define ScreenRect                          [[UIScreen mainScreen] bounds]

//屏幕宽度
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width

//屏幕高度
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height

#pragma mark - 项目相关

//发布版本号
#define APPVersionNumber                        [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//应用名称
#define APPName                                 [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleNameKey]

//应用当前window
#define APPWindow                               ((UIWindow *)[[[UIApplication sharedApplication] windows] lastObject])

//应用主window
#define APPKeyWindow                           ([[UIApplication sharedApplication] keyWindow])

//appdelegate
#define APPDelegate                 ((AppDelegate *)[[UIApplication sharedApplication] delegate])


#pragma mark - 设备相关
//系统版本
#define IOSVersion                          [[[UIDevice currentDevice] systemVersion] floatValue]
//
#define IsIOS7                         (IOSVersion < 8.0)
#define IsIOS8                         (IOSVersion >= 8.0)

//设备名称 my iphone
#define DeviceName                              [[UIDevice currentDevice] name]
//设备系统类型 IOS IPad
#define DeviceSystemName                             [[UIDevice currentDevice] systemName]
//设备系统版本 7.0 8.0
#define DeviceVersion                           [[UIDevice currentDevice] systemVersion]



#endif
