//
//  OMGenerateConditionMatrix.m
//  gorillas-tigers-bears
//
//  Created by Nick Kaye on 4/20/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import "OMGenerateConditionMatrix.h"
#import "OMFightCondition.h"

@implementation OMGenerateConditionMatrix

//------------------------------------------------------------
#pragma property getter setter
-(NSMutableSet *) characters
{
    if (!_characters) _characters = [[NSMutableSet alloc] initWithCapacity:MAX_CHARACTERS];
    return _characters;
}

-(NSMutableSet *) stages
{
    if (!_stages) _stages = [[NSMutableSet alloc] initWithCapacity:MAX_STAGES];
    return _stages;
}

-(NSMutableSet *) actions
{
    if (!_actions) _actions = [[NSMutableSet alloc] initWithCapacity:MAX_ACTIONS];
    return _actions;
}

-(NSMutableSet *) conditions
{
    if (!_conditions) _conditions = [[NSMutableSet alloc] initWithCapacity:MAX_CONDITIONS];
    return _conditions;
}

//------------------------------------------------------------
#pragma mark adding content

-(void) addCharacter:(OMCharacter *) c
{
    OMLog(@"+ character: %@",c);
    [self.characters addObject:c];
}

-(void) addStage:(OMStage *) s
{
    OMLog(@"+ stage: %@",s);
    [self.stages addObject:s];
}

-(void) addAction:(OMAction *) a
{
    OMLog(@"+ action: %@",a);
    [self.actions addObject:a];
}

//------------------------------------------------------------
#pragma mark generate

-(void) generateAll
{
    [self.conditions removeAllObjects];
    for (id ca in self.characters)
        for (id cb in self.characters)
            for (id s in self.stages)
                for (id aa in self.actions)
                    for (id ab in self.actions)
                        [self.conditions addObject:[[OMFightCondition alloc] initWithStage: s andCharacterA: ca andActionA: aa andCharacterB: cb andActionB:ab]];
//    OMLog(@"Generated %@ fight conditions.",[self.conditions count]);
}    

@end
