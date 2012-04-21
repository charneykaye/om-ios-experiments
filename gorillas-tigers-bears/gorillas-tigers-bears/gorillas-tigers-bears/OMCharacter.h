//
//  OMCharacter.h
//  gorillas-tigers-bears
//
//  Created by Nick Kaye on 4/21/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OMStage;

@interface OMCharacter : NSObject

@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) OMStage * homeStage;

-(OMCharacter *) initWithName: (NSString *) n andHomeStage: (OMStage *) hs;

@end
