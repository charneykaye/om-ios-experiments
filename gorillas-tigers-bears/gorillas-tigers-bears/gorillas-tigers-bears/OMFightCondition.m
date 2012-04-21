//
//  OMFightCondition.m
//  gorillas-tigers-bears
//
//  Created by Nick Kaye on 4/20/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import "OMFightCondition.h"
#import "OMCharacter.h"
#import "OMStage.h"
#import "OMAction.h"

static int _count;

@implementation OMFightCondition

//------------------------------------------------------------
#pragma mark properties

@synthesize characterA;
@synthesize characterB;
@synthesize stage;
@synthesize actionA;
@synthesize actionB;
@synthesize num;

//------------------------------------------------------------
#pragma mark initializer

-(OMFightCondition *) initWithStage: (OMStage *) s andCharacterA: (OMCharacter *) ca andActionA: (OMAction *) aa andCharacterB: (OMCharacter *) cb andActionB: (OMAction *) ab
{
    self = [super init];
    if (!self) return self;
    ++_count;
    self.num = _count;
    self.characterA = ca;
    self.characterB = cb;
    self.stage = s;
    self.actionA = aa;
    self.actionB = ab;
    return self;
}

//------------------------------------------------------------
#pragma mark announce / log
-(void) announce
{
    // A and B are doing the same action
    if ([self.actionA isEqualTo:self.actionB])
    printf("fight #%i: %s and %s meet in %s. %s and %s both %s. What happens? Who wins?\n\n",self.num,[self.characterA.name UTF8String],[self.characterB.name UTF8String],[self.stage.name UTF8String],[self.characterA.name UTF8String],[self.characterB.name UTF8String],[self.actionB.name UTF8String]);
    
    // A and B are doing different actions, and A and B are the same character
    else if ([self.characterA isEqualTo:self.characterB])
    printf("fight #%i: %s and %s meet in %s. one %s %s and the other %s %s. What happens? Who wins?\n\n",self.num,[self.characterA.name UTF8String],[self.characterB.name UTF8String],[self.stage.name UTF8String],[self.characterA.name UTF8String],[self.actionA.name UTF8String],[self.characterB.name UTF8String],[self.actionB.name UTF8String]);

    // A and B are doing different actions, and A and B are different characters
    else
        printf("fight #%i: %s and %s meet in %s. %s %s but %s %s. What happens? Who wins?\n\n",self.num,[self.characterA.name UTF8String],[self.characterB.name UTF8String],[self.stage.name UTF8String],[self.characterA.name UTF8String],[self.actionA.name UTF8String],[self.characterB.name UTF8String],[self.actionB.name UTF8String]);
    
}


@end
