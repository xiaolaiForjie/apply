//
//  NSString+Utils.h
//  SanLianOrdering
//
//  Created by shiqichao on 14-10-10.
//  Copyright (c) 2014年 DaCheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Utils)
#pragma mark --字符相关方法
- (NSString *)stringTrimWhitespace;//字符串去空格

#pragma mark --长度宽度相关方法
-(CGSize)stringWidthWithFontSize:(CGFloat)fontSize andHeight:(CGFloat)height; //获得UILabel在设置text后的真实长度
-(CGSize)stringheightWithFontSize:(CGFloat)fontSize andWidth:(CGFloat)width;//根据指定宽度，计算Label高度

#pragma mark --手机号码隐藏处理(加星号处理)
-(NSString *)securePhoneNumber;

#pragma mark --dictionaryToJson 
// Dictionary 转 Json String
+(NSString *)dictionaryToJsonStr:(id)dic;

// 十六进制转换为普通字符串的。
- (NSString *)stringFromHexString;

//普通字符串转换为十六进制的。
- (NSString *)hexStringFromString;
@end
