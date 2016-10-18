//
//  BaseTabBarViewController.m
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/7/1.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#import "BaseTabBarViewController.h"



@interface BaseTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleArr = TitleArr;
    self.normalArr = NormalArr;
    self.selectArr = SelectArr;
    self.vcArr = VcControllers;
    
    self.viewControllers = self.vcArr;
    
    for (int i=0; i<[self.viewControllers count]; i++)
    {
        UIViewController *vc  = [self.viewControllers objectAtIndex:i];
        
        [vc.tabBarItem initWithTitle:self.titleArr[i] image:[UIImage imageNamed:self.normalArr[i]] selectedImage:[UIImage imageNamed:self.selectArr[i]]];
    }
    
    
    //self.tabBar.backgroundColor = [UIColor whiteColor];
    self.tabBar.backgroundColor = TabBarBGColor;
    self.tabBar.tintColor = TitleColor;
    self.tabBar.selectedImageTintColor = TitleColor;
    self.tabBar.backgroundImage = [UIImage imageWithColor:TabBarBGColor andSize:self.tabBar.bounds.size];
    self.delegate=self;
    
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    _lastSelectedIndex=self.selectedIndex;
    return YES;
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    _currentSelectedIndex=self.selectedIndex;
    //NSLog(@"selectedIndex:%ld,tabBarController:%ld",self.lastSelectedIndex,tabBarController.selectedIndex);
    NSInteger index =tabBarController.selectedIndex;
}


- (void)lookingButtonPressed:(NSNotification*)notify
{
    //    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //    BaseTabBarController *baseTabbar =   (BaseTabBarController *)storyBoard.instantiateInitialViewController;
    //    [baseTabbar setSelectedIndex:0];
    [self setSelectedIndex:0];
}

- (void)dealloc
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
