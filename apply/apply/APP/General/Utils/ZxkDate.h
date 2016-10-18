//
//  ZxkDate.h
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/7/3.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZxkDate : NSObject

+(NSString *)getDataAtNowWithTitel:(NSString *)titel;

+(NSString *)getDataAtNow;
+(NSString *)getDataWithInterval:(NSTimeInterval)interval;
+(NSString *)getDataWithInterval:(NSTimeInterval)interval Format:(NSString *)format;

+ (NSString *)getDataAtNowWithFormat:(NSString *)format Date:(NSDate *)date;

//把时间字符串变成时间
+ (NSDate *)getDateWithString:(NSString *)string Format:(NSString *)format IsChangeZoon:(BOOL)zoon;

//返回自1970年到现在的秒数
+ (NSTimeInterval)timeIntervalSince1970;

//替换非utf8字符
//注意：如果是三字节utf-8，第二字节错误，则先替换第一字节内容(认为此字节误码为三字节utf8的头)，然后判断剩下的两个字节是否非法；
+(NSData *)replaceNoUtf8:(NSData *)data;

@end
