//
//  NSString+Checking.h
//  SanLianOrdering
//
//  Created by shiqichao on 14-10-22.
//  Copyright (c) 2014年 DaCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Checking)
//字符串判断是否为空
- (BOOL)checkEmpty;

//验证手机号码
-(BOOL)checkMobileNumber;

#pragma mark -
#pragma mark -  ztx add start

/**
 *  检测邮箱是否合法
 *
 *  @param candidate 邮箱
 */
- (BOOL)isValidateEmail;


#pragma mark -
#pragma mark -  ztx add  end

@end
