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
#import "AFNetworking.h"

#define MAN_PASS @"http://192.241.199.31/api/v1/infrared/latest/%@"

@interface AppDelegate ()
@property (nonatomic, readwrite, strong) dispatch_source_t timer;
@property (nonatomic, readwrite, strong) NSString *timestamp;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0));
    
    self.timestamp = @"0";
    
    dispatch_source_set_event_handler(self.timer, ^{
        NSLog(@"timer trig");
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        [manager GET:[NSString stringWithFormat:MAN_PASS, self.timestamp] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
            
            NSDictionary *jsonDic = responseObject;
            self.timestamp = jsonDic[@"time"];
            if ([jsonDic[@"changed"] isEqualToString:@"1"])
            {
                //TODO:本地
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    });
    
    dispatch_source_set_timer(self.timer, dispatch_time(DISPATCH_TIME_NOW, 1), 1 * NSEC_PER_SEC, 0);
    
    dispatch_resume(self.timer);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    ScenarioTableViewController *scenarioTableViewController = [[ScenarioTableViewController alloc] init];
    scenarioTableViewController.tabBarItem.title = @"Scenario";
    scenarioTableViewController.tabBarItem.image = [UIImage imageNamed:@"Scenario"];
//    scenarioTableViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    
    RoomsTableViewController *roomsTableViewController = [[RoomsTableViewController alloc] init];
    roomsTableViewController.tabBarItem.title = @"Room";
    roomsTableViewController.tabBarItem.image = [UIImage imageNamed:@"Rooms"];
//    roomsTableViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:1];
    
    tabBarController.viewControllers = @[[[UINavigationController alloc] initWithRootViewController:scenarioTableViewController], [[UINavigationController alloc] initWithRootViewController:roomsTableViewController]];
    
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
