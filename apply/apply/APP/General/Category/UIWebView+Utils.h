//
//  UIWebView+Utils.h
//  yueedai
//
//  Created by shiqichao on 15/4/27.
//  Copyright (c) 2015年 DC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (Utils)

#pragma mar --UIWebView POST请求处理
- (void) loadPostRequestWithURLString:(NSString *)urlString andParamsOrNil:(NSDictionary *)Params;

@end
