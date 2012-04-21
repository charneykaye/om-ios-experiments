//
//  OMFightCondition.h
//  gorillas-tigers-bears
//
//  Created by Nick Kaye on 4/20/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OMCharacter;
@class OMStage;
@class OMAction;

@interface OMFightCondition : NSObject

#pragma mark properties
@property (nonatomic, assign) OMCharacter * characterA;
@property (nonatomic, assign) OMCharacter * characterB;
@property (nonatomic, assign) OMStage * stage;
@property (nonatomic, assign) OMAction * actionA;
@property (nonatomic, assign) OMAction * actionB;
@property int num;

#pragma mark announce / log
-(void) announce;

#pragma mark initializer
-(OMFightCondition *) initWithStage: (OMStage *) s andCharacterA: (OMCharacter *) ca andActionA: (OMCharacter *) aa andCharacterB: (OMCharacter *) cb andActionB: (OMCharacter *) ab;

@end
