//
//  AppDelegate.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/17.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "AppDelegate.h"
#import "HYYMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    HYYMainViewController *mainVC = [[HYYMainViewController alloc]init];
    [self.window setRootViewController:mainVC];
    [self.window makeKeyAndVisible];
    
    // 本地通知，应用在关闭状态
  UILocalNotification *localNote = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    NSString *context = localNote.userInfo[@"context"];
    NSLog(@"%@11",context);
    return YES;
}
// 接收本地通知，进行下一步操作（应用在后台）
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
   NSString *context = notification.userInfo[@"context"];
    NSLog(@"%@",context);
    
}
    
- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler{
    
    if ([identifier isEqualToString:@"foreground"]) {
        NSLog(@"点击前台按钮");
        
    } else {
        
        NSLog(@"点击后台按钮");
        
    }
    //手动调用完成回调
    completionHandler();
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
