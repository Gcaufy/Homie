//
//  AllDevicesTableViewController.h
//  Homie
//
//  Created by Aaron on 11/14/15.
//  Copyright © 2015 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllDevicesTableViewController : UITableViewController
- (id)initWithCompliteHandler: (void (^)(NSMutableDictionary *selectedDevicesDic))handler;
@end
