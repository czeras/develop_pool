//
//  SharedMacro.h
//  001---直播架构搭建
//
//  Created by cooci on 2018/10/23.
//  Copyright © 2018 cooci. All rights reserved.
//
#ifndef SharedMacro_h
#define SharedMacro_h

#ifndef CC_DEBUG
#define CC_DEBUG 1 // 0: Release (no loggings and others debuggings), 1: For tests
#endif

#ifndef DEBUGENV
#define DEBUGENV 1 // 0: Release, 1: For internal or beta tests
#endif


#define KCZLog(x, ...)
#define KCLog(format, ...)  NSLog(format, ##__VA_ARGS__)

#define KC(instance, protocol, message) [(id<protocol>)(instance) message]
#define _Owner [[CurrentUserLoginMgr sharedInstance] getCurrentUser]

#define Notif               [NSNotificationCenter defaultCenter]
#define _Service            [EServiceFactory sharedInstance]
#define _Dao                [EDaoFactory sharedInstance]
#define _UD                 [NSUserDefaults standardUserDefaults]
#define _GC                 [GlobalCache sharedGlobalCache]
#define _AS                 [ActionStage sharedStage]

// 屏幕尺寸
#define SCREEN_SIZE         [UIScreen mainScreen].bounds.size
#define SCREEN_WIDTH        SCREEN_SIZE.width
#define SCREEN_HEIGHT       SCREEN_SIZE.height
#define SCREEN_SCALE        [UIDevice currentDevice].screenScale

#define AssertMainThread        NSAssert([NSThread isMainThread], @"must be called from main thread");
#define RunAsyncOnMainThread(xxx)    dispatch_async(dispatch_get_main_queue(), ^{  \
xxx \
});

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define IOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7
#define IOS6 [[[UIDevice currentDevice] systemVersion] floatValue] < 7
#define IOS5 [[[UIDevice currentDevice] systemVersion] floatValue] < 6
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
// iphone 4 or iphone 4s
#define IS_SHORT_IPHONE (([[UIScreen mainScreen] bounds].size.height-568) > 0 ? NO:YES)

#define TABLEVIEWFRAME_WITH_NAVBAR_AND_TABBAR CGRectMake(0, 0, 320, iPhone5?455:367)


#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)




// 测试method执行时间, 限制在同一个method之内
#define TICK   NSDate *startTime = [NSDate date];
#define TOCK   CCLog(@"Executing Time of %@: %f ms", NSStringFromSelector(_cmd), -[startTime timeIntervalSinceNow]*1000);
#define TOCK_N(xxx) CCLog(@"Executing Time of %@_%d: %f ms", NSStringFromSelector(_cmd), xxx, -[startTime timeIntervalSinceNow]*1000);startTime = [NSDate date];

#define CC_Dispatch_Time(time_in_second)    dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time_in_second * NSEC_PER_SEC))


//suppress warnning
#define CCSuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)





//适配iphoneX
#define iPhoneX (_window_width== 375.f && _window_height == 812.f)||(_window_width== 414.f && _window_height == 896.f)
#define ShowDiff (iPhoneX ? 34: 0)
#define statusbarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height-20)

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#define normalColors [UIColor colorWithRed:255/255.0 green:97/255.0 blue:49/255.0 alpha:1]

#define RGB_COLOR(_STR_,a) ([UIColor colorWithRed:[[NSString stringWithFormat:@"%lu", strtoul([[_STR_ substringWithRange:NSMakeRange(1, 2)] UTF8String], 0, 16)] intValue] / 255.0 green:[[NSString stringWithFormat:@"%lu", strtoul([[_STR_ substringWithRange:NSMakeRange(3, 2)] UTF8String], 0, 16)] intValue] / 255.0 blue:[[NSString stringWithFormat:@"%lu", strtoul([[_STR_ substringWithRange:NSMakeRange(5, 2)] UTF8String], 0, 16)] intValue] / 255.0 alpha:a])

#define _pageBarWidth  _window_width *0.7
#define  _window_width  [UIScreen mainScreen].bounds.size.width
#define _window_height [UIScreen mainScreen].bounds.size.height

#define RGB(r,g,b)          [UIColor colorWithRed:(r)/255.f \
green:(g)/255.f \
blue:(b)/255.f \
alpha:1.f]

#endif /* SharedMacro_h */
