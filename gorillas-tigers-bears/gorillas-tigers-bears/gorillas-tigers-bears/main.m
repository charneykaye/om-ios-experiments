//
//  main.m
//  gorillas-tigers-bears
//
//  Created by Nick Kaye on 4/20/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import <Foundation/Foundation.h>
#import "OMGenerateConditionMatrix.h"
#import "OMFightCondition.h"
#import "OMCharacter.h"
#import "OMStage.h"
#import "OMAction.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
         
        // create stages
        OMStage * s1 = [[OMStage alloc] initWithName:@"the mountains"];
        OMStage * s2 = [[OMStage alloc] initWithName:@"the jungle"];
        OMStage * s3 = [[OMStage alloc] initWithName:@"the woods"];
        OMStage * s4 = [[OMStage alloc] initWithName:@"the zoo"];
        OMStage * s5 = [[OMStage alloc] initWithName:@"the circus"];
        OMStage * s6 = [[OMStage alloc] initWithName:@"the city"];

        // create characters
        OMCharacter * c1 = [[OMCharacter alloc] initWithName:@"gorilla" andHomeStage:s1];
        OMCharacter * c2 = [[OMCharacter alloc] initWithName:@"tiger" andHomeStage:s2];
        OMCharacter * c3 = [[OMCharacter alloc] initWithName:@"bear" andHomeStage:s3];

        // create actions
        OMAction * a1 = [[OMAction alloc] initWithName:@"fight"];
        OMAction * a2 = [[OMAction alloc] initWithName:@"flee"];
        
        // create condition matrix & generate set of fight conditions
        OMGenerateConditionMatrix *matrix = [OMGenerateConditionMatrix new];                
        [matrix addCharacter:c1];
        [matrix addCharacter:c2];
        [matrix addCharacter:c3];
        [matrix addStage:s1];
        [matrix addStage:s2];
        [matrix addStage:s3];
        [matrix addStage:s4];
        [matrix addStage:s5];
        [matrix addStage:s6];
        [matrix addAction:a1];
        [matrix addAction:a2];
        [matrix generateAll];
         
        // announce all fight conditions
        [matrix.conditions makeObjectsPerformSelector:@selector(announce)];
         
    }
    return 0;
}

