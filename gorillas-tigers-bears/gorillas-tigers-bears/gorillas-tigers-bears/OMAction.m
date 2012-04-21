//
//  OMAction.m
//  gorillas-tigers-bears
//
//  Created by Nick Kaye on 4/21/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import "OMAction.h"

@implementation OMAction

@synthesize name = _name;

-(OMAction *) initWithName: (NSString *) n
{
    self = [super init];
    if (!self) return self;
    self.name = n;
    return self;
}

-(NSString *) description
{
    return [NSString stringWithFormat:@"%@", self.name];
}

@end
