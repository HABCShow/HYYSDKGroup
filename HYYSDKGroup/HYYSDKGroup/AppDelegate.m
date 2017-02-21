//
//  AppDelegate.m
//  HYYSDKGroup
//
//  Created by xuchunlei on 2017/2/17.
//  Copyright © 2017年 abc_show. All rights reserved.
//

#import "AppDelegate.h"
#import "HYYMainViewController.h"
#import <UMSocialCore/UMSocialCore.h>


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
    
    // 友盟分享
    [self umengShare];
    return YES;
}
// 接收本地通知，进行下一步操作（应用在后台）
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
   NSString *context = notification.userInfo[@"context"];
    NSLog(@"%@",context);
    
}
// 友盟分享代码
-(void)umengShare{
    /* 打开调试日志 */
    [[UMSocialManager defaultManager] openLog:YES];
    
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"58ac68d982b635619d001933"];
    
    [self configUSharePlatforms];
    
    [self confitUShareSettings];
    
    
    
}
-(void)configUSharePlatforms{
    
    /* 设置新浪的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"3543611613"  appSecret:@"df46d3c44655ca6b477fe90b3de3280b" redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
    
}
-(void)confitUShareSettings{
    /*
     * 打开图片水印
     */
    [UMSocialGlobal shareInstance].isUsingWaterMark = YES;
    
    /*
     * 关闭强制验证https，可允许http图片分享，但需要在info.plist设置安全域名
     <key>NSAppTransportSecurity</key>
     <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>
     */
    [UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
    
    
}
    // 友盟回调
    // 支持所有iOS系统--新浪微博仅支持此方法
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
    {
        BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
        if (!result) {
            // 其他如支付等SDK的回调
        }
        return result;
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
