//
//  AppDelegate.m
//  FFJSPatch
//
//  Created by 张玲玉 on 16/8/11.
//  Copyright © 2016年 bj.zly.com. All rights reserved.
//

#import "AppDelegate.h"
#import "JPEngine.h"
#import "FFRootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    [JPEngine startEngine];
    
    NSString *source = [[NSBundle mainBundle] pathForResource:@"FFTableViewController" ofType:@"js"];
    NSString *script = [NSString stringWithContentsOfFile:source encoding:NSUTF8StringEncoding error:nil];
    [JPEngine evaluateScript:script];
    
    FFRootViewController *root = [[FFRootViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:root];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
