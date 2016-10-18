//
//  ZxkEncrypt.h
//  PassKepper
//
//  Created by Ucard on 14/6/10.
//  Copyright (c) 2014年 晓坤张. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZxkEncrypt : NSObject


//base64加密
+ (NSString *)base64StringFromText:(NSString *)text Key:(NSString *)key;

//base64解密
+ (NSString *)textFromBase64String:(NSString *)base64 Key:(NSString *)key;
+ (NSData *)dataWithBase64EncodedString:(NSString *)string;

//md5
+ (NSString *)md5string:(NSString *)md5;

//AES加密
+ (NSData *)AES256EncryptWithKey:(NSString *)key Data:(NSData *)data;
//AES解密
+ (NSData *)AES256DecryptWithKey:(NSString *)key Data:(NSData*)data;

//AES加密
+ (NSData *)AES128EncryptWithKey:(NSString *)key Data:(NSData *)data;
//AES解密
+ (NSData *)AES128DecryptWithKey:(NSString *)key Data:(NSData*)data;

@end
