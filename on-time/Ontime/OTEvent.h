//
//  omEvent.h
//  ontimeTests-alpha
//
//  Created by Nick Kaye on 4/21/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface OTEvent : NSManagedObject

@property long int idx;
@property (nonatomic, retain) NSDate *date;
@property (nonatomic, retain) NSString *name;

@end
