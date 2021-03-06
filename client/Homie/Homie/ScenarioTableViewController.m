//
//  ScenarioTableViewController.m
//  Homie
//
//  Created by Aaron on 11/14/15.
//  Copyright © 2015 Aaron. All rights reserved.
//

#import "ScenarioTableViewController.h"
#import "SettingScenarioTableViewController.h"
#import "AFNetworking.h"

#define DinningRoom_Light_DevKey        @"gSkx2IVxmcb1vrRdxLzFNla8"
#define BedRoom_Light_DevKey            @"IaNHSxlHOCQi8j4Yn9jVp0Id"
#define KitchenRoom_Light_DevKey        @"hoArgJtbDZhobWLExqO2OLcY"
#define BathRoom_Light_DevKey           @"XB5d5fZehHbSfPwtg55YxiBb"
#define DinningRoom_Fan_DevKey          @"yDSyUtmkeyaCaxnRoeNsJp6l"

@interface ScenarioTableViewController ()
@property (nonatomic, readwrite, assign) BOOL isCheckedBedTime;
@property (nonatomic, readwrite, assign) BOOL isCheckedVocationTime;
@property (nonatomic, readwrite, assign) BOOL isCheckedPartyTime;
@property (nonatomic, readwrite, assign) NSInteger checkedNum;
@property (nonatomic, readwrite, assign) BOOL isEdit;
@property (nonatomic, readwrite, strong) UIAlertController *alertController;
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
        _isEdit = NO;
    }
    return self;
}

#pragma mark - property

- (void)setIsEdit:(BOOL)isEdit
{
    _isEdit = isEdit;
    [self.tableView reloadData];
}

#pragma mark - view life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Scenario";
}

#pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isEdit)
    {
        return 3;
    }
    else
    {
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = @"Bed Time";
            if (self.isEdit)
            {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            else
            {
                cell.accessoryType = self.isCheckedBedTime ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
            }
            return cell;
            break;
        }
        case 1:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = @"Vacation Time";
            if (self.isEdit)
            {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            else
            {
                cell.accessoryType = self.isCheckedVocationTime ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
            }
            return cell;
            break;
        }
        case 2:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = @"Party Time";
            if (self.isEdit)
            {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            else
            {
                cell.accessoryType = self.isCheckedPartyTime ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
            }
            return cell;
            break;
        }
        case 3:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            cell.textLabel.text = @"Add More";
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
    
    if (indexPath.row == 3)
    {
        __weak ScenarioTableViewController *weakSelf = self;
        
        self.alertController = [UIAlertController alertControllerWithTitle:nil message:@"Scenario Name" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertActionCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            ;
        }];
        UIAlertAction *alertActionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSString *scenarioName = [weakSelf.alertController.textFields[0] text];
            [weakSelf.navigationController pushViewController:[[SettingScenarioTableViewController alloc] initWithScenarioName:scenarioName] animated:YES];
        }];

        [self.alertController addAction:alertActionCancel];
        [self.alertController addAction:alertActionOK];
        
        [self.alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            ;
        }];

        [self presentViewController:self.alertController animated:YES completion:nil];
        return;
    }
    
    if (self.isEdit)
    {
        //TDOO: Edit
    }
    else
    {
        if (self.checkedNum >= 0)
        {
            UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
            UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.checkedNum inSection:0]];
            
            if (self.checkedNum == indexPath.row)
            {
                if (newCell.accessoryType == UITableViewCellAccessoryNone)
                {
                    newCell.accessoryType = UITableViewCellAccessoryCheckmark;
                    [self useScenario:indexPath.row];
                }
                else if (newCell.accessoryType == UITableViewCellAccessoryCheckmark)
                {
                    newCell.accessoryType = UITableViewCellAccessoryNone;
                    [self useDefault];
                }
            }
            else
            {
                newCell.accessoryType = UITableViewCellAccessoryCheckmark;
                oldCell.accessoryType = UITableViewCellAccessoryNone;
                [self useScenario:indexPath.row];
                self.checkedNum = indexPath.row;
            }
        }
        else
        {
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            [self useScenario:indexPath.row];
            self.checkedNum = indexPath.row;
        }
    }
}

#pragma mark - tarPOST

- (void)edit: (UIBarButtonItem *)item
{
    if ([item.title isEqualToString:@"Edit"])
    {
        item.title = @"Cancel";
        self.isEdit = YES;
    }
    else
    {
        item.title = @"Edit";
        self.isEdit = NO;
    }
}

#pragma mark - private

- (void)useScenario: (NSInteger)row
{
    switch (row)
    {
        case 0:
        {
            [self useBedTime];
            break;
        }
        case 1:
        {
            [self useVocationTime];
            break;
        }
        case 2:
        {
            [self usePartyTime];
            break;
        }
        default:
        {
            break;
        }
    }
}

- (void)useBedTime
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/gSkx2IVxmcb1vrRdxLzFNla8" parameters: @{@"status": @"0"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/IaNHSxlHOCQi8j4Yn9jVp0Id" parameters:@{@"status": @"1"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/hoArgJtbDZhobWLExqO2OLcY" parameters:@{@"status": @"0"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/XB5d5fZehHbSfPwtg55YxiBb" parameters:@{@"status": @"0"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/yDSyUtmkeyaCaxnRoeNsJp6l" parameters:@{@"status": @"0"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)useVocationTime
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/gSkx2IVxmcb1vrRdxLzFNla8" parameters: @{@"status": @"0"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/IaNHSxlHOCQi8j4Yn9jVp0Id" parameters:@{@"status": @"0"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/hoArgJtbDZhobWLExqO2OLcY" parameters:@{@"status": @"0"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/XB5d5fZehHbSfPwtg55YxiBb" parameters:@{@"status": @"0"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/yDSyUtmkeyaCaxnRoeNsJp6l" parameters:@{@"status": @"0"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)usePartyTime
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/gSkx2IVxmcb1vrRdxLzFNla8" parameters: @{@"status": @"1"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/IaNHSxlHOCQi8j4Yn9jVp0Id" parameters:@{@"status": @"0"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/hoArgJtbDZhobWLExqO2OLcY" parameters:@{@"status": @"1"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/XB5d5fZehHbSfPwtg55YxiBb" parameters:@{@"status": @"1"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/yDSyUtmkeyaCaxnRoeNsJp6l" parameters:@{@"status": @"1"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)useDefault
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/gSkx2IVxmcb1vrRdxLzFNla8" parameters: @{@"status": @"0"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/IaNHSxlHOCQi8j4Yn9jVp0Id" parameters:@{@"status": @"0"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/hoArgJtbDZhobWLExqO2OLcY" parameters:@{@"status": @"0"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/XB5d5fZehHbSfPwtg55YxiBb" parameters:@{@"status": @"0"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [manager POST:@"http://192.241.199.31/api/v1/device/yDSyUtmkeyaCaxnRoeNsJp6l" parameters:@{@"status": @"0"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
