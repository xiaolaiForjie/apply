//
//  ZxkDeviceInfo.m
//  ZXK_FrameWork
//
//  Created by 晓坤张 on 15/7/3.
//  Copyright (c) 2015年 dacheng. All rights reserved.
//

#import "ZxkDeviceInfo.h"

@implementation ZxkDeviceInfo

//+(NSString*) doDevicePlatform
//{
//    size_t size;
//    int nR = sysctlbyname("hw.machine", NULL, &size, NULL, 0);
//    char *machine = (char *)malloc(size);
//    nR = sysctlbyname("hw.machine", machine, &size, NULL, 0);
//    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
//    free(machine);
//    return platform;
//}

+(NSString*)currentDeviceString
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone1,1"])
    {
        return @"iPhone";
    }
    if ([deviceString isEqualToString:@"iPhone1,2"])
    {
        return @"iPhone3G";
    }
    if ([deviceString isEqualToString:@"iPhone2,1"])
    {
        return @"iPhone3GS";
    }
    if ([deviceString isEqualToString:@"iPhone3,1"])
    {
        return @"iPhone4";
    }
    if ([deviceString isEqualToString:@"iPhone4,1"]){
        return @"iPhone 4S";
    }
    if ([deviceString isEqualToString:@"iPhone6,1"]){
        return @"iPhone5";
    }
    if ([deviceString isEqualToString:@"iPhone6,2"]){
        return @"iPhone5s";
    }
    if ([deviceString isEqualToString:@"iPhone7,1"]){
        return @"iPhone6plus";
    }
    if ([deviceString isEqualToString:@"iPhone7,2"]){
        return @"iPhone6";
    }
    return deviceString;
}

+(DeviceNo)currentDevice
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    //    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    //    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    //    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    //    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    //    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    //    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    //    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    //    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    //    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    //    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    //    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    //    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    //    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    //    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    //    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    if ([deviceString isEqualToString:@"iPhone3,1"])
    {
        return DeviceNoIphone4;
    }
    if ([deviceString isEqualToString:@"iPhone4,1"]){
        return DeviceNoIphone4s;
    }
    if ([deviceString isEqualToString:@"iPhone6,1"]){
        return DeviceNoIphone5;
    }
    if ([deviceString isEqualToString:@"iPhone6,2"]){
        return DeviceNoIphone5s;
    }
    if ([deviceString isEqualToString:@"iPhone7,1"]){
        return DeviceNoIphone6plus;
    }
    if ([deviceString isEqualToString:@"iPhone7,2"]){
        return DeviceNoIphone6;
    }
    
    return 0;
}

@end
