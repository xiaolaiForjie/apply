//
//  ZxkDate.m
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/7/3.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#import "ZxkDate.h"

@implementation ZxkDate

+(NSString *)getDataAtNowWithTitel:(NSString *)titel
{
    //写入日期
    NSDate *date = [NSDate date];
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"yyyy年MM月dd日 HH:mm:ss";
    NSString *s = [NSString stringWithFormat:@"%@:%@",titel,[f stringFromDate:date]];
    return s;
}

+(NSString *)getDataAtNow
{
    //写入日期
    NSDate *date = [NSDate date];
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"yy-MM-dd HH:mm:ss";
    NSString *s = [NSString stringWithFormat:@"%@",[f stringFromDate:date]];
    return s;
}

+(NSString *)getDataWithInterval:(NSTimeInterval)interval
{
    //写入日期
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *s = [NSString stringWithFormat:@"%@",[f stringFromDate:date]];
    return s;
}

+(NSString *)getDataWithInterval:(NSTimeInterval)interval Format:(NSString *)format
{
    //写入日期
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = format;
    NSString *s = [NSString stringWithFormat:@"%@",[f stringFromDate:date]];
    return s;
}

+ (NSString *)getDataAtNowWithFormat:(NSString *)format Date:(NSDate *)date
{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = format;
    NSString *s = [f stringFromDate:date];
    return s;
}

+ (NSDate *)getDateWithString:(NSString *)string Format:(NSString *)format IsChangeZoon:(BOOL)zoon
{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = format;
    NSDate *d = [f dateFromString:string];
    if(zoon)
    {
        //转化时区
        NSTimeZone *zone = [NSTimeZone defaultTimeZone];
        NSTimeInterval nti = [zone secondsFromGMTForDate:d];
        NSDate *date1 = [d dateByAddingTimeInterval:nti];
        return date1;
    }
    else
        return d;
}

+ (NSTimeInterval)timeIntervalSince1970
{
    NSDate *date = [NSDate date];
    return [date timeIntervalSince1970];
}

//替换非utf8字符
//注意：如果是三字节utf-8，第二字节错误，则先替换第一字节内容(认为此字节误码为三字节utf8的头)，然后判断剩下的两个字节是否非法；
+(NSData *)replaceNoUtf8:(NSData *)data
{
    char aa[] = {'A','A','A','A','A','A'};                      //utf8最多6个字符，当前方法未使用
    NSMutableData *md = [NSMutableData dataWithData:data];
    int loc = 0;
    while(loc < [md length])
    {
        char buffer;
        [md getBytes:&buffer range:NSMakeRange(loc, 1)];
        if((buffer & 0x80) == 0)
        {
            loc++;
            continue;
        }
        else if((buffer & 0xE0) == 0xC0)
        {
            loc++;
            [md getBytes:&buffer range:NSMakeRange(loc, 1)];
            if((buffer & 0xC0) == 0x80)
            {
                loc++;
                continue;
            }
            loc--;
            //非法字符，将这个字符（一个byte）替换为A
            [md replaceBytesInRange:NSMakeRange(loc, 1) withBytes:aa length:1];
            loc++;
            continue;
        }
        else if((buffer & 0xF0) == 0xE0)
        {
            loc++;
            [md getBytes:&buffer range:NSMakeRange(loc, 1)];
            if((buffer & 0xC0) == 0x80)
            {
                loc++;
                [md getBytes:&buffer range:NSMakeRange(loc, 1)];
                if((buffer & 0xC0) == 0x80)
                {
                    loc++;
                    continue;
                }
                loc--;
            }
            loc--;
            //非法字符，将这个字符（一个byte）替换为A
            [md replaceBytesInRange:NSMakeRange(loc, 1) withBytes:aa length:1];
            loc++;
            continue;
        }
        else
        {
            //非法字符，将这个字符（一个byte）替换为A
            [md replaceBytesInRange:NSMakeRange(loc, 1) withBytes:aa length:1];
            loc++;
            continue;
        }
    }
    
    return md;
}


@end
