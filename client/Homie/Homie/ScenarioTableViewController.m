//
//  ScenarioTableViewController.m
//  Homie
//
//  Created by Aaron on 11/14/15.
//  Copyright © 2015 Aaron. All rights reserved.
//

#import "ScenarioTableViewController.h"

@interface ScenarioTableViewController ()
@property (nonatomic, readwrite, assign) BOOL isCheckedBedTime;
@property (nonatomic, readwrite, assign) BOOL isCheckedVocationTime;
@property (nonatomic, readwrite, assign) BOOL isCheckedPartyTime;
@property (nonatomic, readwrite, assign) NSInteger checkedNum;
@end

@implementation ScenarioTableViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self)
    {
        _isCheckedBedTime = NO;
        _isCheckedVocationTime = NO;
        _isCheckedPartyTime = NO;
        _checkedNum = -1;
    }
    return self;
}

#pragma mark - view life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Scenario";
//    self.tabBarItem.title = @"Scenario";
}

#pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = @"Bed Time";
            cell.accessoryType = self.isCheckedBedTime ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
            return cell;
            break;
        }
        case 1:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = @"Vocation Time";
            cell.accessoryType = self.isCheckedVocationTime ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
            return cell;
            break;
        }
        case 2:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = @"Party Time";
            cell.accessoryType = self.isCheckedPartyTime ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
            return cell;
            break;
        }
        default:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            return cell;
            break;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = NO;
    
    if (self.checkedNum >= 0)
    {
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.checkedNum inSection:0]];
        
        if (self.checkedNum == indexPath.row)
        {
            if (newCell.accessoryType == UITableViewCellAccessoryNone)
            {
                newCell.accessoryType = UITableViewCellAccessoryCheckmark;
                //TODO: NET according indexPath.row
            }
            else if (newCell.accessoryType == UITableViewCellAccessoryCheckmark)
            {
                newCell.accessoryType = UITableViewCellAccessoryNone;
                //TODO: NET default
            }
//            [tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
        }
        else
        {
            newCell.accessoryType = UITableViewCellAccessoryCheckmark;
            oldCell.accessoryType = UITableViewCellAccessoryNone;
//            [tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:0], [NSIndexPath indexPathForRow:self.checkedNum inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
            //TODO: NET according indexPath.row
            self.checkedNum = indexPath.row;
        }
    }
    else
    {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        //TODO: NET according indexPath.row
        self.checkedNum = indexPath.row;
    }
}

@end
