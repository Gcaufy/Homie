//
//  RoomDetailTableViewController.m
//  Homie
//
//  Created by Aaron on 11/14/15.
//  Copyright © 2015 Aaron. All rights reserved.
//

#import "RoomDetailTableViewController.h"
#import "WebViewController.h"
#import "EnvironmentInfoTableViewController.h"
#import "AFNetworking.h"

@interface RoomDetailTableViewController ()
@property (nonatomic, readwrite, strong) NSString *roomName;
@end

@implementation RoomDetailTableViewController

- (id)initWithRoomName: (NSString *)roomName
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self)
    {
        _roomName = roomName;
    }
    return self;
}

#pragma mark - view life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.roomName;
}

#pragma mark - table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([self.roomName isEqualToString:@"Dinning Room"])
    {
        return 3;
    }
    else if ([self.roomName isEqualToString:@"Bed Room"])
    {
        return 1;
    }
    else if ([self.roomName isEqualToString:@"Kitchen"])
    {
        return 1;
    }
    else if ([self.roomName isEqualToString:@"Bath Room"])
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            if ([self.roomName isEqualToString:@"Dinning Room"])
            {
                return 2;
            }
            else if ([self.roomName isEqualToString:@"Bed Room"])
            {
                return 1;
            }
            else if ([self.roomName isEqualToString:@"Kitchen"])
            {
                return 1;
            }
            else if ([self.roomName isEqualToString:@"Bath Room"])
            {
                return 1;
            }
            else
            {
                return 0;
            }
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
            if ([self.roomName isEqualToString:@"Dinning Room"])
            {
                if (indexPath.row == 0)
                {
                    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                    cell.textLabel.text = @"My Light";
                    
                    UISwitch *lightSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(315, 7, 20, 10)];
                    [lightSwitch setOn:NO];
                    [lightSwitch addTarget:self action:@selector(switchLight:) forControlEvents:UIControlEventValueChanged];
                    
                    [cell.contentView addSubview:lightSwitch];
                    
                    
                    return cell;
                }
                else if (indexPath.row == 1)
                {
                    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                    cell.textLabel.text = @"My Fan";
                    
                    UISwitch *lightSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(315, 7, 20, 10)];
                    [lightSwitch setOn:NO];
                    [lightSwitch addTarget:self action:@selector(switchFan:) forControlEvents:UIControlEventValueChanged];
                    
                    [cell.contentView addSubview:lightSwitch];
                    
                    return cell;
                }
                else
                {
                    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                    return cell;
                }
            }
            else if ([self.roomName isEqualToString:@"Bed Room"])
            {
                UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                cell.textLabel.text = @"My Light";
                
                UISwitch *lightSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(315, 7, 20, 10)];
                [lightSwitch setOn:NO];
                [lightSwitch addTarget:self action:@selector(switchLight:) forControlEvents:UIControlEventValueChanged];
                
                [cell.contentView addSubview:lightSwitch];
                
                return cell;
            }
            else if ([self.roomName isEqualToString:@"Kitchen"])
            {
                UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                cell.textLabel.text = @"My Light";
                
                UISwitch *lightSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(315, 7, 20, 10)];
                [lightSwitch setOn:NO];
                [lightSwitch addTarget:self action:@selector(switchLight:) forControlEvents:UIControlEventValueChanged];
                
                [cell.contentView addSubview:lightSwitch];
                
                return cell;
            }
            else if ([self.roomName isEqualToString:@"Bath Room"])
            {
                UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                cell.textLabel.text = @"My Light";
                
                UISwitch *lightSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(315, 7, 20, 10)];
                [lightSwitch setOn:NO];
                [lightSwitch addTarget:self action:@selector(switchLight:) forControlEvents:UIControlEventValueChanged];
                
                [cell.contentView addSubview:lightSwitch];
                
                return cell;
            }
            else
            {
                UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                return cell;
            }
            break;
        }
        case 1:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = @"Camera";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
            break;
        }
        case 2:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = @"Environment Info";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
            break;
        }
        default:
        {
            return 0;
            break;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    
    switch (indexPath.section)
    {
        case 0:
        {
            if ([self.roomName isEqualToString:@"Dinning Room"])
            {
            }
            else if ([self.roomName isEqualToString:@"Bed Room"])
            {
            }
            else if ([self.roomName isEqualToString:@"Kitchen"])
            {
            }
            else if ([self.roomName isEqualToString:@"Bath Room"])
            {
            }
            else
            {
            }
            break;
        }
        case 1:
        {
            [self.navigationController pushViewController:[[WebViewController alloc] initWithURLString:@"http://192.241.199.31/camera"] animated: YES];
            break;
        }
        case 2:
        {
            [self.navigationController pushViewController:[[EnvironmentInfoTableViewController alloc] init] animated: YES];
            break;
        }
        default:
        {
            break;
        }
    }
}

#pragma mark - target

-(void)switchLight:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    
    NSString *status = isButtonOn ? @"1" : @"0";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    if ([self.roomName isEqualToString:@"Dinning Room"])
    {
        [manager POST:@"http://192.241.199.31/api/v1/device/gSkx2IVxmcb1vrRdxLzFNla8" parameters:@{@"status": status} success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    }
    else if ([self.roomName isEqualToString:@"Bed Room"])
    {
        [manager POST:@"http://192.241.199.31/api/v1/device/IaNHSxlHOCQi8j4Yn9jVp0Id" parameters:@{@"status": status} success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    }
    else if ([self.roomName isEqualToString:@"Kitchen"])
    {
        [manager POST:@"http://192.241.199.31/api/v1/device/hoArgJtbDZhobWLExqO2OLcY" parameters:@{@"status": status} success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    }
    else if ([self.roomName isEqualToString:@"Bath Room"])
    {
        [manager POST:@"http://192.241.199.31/api/v1/device/XB5d5fZehHbSfPwtg55YxiBb" parameters:@{@"status": status} success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    }
    else
    {
    }
}

-(void)switchFan:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    
    NSString *status = isButtonOn ? @"1" : @"0";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:@"http://192.241.199.31/api/v1/device/yDSyUtmkeyaCaxnRoeNsJp6l" parameters:@{@"status": status} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
