//
//  EnvironmentInfoTableViewController.m
//  Homie
//
//  Created by Aaron on 11/15/15.
//  Copyright © 2015 Aaron. All rights reserved.
//

#import "EnvironmentInfoTableViewController.h"
#import "WebViewController.h"

@interface EnvironmentInfoTableViewController ()

@end

@implementation EnvironmentInfoTableViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self)
    {
        
    }
    return self;
}

#pragma mark - table view

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = @"Temparature";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
            break;
        }
        case 1:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = @"Humidity";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
    
    switch (indexPath.row)
    {
        case 0:
        {
            [self.navigationController pushViewController:[[WebViewController alloc] initWithURLString:@"http://192.241.199.31/temparature"] animated: YES];
            break;
        }
        case 1:
        {
            [self.navigationController pushViewController:[[WebViewController alloc] initWithURLString:@"http://192.241.199.31/humidity"] animated: YES];
            break;
        }
        default:
        {
            break;
        }
    }
}

@end
