//
//  omTargetEditViewController.h
//  Ontime
//
//  Created by Nick Kaye on 4/26/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import <UIKit/UIKit.h>

@class omTargetEditViewController;

#pragma mark - omTargetEditViewDelegate protocol
@protocol omTargetEditViewDelegate <NSObject>
- (void)omTargetEditViewControllerDidCancel: (omTargetEditViewController *) controller;
- (void)omTargetEditViewControllerDidSave: (omTargetEditViewController *) controller;
@end

#pragma mark - omTargetEditViewController interface
@interface omTargetEditViewController : UITableViewController <omTargetEditViewDelegate>

#pragma mark properties
@property (nonatomic, weak) id <omTargetEditViewDelegate> delegate;

#pragma mark button actions
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
