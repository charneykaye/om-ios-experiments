//
//  omMainViewController.h
//  laptimer
//
//  Created by Nick Kaye on 4/21/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "omFlipsideViewController.h"

#import <CoreData/CoreData.h>

@interface omMainViewController : UIViewController <omFlipsideViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)showInfo:(id)sender;

@end
