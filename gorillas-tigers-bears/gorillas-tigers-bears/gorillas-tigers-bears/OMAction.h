//
//  OMAction.h
//  gorillas-tigers-bears
//
//  Created by Nick Kaye on 4/21/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OMAction : NSObject

@property (nonatomic, copy) NSString * name;

-(OMAction *) initWithName: (NSString *) n;

@end
