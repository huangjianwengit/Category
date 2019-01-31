//
//  UIDevice+DeviceType.h
//  Device
//
//  Created by Jivan on 2019/1/31.
//  Copyright © 2019 Jivan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPHoneX
#define IS_IPHONE_X   CGRectEqualToRect([UIScreen mainScreen].bounds, CGRectMake(0, 0, 375, 812))

//判断iPHoneXr
#define IS_IPHONE_XR   CGRectEqualToRect([UIScreen mainScreen].bounds, CGRectMake(0, 0, 414, 896))

// 顶部导航栏+状态栏 （安全区域）
#define kSafeAreaTopHeight ((IS_IPHONE_X==YES || IS_IPHONE_XR ==YES) ? 88.0 : 64.0)
// 底部安全区域
#define kSafeAreaBottomHeight ((IS_IPHONE_X==YES || IS_IPHONE_XR ==YES) ? 34 : 0)
//  状态栏高度
#define kStatusBarHeight ((IS_IPHONE_X==YES || IS_IPHONE_XR ==YES) ? 44.0 : 20.0)
//  导航栏高度
#define kNavigationBarHeight 44
//TabBar
#define kTabBarHeight 49


typedef NS_ENUM(NSInteger,DeviceType) {
    
     DeviceTypeIsIphone4,
     DeviceTypeIsIphone5,
     DeviceTypeIsIphone6,
     DeviceTypeIsIphone6Plus,
     DeviceTypeIsIphoneX,
     DeviceTypeIsIphoneXR,
     DeviceTypeIs,
     DeviceTypeIsUknown,
    
};

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (DeviceType)

+(DeviceType)deviceType;

+(NSString *)platformString;

@end

NS_ASSUME_NONNULL_END
