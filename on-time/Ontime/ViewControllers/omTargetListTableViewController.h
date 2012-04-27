//
//  omTargetListTableViewController.h
//  Ontime
//
//  Created by Nick Kaye on 4/26/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import <UIKit/UIKit.h>

@interface omTargetListTableViewController : UITableViewController

-(UITableViewCell *) tableCellGeneric: (UITableView *)tableView;
-(UITableViewCell *) tableCellInit: (UITableView *)tableView withIdentifier: (NSString *)CellIdentifier;

@end
