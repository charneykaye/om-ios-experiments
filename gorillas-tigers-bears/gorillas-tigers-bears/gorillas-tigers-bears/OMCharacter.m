//
//  OMCharacter.m
//  gorillas-tigers-bears
//
//  Created by Nick Kaye on 4/21/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import "OMCharacter.h"
#import "OMStage.h"

@implementation OMCharacter

@synthesize name = _name;
@synthesize homeStage = _homeStage;

-(OMCharacter *) initWithName: (NSString *) n andHomeStage: (OMStage *) hs
{
    self = [super init];
    if (!self) return self;
    self.name = n;
    self.homeStage = hs;
    return self;
}

-(NSString *) description
{
    return [NSString stringWithFormat:@"%@", self.name];
}

@end
