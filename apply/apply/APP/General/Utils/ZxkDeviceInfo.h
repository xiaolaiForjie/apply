//
//  ZxkDeviceInfo.h
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/7/3.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sys/sysctl.h>
#import <sys/utsname.h>
@interface ZxkDeviceInfo : NSObject



typedef NS_ENUM(NSInteger, DeviceNo) {
    DeviceNoIphone4 = 4,
    DeviceNoIphone4s = 41,
    DeviceNoIphone5 = 5,
    DeviceNoIphone5s = 51,
    DeviceNoIphone6 = 6,
    DeviceNoIphone6plus = 61,
    
};

+(DeviceNo)currentDevice;
+(NSString*)currentDeviceString;

@end
