//
//  UIDevice+DeviceType.m
//  Device
//
//  Created by Jivan on 2019/1/31.
//  Copyright © 2019 Jivan. All rights reserved.
//

#import "UIDevice+DeviceType.h"
#include "sys/types.h"
#include "sys/sysctl.h"

@implementation UIDevice (DeviceType)
+(NSString *)getDeviceVersion{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char*)malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}


+(NSString *)platformString{
    
    NSString *platform = [self getDeviceVersion];
    /// iPhone4 or iPhone4s
    if (SCREEN_WIDTH == 320 && SCREEN_HEIGHT == 480) {
        return @"iPhone 4s";
    }
    /// iPhone5 or iPhone5s or iPhoneSE
    if (SCREEN_WIDTH == 320 && SCREEN_HEIGHT == 568) {
        return @"iPhone 5s";
    }
    /// iPhone6 or iPhone6s or iPhone7 or iPhone8
    if (SCREEN_WIDTH == 375 && SCREEN_HEIGHT == 667) {
        return @"iPhone 6";
    }
    /// iPhone6Plus or iPhone6sPlus or iPhone7sPlus or iPhone8sPlus
    if (SCREEN_WIDTH == 414 && SCREEN_HEIGHT == 736) {
        return @"iPhone 6 plus";
    }
    /// iPhoneX or iPhoneXS
    if (SCREEN_WIDTH == 375 && SCREEN_HEIGHT == 812) {
        return @"iPhone X";
    }
    /// iPhoneXR or iPhoneXS Max
    if (SCREEN_WIDTH == 414 && SCREEN_HEIGHT == 896) {
        return @"iPhone XR";
    }
    //iPot Touch
    if ([platform isEqualToString:@"iPod1,1"])     return@"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])     return@"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])     return@"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])     return@"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])     return@"iPod Touch 5G";
    //iPad
    if ([platform isEqualToString:@"iPad1,1"])     return@"iPad";
    if ([platform isEqualToString:@"iPad2,1"])     return@"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])     return@"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])     return@"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])     return@"iPad 2 New";
    if ([platform isEqualToString:@"iPad2,5"])     return@"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad3,1"])     return@"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])     return@"iPad 3 (CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])     return@"iPad 3 (GSM)";
    if ([platform isEqualToString:@"iPad3,4"])     return@"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"i386"] ||
        [platform isEqualToString:@"x86_64"])      return@"Simulator";
    return platform;
}

+(DeviceType)deviceType{
    
    /// iPhone4 or iPhone4s
    if (SCREEN_WIDTH == 320 && SCREEN_HEIGHT == 480) {
        return DeviceTypeIsIphone4;
    }
    /// iPhone5 or iPhone5s or iPhoneSE
    if (SCREEN_WIDTH == 320 && SCREEN_HEIGHT == 568) {
        return DeviceTypeIsIphone5;
    }
    /// iPhone6 or iPhone6s or iPhone7 or iPhone8
    if (SCREEN_WIDTH == 375 && SCREEN_HEIGHT == 667) {
        return DeviceTypeIsIphone6;
    }
    /// iPhone6Plus or iPhone6sPlus or iPhone7sPlus or iPhone8sPlus
    if (SCREEN_WIDTH == 414 && SCREEN_HEIGHT == 736) {
        return DeviceTypeIsIphone6Plus;
    }
    /// iPhoneX or iPhoneXS
    if (SCREEN_WIDTH == 375 && SCREEN_HEIGHT == 812) {
        return DeviceTypeIsIphoneX;
    }
    /// iPhoneXR or iPhoneXS Max
   if (SCREEN_WIDTH == 414 && SCREEN_HEIGHT == 896) {
        return DeviceTypeIsIphoneXR;
    }
    return DeviceTypeIsUknown;
}
@end
