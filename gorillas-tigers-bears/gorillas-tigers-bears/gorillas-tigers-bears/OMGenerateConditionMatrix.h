//
//  OMGenerateConditionMatrix.h
//  gorillas-tigers-bears
//
//  Created by Nick Kaye on 4/20/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import <Foundation/Foundation.h>

@class OMCharacter;
@class OMStage;
@class OMAction;

@interface OMGenerateConditionMatrix : NSObject
{        
#pragma mark properties
NSMutableSet * _characters;
NSMutableSet * _stages;
NSMutableSet * _actions;
NSMutableSet * _conditions;
}

#pragma property getter setter
-(NSMutableSet *) characters;
-(NSMutableSet *) stages;
-(NSMutableSet *) actions;
-(NSMutableSet *) conditions;

#pragma mark add contents
-(void) addCharacter: (OMCharacter *) c;
-(void) addStage: (OMStage *) s;
-(void) addAction:(OMAction *) a;

#pragma mark generate
-(void) generateAll;

@end
