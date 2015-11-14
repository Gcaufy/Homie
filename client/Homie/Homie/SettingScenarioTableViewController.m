//
//  SettingScenarioTableViewController.m
//  Homie
//
//  Created by Aaron on 11/14/15.
//  Copyright © 2015 Aaron. All rights reserved.
//

#import "SettingScenarioTableViewController.h"
#import "AllDevicesTableViewController.h"

@interface SettingScenarioTableViewController ()
@property (nonatomic, readwrite, strong) NSString *scenarioName;
@property (nonatomic, readwrite, strong) NSMutableDictionary *seletedDeviceDic;
@end

@implementation SettingScenarioTableViewController

- (id)initWithScenarioName: (NSString *)scenarioName
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self)
    {
        _scenarioName = scenarioName;
    }
    return self;
}

#pragma mark - view life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
}

#pragma mark - table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.seletedDeviceDic count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.seletedDeviceDic allKeys][section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = [self.seletedDeviceDic allKeys][section];
    return [self.seletedDeviceDic[key] count];
}

#pragma mark - target

- (void)add: (UIBarButtonItem *)addItem
{
    __weak SettingScenarioTableViewController *weakSelf = self;
    
    AllDevicesTableViewController *allDevicesTableViewController = [[AllDevicesTableViewController alloc] initWithCompliteHandler:^(NSMutableDictionary *selectedDevicesDic) {
        
        NSMutableDictionary *tempDic = selectedDevicesDic;
        
        if ([tempDic[@"Dinning Room"] count] == 0)
        {
            [tempDic removeObjectForKey:@"Dinning Room"];
        }
        if ([tempDic[@"Bed Room"] count] == 0)
        {
            [tempDic removeObjectForKey:@"Bed Room"];
        }
        if ([tempDic[@"Kitchen"] count] == 0)
        {
            [tempDic removeObjectForKey:@"Kitchen"];
        }
        if ([tempDic[@"Bath Room"] count] == 0)
        {
            [tempDic removeObjectForKey:@"Bath Room"];
        }
        
        weakSelf.seletedDeviceDic = [tempDic copy];
        
        [weakSelf.tableView reloadData];
    }];
    
    [self.navigationController pushViewController:allDevicesTableViewController animated:YES];
}

@end
