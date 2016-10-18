//
//  ZxkReflect.h
//  yueedai
//
//  Created by dacheng on 15-3-30.
//  Copyright (c) 2015年 DC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZxkReflect : NSObject


//第一个参数className是类名  第二个是字典  第三个是类的属性值与字典的键值的映射，changeDic的健是类属性，值是需要映射字典的键。
+(NSObject *) initobjectFromDictory:(NSString *)className dic:(NSMutableDictionary *)dic ChangeDic:(NSDictionary *)changeDic;

+(NSMutableArray *) initobjectFromDictory:(NSString *)className arr:(NSArray *)arr ChangeDic:(NSDictionary *)changeDic;


@end
