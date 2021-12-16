//
//  AppDelegate.m
//  MVPCase
//
//  Created by YongQin on 2021/12/15.
//

#import "AppDelegate.h"

#import "KCHomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    
    
//    self.window.rootViewController =  [[UINavigationController alloc] initWithRootViewController:[[KCHomeViewController alloc] init]];
    
    
    self.window.rootViewController =  [[KCHomeViewController alloc] init];
    
    
    return YES;
}




@end
