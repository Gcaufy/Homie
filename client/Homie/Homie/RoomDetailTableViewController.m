//
//  RoomDetailTableViewController.m
//  Homie
//
//  Created by Aaron on 11/14/15.
//  Copyright © 2015 Aaron. All rights reserved.
//

#import "RoomDetailTableViewController.h"
#import "WebViewController.h"

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
    return 3;
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
            else if ([self.roomName isEqualToString:@"Kitchen Room"])
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
                    return cell;
                }
                else if (indexPath.row == 1)
                {
                    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                    cell.textLabel.text = @"My Fan";
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
                return cell;
            }
            else if ([self.roomName isEqualToString:@"Kitchen Room"])
            {
                UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                cell.textLabel.text = @"My Light";
                return cell;
            }
            else if ([self.roomName isEqualToString:@"Bath Room"])
            {
                UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
                cell.textLabel.text = @"My Light";
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
            else if ([self.roomName isEqualToString:@"Kitchen Room"])
            {
            }
            else if ([self.roomName isEqualToString:@"Bath Room"])
            {
            }
            else
            {
            }
            
//            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"123" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//                ;
//            }];
//            UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                ;
//            }];
//            
//            [alertController addAction:alertAction];
//            [alertController addAction:alertAction2];
//            
//            [self presentViewController:alertController animated:YES completion:nil];
//            
            
            break;
        }
        case 1:
        {
            [self.navigationController pushViewController:[[WebViewController alloc] initWithURLString:@"http://www.baidu.com"] animated: YES];
            break;
        }
        case 2:
        {
            break;
        }
        default:
        {
            break;
        }
    }
}

@end
