//
//  AppDelegate.m
//  TestTeamWork
//
//  Created by 韩扬 on 14/12/9.
//  Copyright (c) 2014年 GE. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<MSDynamicsDrawerViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.dynamicsDrawerViewController = [MSDynamicsDrawerViewController new];
    
    self.dynamicsDrawerViewController.delegate = self;

    [self.dynamicsDrawerViewController addStyler:[MSDynamicsDrawerParallaxStyler styler] forDirection:MSDynamicsDrawerDirectionLeft];
    
    MenuViewController *menuVC = [[MenuViewController alloc]initWithNibName:nil bundle:nil];
    
    menuVC.dynamicsDrawerViewController = self.dynamicsDrawerViewController;
    
    [self.dynamicsDrawerViewController setDrawerViewController:menuVC forDirection:MSDynamicsDrawerDirectionLeft];
    
    ViewController *vc = [[ViewController alloc]initWithNibName:nil bundle:nil];
    
    [self.dynamicsDrawerViewController setPaneViewController:vc];
    
    self.window.rootViewController = self.dynamicsDrawerViewController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - MSDynamicsDrawerViewControllerDelegate

- (void)dynamicsDrawerViewController:(MSDynamicsDrawerViewController *)drawerViewController mayUpdateToPaneState:(MSDynamicsDrawerPaneState)paneState forDirection:(MSDynamicsDrawerDirection)direction
{
    NSLog(@"Drawer view controller may update to state");
}

- (void)dynamicsDrawerViewController:(MSDynamicsDrawerViewController *)drawerViewController didUpdateToPaneState:(MSDynamicsDrawerPaneState)paneState forDirection:(MSDynamicsDrawerDirection)direction
{
    NSLog(@"Drawer view controller did update to state");
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
