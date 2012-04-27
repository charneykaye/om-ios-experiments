//
//  omDataManager.h
//  ontimeTests
//
//  Created by Nick Kaye on 4/22/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import <Foundation/Foundation.h>

@interface OTDataManager : NSObject

#pragma mark properties
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

#pragma mark singleton
+(OTDataManager *) singleton;

#pragma event model properties
@property (nonatomic, retain) NSMutableArray *eventArray; 

#pragma event model methods
-(NSMutableArray *) eventReadAll;

#pragma mark core data stack
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
