//
//  AppDelegate.m
//  Homie
//
//  Created by Aaron on 11/14/15.
//  Copyright © 2015 Aaron. All rights reserved.
//

#import "AppDelegate.h"
#import "ScenarioTableViewController.h"
#import "RoomsTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    ScenarioTableViewController *scenarioTableViewController = [[ScenarioTableViewController alloc] init];
    scenarioTableViewController.tabBarItem.title = @"Scenario";
//    scenarioTableViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    
    RoomsTableViewController *roomsTableViewController = [[RoomsTableViewController alloc] init];
    roomsTableViewController.tabBarItem.title = @"Room";
//    roomsTableViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:1];
    
    tabBarController.viewControllers = @[[[UINavigationController alloc] initWithRootViewController:scenarioTableViewController], [[UINavigationController alloc] initWithRootViewController:roomsTableViewController]];
    
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
