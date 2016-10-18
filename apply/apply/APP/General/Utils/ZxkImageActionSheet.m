//
//  ImageActionSheet.m
//  yueedai
//
//  Created by dacheng on 15/4/27.
//  Copyright (c) 2015年 DC. All rights reserved.
//

#import "ZxkImageActionSheet.h"
#import <AVFoundation/AVFoundation.h>
#import "UIImage+Utils.h"

@interface ZxkImageActionSheet ()<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property(nonatomic,strong)UIImagePickerController *picker;

@property(nonatomic,strong)UIActionSheet *sheet;

@property(nonatomic,weak)UIViewController *controller;

@property(nonatomic,assign)NSInteger clickIndex;

@end

@implementation ZxkImageActionSheet

-(id)initWithViewContoller:(UIViewController *)vc
{
    self = [super init];
    __weak typeof(self)self1 = self;
    dispatch_async(dispatch_get_main_queue(), ^
                   {
                       //初始化uiimagepickercontroller
                       self1.picker = [[UIImagePickerController alloc] init];
                       //UIImagePickerController是UINavigationControllerDelegate的子类 所以设置代理的时候也要实现navigation的代理
                       //    [self.picker.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
                       //是否可以编辑
                       self1.picker.allowsEditing = YES;
                       //设置代理
                       self1.picker.delegate = self;
                   });
    
    self.controller = vc;
    return self;
    
}

-(void)showInView:(UIView *)view
{
    
    if(self.DeleteClickBlock)
    {
        self.sheet = [[UIActionSheet alloc] initWithTitle:@"提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除" otherButtonTitles:@"拍照",@"相册", nil];
        [self.sheet setDestructiveButtonIndex:0];
    }
    else
    {
        self.sheet = [[UIActionSheet alloc] initWithTitle:@"提示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册", nil];
    }
    [self.sheet showInView:view];
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.clickIndex = buttonIndex;
    __weak typeof(self)self1 = self;
    if(buttonIndex == 0)
    {
        if(self.DeleteClickBlock)
        {
            self.DeleteClickBlock();

        }
        else
        {
            AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            if(authStatus == AVAuthorizationStatusAuthorized)
            {
                //Source type: 这个参数是⽤用来确定是调⽤用摄像头还是调⽤用图⽚片库 模拟器不支持摄像头
                self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self1.controller presentViewController:self1.picker animated:YES completion:nil];
            }
            else if (authStatus == AVAuthorizationStatusDenied)
            {
                //            NSLog(@"不允许状态，可以弹出一个alertview提示用户在隐私设置中开启权限");
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"禁止的权限，请在设置-隐私-相机中开启应用权限" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确认",nil];
                [alert show];
            }
            else if (authStatus == AVAuthorizationStatusNotDetermined)
            {
                //            NSLog(@"系统还未知是否访问，第一次开启相机时");
                //Source type: 这个参数是⽤用来确定是调⽤用摄像头还是调⽤用图⽚片库 模拟器不支持摄像头
                self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self1.controller presentViewController:self1.picker animated:YES completion:nil];
                
            }
            
        }
    }
    else if (buttonIndex == 1)
    {
        if(self.DeleteClickBlock)
        {
            AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            if(authStatus == AVAuthorizationStatusAuthorized)
            {
                //Source type: 这个参数是⽤用来确定是调⽤用摄像头还是调⽤用图⽚片库 模拟器不支持摄像头
                self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self1.controller presentViewController:self1.picker animated:YES completion:nil];
            }
            else if (authStatus == AVAuthorizationStatusDenied)
            {
                //            NSLog(@"不允许状态，可以弹出一个alertview提示用户在隐私设置中开启权限");
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"禁止的权限，请在设置-隐私-相机中开启应用权限" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确认",nil];
                [alert show];
            }
            else if (authStatus == AVAuthorizationStatusNotDetermined)
            {
                //            NSLog(@"系统还未知是否访问，第一次开启相机时");
                //Source type: 这个参数是⽤用来确定是调⽤用摄像头还是调⽤用图⽚片库 模拟器不支持摄像头
                self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self1.controller presentViewController:self1.picker animated:YES completion:nil];
                
            }
        }
        else
        {
            self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self1.controller presentViewController:self1.picker animated:YES completion:nil];

        }
    }
    else if (buttonIndex == 2)
    {
        if(self.DeleteClickBlock)
        {
            self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self1.controller presentViewController:self1.picker animated:YES completion:nil];
            
        }
        else
        {
           
        }
    }

}

#pragma mark UIImagePickerControllerDelegate

//不同于视频播放的notification的监听 uiimagepickercontroller有两种代理方法
//完成选取
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //info为选取图片的所有信息
    NSLog(@"%@",info);
    //    info中包括选取的照⽚片,视频的主要信息
    //    NSString *const UIImagePickerControllerMediaType; 选取的类型 public.image public.movie
    //    NSString *const UIImagePickerControllerOriginalImage; 修改前 的UIImage object.
    //    NSString *const UIImagePickerControllerEditedImage; 修改后 的UIImage object.
    //    NSString *const UIImagePickerControllerCropRect; 原始图 ⽚片的尺⼨寸NSValue object containing a CGRect data type
    //    NSString *const UIImagePickerControllerMediaURL; 视频在⽂文件系统中 的 NSURL地址
    //    保存视 频主要时通过获取其NSURL 然后转换成NSData
    //获取选取的类型 是图片还是视频
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    //判断如果选取的是图片
    if ([mediaType isEqualToString:@"public.image"]) {
        //提取修改之后的图片
        UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        if(self.ClickBlock)
        {
            self.ClickBlock(self.clickIndex,[UIImage imageWithData:[UIImage compressImage:image andQuality:0.5 andMaxSize:CGSizeMake(95,60) andMaxDataLength:100] scale:1]);
        }
        
       
        //        //导入assertLibrary 保存图片到相册
        //        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    [self.picker dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - 修改图片大小尺寸
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)newsize{
    
    // 创建一个bitmap的context
    
    // 并把它设置成为当前正在使用的context
    
    UIGraphicsBeginImageContext(newsize);
    
    // 绘制改变大小的图片
    
    [img drawInRect:CGRectMake(0, 0, newsize.width, newsize.height)];
    
    // 从当前context中创建一个改变大小后的图片
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    
    return scaledImage;
    
}

//取消选取
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.picker dismissViewControllerAnimated:YES completion:nil];
}



//-(void)willPresentActionSheet:(UIActionSheet *)actionSheet
//{
//    for (UIView *subViwe in actionSheet.subviews) {
//        if ([subViwe isKindOfClass:[UIButton class]]) {
//            UIButton *button = (UIButton*)subViwe;
//            if([button.titleLabel.text isEqualToString:@"删除"])
//            {
//                [button setTitleColor:[UIColor colorWithHexString:@"ff0000"] forState:UIControlStateNormal];
//            }
//            else if ([button.titleLabel.text isEqualToString:@"拍照"]|[button.titleLabel.text isEqualToString:@"相册"])
//            {
//                [button setTitleColor:COLOR_LIGHTBLUE forState:UIControlStateNormal];
//            }
//            else if ([button.titleLabel.text isEqualToString:@"取消"])
//            {
//                [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
//            }
//        }
//    }
//}

@end
