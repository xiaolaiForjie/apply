//
//  UIWebView+Utils.m
//  yueedai
//
//  Created by shiqichao on 15/4/27.
//  Copyright (c) 2015年 DC. All rights reserved.
//

#import "UIWebView+Utils.h"

@implementation UIWebView (Utils)
#pragma mar --UIWebView POST请求处理
- (void) loadPostRequestWithURLString:(NSString *)urlString andParamsOrNil:(NSDictionary *)Params
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                       timeoutInterval:60.0];
    
    // DATA TO POST
    if(Params) {
        NSString *postString = [self getFormDataString:Params];
        NSData *postData = [postString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        //[request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
    }
    
    [self loadRequest:request];
}
- (NSString *)getFormDataString:(NSDictionary*)dictionary {
    if( ! dictionary) {
        return nil;
    }
    NSArray* keys = [dictionary allKeys];
    NSMutableString* resultString = [[NSMutableString alloc] init];
    for (int i = 0; i < [keys count]; i++) {
        NSString *key = [NSString stringWithFormat:@"%@", [keys objectAtIndex: i]];
        
        NSString *valueString;
        id value=[dictionary valueForKey: [keys objectAtIndex: i]];
        if (value!=nil&&value!=[NSNull null]) {
            valueString = [NSString stringWithFormat:@"%@", value];
        }else{
            valueString=@"";
        }
        NSString *encodedKey = [self escapeString:key];
        NSString *encodedValue = [self escapeString:valueString];
        
        NSString *kvPair = [NSString stringWithFormat:@"%@=%@", encodedKey, encodedValue];
        if(i > 0) {
            [resultString appendString:@"&"];
        }
        [resultString appendString:kvPair];
    }
    return resultString;
}
- (NSString *)escapeString:(NSString *)string {
    if(string == nil || [string isEqualToString:@""]) {
        return @"";
    }
    NSString *outString = [NSString stringWithString:string];
    outString = [outString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    // BUG IN stringByAddingPercentEscapesUsingEncoding
    // WE NEED TO DO several OURSELVES
    outString = [self replace:outString lookFor:@"&" replaceWith:@"%26"];
    outString = [self replace:outString lookFor:@"?" replaceWith:@"%3F"];
    outString = [self replace:outString lookFor:@"=" replaceWith:@"%3D"];
    outString = [self replace:outString lookFor:@"+" replaceWith:@"%2B"];
    outString = [self replace:outString lookFor:@";" replaceWith:@"%3B"];
    
    return outString;
}
- (NSString *)replace:(NSString *)originalString lookFor:(NSString *)find replaceWith:(NSString *)replaceWith {
    if ( ! originalString || ! find) {
        return originalString;
    }
    
    if( ! replaceWith) {
        replaceWith = @"";
    }
    
    NSMutableString *mstring = [NSMutableString stringWithString:originalString];
    NSRange wholeShebang = NSMakeRange(0, [originalString length]);
    
    [mstring replaceOccurrencesOfString: find
                             withString: replaceWith
                                options: 0
                                  range: wholeShebang];
    
    return [NSString stringWithString: mstring];
}



@end
