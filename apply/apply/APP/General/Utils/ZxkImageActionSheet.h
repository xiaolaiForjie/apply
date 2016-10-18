//
//  ImageActionSheet.h
//  yueedai
//
//  Created by dacheng on 15/4/27.
//  Copyright (c) 2015年 DC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZxkImageActionSheet : NSObject

@property(nonatomic,strong)void(^ClickBlock)(NSInteger index,UIImage *image);
@property(nonatomic,strong)void(^DeleteClickBlock)(void);

-(id)initWithViewContoller:(UIViewController *)vc;

-(void)showInView:(UIView *)view;

@end
