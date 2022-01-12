//
//  AppDelegate.m
//  MVPCase
//
//  Created by YongQin on 2021/12/15.
//

#import "AppDelegate.h"
#import "ZYTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[[ZYTabBarController alloc]init]];
    
    self.window = [[UIWindow alloc]initWithFrame:CGRectMake(0,0,_window_width, _window_height)];
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController =  nav;
    
    
    return YES;
}




@end
