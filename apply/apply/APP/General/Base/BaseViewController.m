//
//  BaseViewController.m
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/6/29.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#import "BaseViewController.h"
#import "Macro.h"


@interface BaseViewController ()

@end

@implementation BaseViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = BGColor;
    
    self.leftBarItemSize = 17.0f;
    self.rightBarItemSize = 17.0f;
    
    [self navigationBarSeting];
}

#pragma mark - 导航栏左右按钮
- (void)loadLeftBarButtonItem{
    
    self.leftBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBarButton.frame = CGRectMake(0, 0, 45, 45);
    
    if (self.leftBarItemTitle!=nil&&![self.leftBarItemTitle checkEmpty]) {
        CGSize size=[self.leftBarItemTitle stringWidthWithFontSize:self.leftBarItemSize andHeight:45];
        self.leftBarButton.frame = CGRectMake(0, 0, size.width+30, 45);
        [self.leftBarButton setTitle:self.leftBarItemTitle forState:UIControlStateNormal];
    }
    
    if(self.leftBarItemIcon!=nil&&![self.leftBarItemIcon checkEmpty]){
        [self.leftBarButton setImage:[UIImage imageNamed:self.leftBarItemIcon] forState:UIControlStateNormal];
    }
    
    [self.leftBarButton addTarget:self action:@selector(leftBarBtnItemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.leftBarButton];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -18;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, item, nil];
    
}
//导航栏右按钮
- (void)loadRightBarButtonItem{
    
    self.rightBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightBarButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    self.rightBarButton.frame = CGRectMake(0, 0, 45, 45);
    if (self.rightBarItemTitle!=nil&&![self.rightBarItemTitle checkEmpty]) {
        CGSize size=[self.rightBarItemTitle stringWidthWithFontSize:self.rightBarItemSize andHeight:44];
        size.width=size.width>64?size.width+20:64;
        self.rightBarButton.frame = CGRectMake(0, 0, size.width, 40);
        [self.rightBarButton setTitle:self.rightBarItemTitle forState:UIControlStateNormal];
        self.rightBarButton.titleLabel.font = [UIFont systemFontOfSize:self.rightBarItemSize];
    }
    
    if (self.rightBarItemIcon!=nil&&![self.rightBarItemIcon checkEmpty]){
        [self.rightBarButton setImage:[UIImage imageNamed:self.rightBarItemIcon] forState:UIControlStateNormal];
    }
    
    [self.rightBarButton addTarget:self action:@selector(rightBarBtnItemClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.rightBarButton];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -18;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, item, nil];
    
}


#pragma  mark --导航栏左右按钮事件
-(void)leftBarBtnItemClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBarBtnItemClick:(UIButton *)sender
{
    
}


#pragma mark --导航栏设置
-(void)navigationBarSeting{
    //设置电池栏跟bar颜色一致  主要适用ios7之后版本
    self.navigationController.navigationBar.translucent = NO;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"\n\n<------%@----调用了dealloc --->\n\n",NSStringFromClass([self class]));
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
