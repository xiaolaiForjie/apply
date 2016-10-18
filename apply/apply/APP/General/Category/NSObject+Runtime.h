//
//  NSObject+Runtime.h
//  通讯录
//
//  Created by 晓坤张 on 16/7/6.
//  Copyright © 2016年 晓坤张. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)

-(NSDictionary *)getAllPropertiesAndValues;

- (NSArray *)getAllProperties;

-(NSArray *)getAllMethods;

@end
