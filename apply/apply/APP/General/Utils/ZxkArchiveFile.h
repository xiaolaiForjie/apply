//
//  ZxkArchiveFile.h
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/7/2.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZxkArchiveFile : NSObject

//保存文件
+ (void)archiveDocumentWithRootObject:(id)arr FileName:(NSString *)name;

//读取文件
+ (id)readDocumentWithFileName:(NSString *)name;

//获取沙盒所有文件名称
+ (NSArray *)getFilelistFromDocument;

//创建文件
+ (NSString *)createFileWithName:(NSString *)name;

@end
