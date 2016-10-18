//
//  NSString+Checking.m
//  SanLianOrdering
//
//  Created by shiqichao on 14-10-22.
//  Copyright (c) 2014年 DaCheng. All rights reserved.
//

#import "NSString+Checking.h"

@implementation NSString (Checking)

//字符串判断是否为空
- (BOOL)checkEmpty{
    return [[self stringTrimWhitespace] isEqualToString:@""];
}

//字符串去空格
-(NSString *)stringTrimWhitespace{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

//验证手机号码 合法为yes 
-(BOOL)checkMobileNumber
{
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}



- (BOOL)isValidateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:self];
}
@end
