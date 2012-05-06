//
//  HelloWorldLayer.h
//  ningems
//
//  Created by Nick Kaye on 5/6/12.
//  Copyright Outright Mental 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayerColor
{
    NSMutableArray *_targets;
    NSMutableArray *_projectiles;
    int _projectilesDestroyed;
}

-(void)addTarget;
-(void) musicStart;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
