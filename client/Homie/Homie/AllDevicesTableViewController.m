//
//  AllDevicesTableViewController.m
//  Homie
//
//  Created by Aaron on 11/14/15.
//  Copyright © 2015 Aaron. All rights reserved.
//

#import "AllDevicesTableViewController.h"

@interface AllDevicesTableViewController ()
@property (nonatomic, readwrite, strong) NSMutableDictionary *seletedDeviceDic;
@property (nonatomic, readwrite, strong) void (^handler)(NSMutableDictionary *selectedDevicesDic);
@end

@implementation AllDevicesTableViewController

- (id)initWithCompliteHandler: (void (^)(NSMutableDictionary *selectedDevicesDic))handler
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self)
    {
        _seletedDeviceDic = [NSMutableDictionary dictionaryWithCapacity:4];
        _seletedDeviceDic[@"Dinning Room"] = [NSMutableArray arrayWithCapacity:5];
        _seletedDeviceDic[@"Bed Room"] = [NSMutableArray arrayWithCapacity:5];
        _seletedDeviceDic[@"Kitchen"] = [NSMutableArray arrayWithCapacity:5];
        _seletedDeviceDic[@"Bath Room"] = [NSMutableArray arrayWithCapacity:5];
        _handler = handler;
    }
    return self;
}

#pragma mark - view life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
}

#pragma mark - table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return @"Dinning Room";
            break;
        }
        case 1:
        {
            return @"Bed Room";
            break;
        }
        case 2:
        {
            return @"Kitchen";
            break;
        }
        case 3:
        {
            return @"Bath Room";
            break;
        }
        default:
        {
            return @"";
            break;
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return 2;
            break;
        }
        case 1:
        {
            return 1;
            break;
        }
        case 2:
        {
            return 1;
            break;
        }
        case 3:
        {
            return 1;
            break;
        }
        default:
        {
            return 0;
            break;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                    cell.textLabel.text = @"My Light";
                    return cell;
                    break;
                }
                case 1:
                {
                    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                    cell.textLabel.text = @"My Fan";
                    return cell;
                    break;
                }
                default:
                {
                    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                    cell.textLabel.text = @"";
                    return cell;
                    break;
                }
            }
//            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            break;
        }
        case 1:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = @"My Light";
            return cell;
            break;
        }
        case 2:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = @"My Light";
            return cell;
            break;
        }
        case 3:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = @"My Light";
            return cell;
            break;
        }
        default:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = @"";
            return cell;
            break;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark)
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
                                     
    NSString *roomName = nil;
    switch (indexPath.section)
    {
        case 0:
        {
            roomName = @"Dinning Room";
            break;
        }
        case 1:
        {
            roomName = @"Bed Room";
            break;
        }
        case 2:
        {
            roomName = @"Kitchen";
            break;
        }
        case 3:
        {
            roomName = @"Bath Room";
            break;
        }
        default:
        {
            roomName = @"";
            break;
        }
    }
    
    [self.seletedDeviceDic[roomName] addObject:cell.textLabel.text];
}

#pragma mark - target

- (void)done
{
    self.handler(self.seletedDeviceDic);
}

@end
