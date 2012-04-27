//
//  omTargetEditTableViewController.h
//  Ontime
//
//  Created by Nick Kaye on 4/27/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import <UIKit/UIKit.h>

@interface omTargetEditTableViewController : UITableViewController

#pragma mark action handler methods
-(IBAction) doTouchCancel:(id)sender;
-(IBAction) doTouchSave:(id)sender;
-(void) doEditRepeat;
-(void) doEditLocation;
-(void) doEditLabel;
-(void) doEditTbdTwo;

#pragma mark table
-(UITableViewCell *) tableCellRepeat: (UITableView *)tableView;
-(UITableViewCell *) tableCellLocation: (UITableView *)tableView;
-(UITableViewCell *) tableCellLabel: (UITableView *)tableView;
-(UITableViewCell *) tableCellTbdTwo: (UITableView *)tableView;
-(UITableViewCell *) tableCellInit: (UITableView *)tableView withIdentifier: (NSString *)CellIdentifier;

@end
