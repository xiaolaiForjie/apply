//
//  ZxkReflect.m
//  yueedai
//
//  Created by dacheng on 15-3-30.
//  Copyright (c) 2015年 DC. All rights reserved.
//

#import "ZxkReflect.h"
#import <objc/runtime.h>

@implementation ZxkReflect
+(NSObject *) initObjectFromName:(NSString *)name
{
    Class c = 	NSClassFromString(name);
    if (!c)
        return  nil;
    else
    {
        NSObject *obj = [[c alloc] init];
        return obj;
    }
    
}

+(NSObject *) initobjectFromDictory:(NSString *)className dic:(NSMutableDictionary *)dic ChangeDic:(NSDictionary *)changeDic
{
    const char *className_C = [className UTF8String];
    id lenderClass = objc_getClass(className_C); // 通过字符串名字，获取类
    unsigned int outCount;
    int i;
    // 获取注册类的属性列表，第一个参数是类，第二个参数是接收类属性数目的变量
    objc_property_t * pProperty = class_copyPropertyList(lenderClass, &outCount);
    NSObject *mc = [ZxkReflect initObjectFromName:className];
    if(outCount==0)
    {
        NSLog(@"%@类名不存在，或者属性为空",className);
        return nil;
    }
    for (i = outCount -1; i >= 0; i--)
    {
        // 循环获取属性的名字   property_getName函数返回一个属性的名称
        NSString *getPropertyName = [NSString stringWithCString:property_getName(pProperty[i]) encoding:NSUTF8StringEncoding];
//        NSString *getPropertyNameString = [NSString stringWithCString:property_getAttributes(pProperty[i]) encoding:NSUTF8StringEncoding];
        NSMutableString *s = [getPropertyName mutableCopy];
        id obj;
        if([ZxkReflect checkChangeProperty:s WithDic:changeDic]==nil)
        {
            obj = [dic objectForKey:getPropertyName];
        }
        else
        {
            obj = [dic objectForKey:[ZxkReflect checkChangeProperty:s WithDic:changeDic]];
        }
        if(obj)
        {
            if (![obj isKindOfClass:[NSString class]])
            {
                if([obj isKindOfClass:[NSNumber class]])
                {
                    NSLog(@"%@返回类型为NSNumber,已被强转为NSString",getPropertyName);
                    [mc setValue:[NSString stringWithFormat:@"%f",[obj floatValue]] forKey:getPropertyName];
                }
                else if([mc valueForKey:getPropertyName]==nil)
                {
                    if([obj isKindOfClass:[NSNull class]])
                    {
                        NSLog(@"%@对象为NSNull，默认为@""",getPropertyName);
                        [mc setValue:@"" forKey:getPropertyName];
                    }
                    else
                    {
                        NSLog(@"%@对象没有初始化类别，默认为%@",getPropertyName,[obj class]);
                        [mc setValue:obj forKey:getPropertyName];
                    }
                    
                }
                else if ([obj isKindOfClass:[obj class]])
                {
                    [mc setValue:obj forKey:getPropertyName];
                }

                else
                {
                    NSObject *c = [[[[mc valueForKey:getPropertyName] class] alloc] init];
                    NSString *s = [NSString stringWithUTF8String:object_getClassName(c)];
                    [mc setValue:[ZxkReflect initobjectFromDictory:s dic:obj ChangeDic:nil] forKey:getPropertyName];
                }
            }
            else
            {
                
                [mc setValue:obj forKey:getPropertyName];
            }
            NSLog(@"Class:%@,property:%@:%@",[mc class],getPropertyName,[mc valueForKey:getPropertyName]);
        }
        
        
    }
    free(pProperty);
    return  mc;
}

+(NSMutableArray *) initobjectFromDictory:(NSString *)className arr:(NSArray *)arr ChangeDic:(NSDictionary *)changeDic
{
    NSMutableArray *arr1 = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary *dic = (NSDictionary *)obj;
        [arr1 addObject:[ZxkReflect initobjectFromDictory:className dic:[dic mutableCopy] ChangeDic:changeDic]];
    }];
    return  arr1;
}


//checkChangeDic
+(NSString *)checkChangeProperty:(NSString *)property WithDic:(NSDictionary *)dic
{
    NSArray *keyArr = [dic allKeys];
    if([keyArr containsObject:property])
    {
        return [dic objectForKey:property];
    }
    else
        return nil;
}

@end
