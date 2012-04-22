//
//  omEventTableViewController.h
//  getmethere-alpha
//
//  Created by Nick Kaye on 4/21/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import <UIKit/UIKit.h>

@interface omEventTableViewController : UITableViewController  { 
    
    
} 

#pragma mark properties
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSMutableArray *eventArray; 
@property BOOL inEditMode;
-(void) fetchRecords;

#pragma mark action handlers
-(void) addTime:(id)sender; 
-(void) addWasPressed:(id)sender;
-(void) editWasPressed:(id)sender;

@end
