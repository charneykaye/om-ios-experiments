//
//  omAppDelegate.h
//  getmethere-alpha
//
//  Created by Nick Kaye on 4/21/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import <UIKit/UIKit.h>

@class omMainViewController;

@interface omAppDelegate : UIResponder <UIApplicationDelegate> 

#pragma mark properties
@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain) UINavigationController *navigationController; 
@property (strong, nonatomic) omMainViewController *mainViewController;

#pragma mark singleton
+(omAppDelegate *) instance;
-(void) assignSelfAsSingleton;

#pragma mark central application navigation control
-(void) presentModalAddNewEvent;

#pragma mark core data stack
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end
