//
//  omTargetListTableViewController.h
//  Ontime
//
//  Created by Nick Kaye on 4/26/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import <UIKit/UIKit.h>

#pragma mark - omTargetListTableViewDelegate protocol
@class omTargetListTableViewController;
@protocol omTargetListTableViewDelegate <NSObject>
- (void)omTargetEditTableViewControllerDidCancel: (omTargetListTableViewController *) controller;
- (void)omTargetEditTableViewControllerDidSave: (omTargetListTableViewController *) controller;
@end

#pragma mark interface
@interface omTargetListTableViewController : UITableViewController <omTargetListTableViewDelegate>

#pragma mark table cells
-(UITableViewCell *) tableCellGeneric: (UITableView *)tableView;
-(UITableViewCell *) tableCellInit: (UITableView *)tableView withIdentifier: (NSString *)CellIdentifier;

@end
