//
//  AppDelegate.m
//  WXMovie
//
//  Created by bing on 16/7/18.
//  Copyright © 2016年 bing. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "LauchViewController.h"
#import "GuideViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //如果第一启动的话,我就在沙盒中设置一个值,等到以后每一次运行的时候,都判断下该值.
    //(1)path路径
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/dic.plist"];
    
    //(2)读取本地的文件 (返回的是字典)
    NSDictionary *isFirstDic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //注:第一个运行 该值是NO
    BOOL noFirst = [[isFirstDic objectForKey:@"noFirst"]boolValue];
    
    if (noFirst) {//不是第一次
        
        //进入启动界面
        
        LauchViewController *lauchVC = [[LauchViewController alloc]init];
        self.window.rootViewController =lauchVC;
        
        
    }else{//是第一次
        
        //引导界面
        GuideViewController *guideVC = [[GuideViewController alloc]init];
        self.window.rootViewController = guideVC;
        
        //创建字典
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:@"YES" forKey:@"noFirst"];
        
        //将一个字典写入到一个路径中 (自动创建plist文件)
        [dic writeToFile:path atomically:YES];
        
    }

    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
