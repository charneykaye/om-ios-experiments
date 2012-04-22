//
//  omEvent.h
//  getmethere-alpha
//
//  Created by Nick Kaye on 4/21/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface omEvent : NSManagedObject

@property (nonatomic, retain) NSDate *timeStamp;
@property (nonatomic, retain) NSString *name;

@end
