//
//  UIAlertView+Block.m
//  FenQiBao
//
//  Created by guojiang on 15/1/6.
//  Copyright (c) 2015年 DaChengSoftware. All rights reserved.
//

#import "UIAlertView+Utils.h"
#import <objc/runtime.h>

@implementation UIActionSheet (Utils)

static char key;

-(void)showInView:(UIView *)view completeBlock:(void (^)(NSInteger btnIndex))block
{
    if (block) {
        ////移除所有关联
        objc_removeAssociatedObjects(self);
        /**
         1 创建关联（源对象，关键字，关联的对象和一个关联策略。)
         2 关键字是一个void类型的指针。每一个关联的关键字必须是唯一的。通常都是会采用静态变量来作为关键字。
         3 关联策略表明了相关的对象是通过赋值，保留引用还是复制的方式进行关联的；关联是原子的还是非原子的。这里的关联策略和声明属性时的很类似。
         */
        objc_setAssociatedObject(self, &key, block, OBJC_ASSOCIATION_COPY);
        //设置delegate
        self.delegate = self;
        
    }
    [self showInView:view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    void (^block)(NSInteger btnIndex) = objc_getAssociatedObject(self, &key);
    
    if (block) block(buttonIndex);
}



/**
 OC中的关联就是在已有类的基础上添加对象参数。来扩展原有的类，需要引入#import <objc/runtime.h>头文件。关联是基于一个key来区分不同的关联。
 常用函数: objc_setAssociatedObject     设置关联
 objc_getAssociatedObject     获取关联
 objc_removeAssociatedObjects 移除关联
 */

@end
