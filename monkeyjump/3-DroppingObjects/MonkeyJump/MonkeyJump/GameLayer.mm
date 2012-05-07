//
//  GameLayer.mm
//  MonkeyJump
//
//  Created by Andreas Löw on 10.11.11.
//  Copyright codeandweb.de 2011. All rights reserved.
//

// Import the interfaces
#import "GameLayer.h"
#import "GB2DebugDrawLayer.h"
#import "GB2Sprite.h"
#import "Floor.h"
#import "Object.h"
#import "GMath.h"
#import "SimpleAudioEngine.h"

// HelloWorldLayer implementation
@implementation GameLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super init])) 
    {		
        // load sprite atlases
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"jungle.plist"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"background.plist"];
        
        // load physics shapes
        [[GB2ShapeCache sharedShapeCache] addShapesWithFile:@"shapes.plist"];

	    // Setup background layer
        background = [CCSprite spriteWithSpriteFrameName:@"jungle.png"];
        [self addChild:background z:0];
        background.anchorPoint = ccp(0,0);
        background.position = ccp(0,0);
        
        // Setup floor background
        floorBackground = [CCSprite spriteWithSpriteFrameName:@"floor/grassbehind.png"];
        [self addChild:floorBackground z:1];
        floorBackground.anchorPoint = ccp(0,0);
        floorBackground.position = ccp(0,0);
        
        // add the debug draw layer, uncomment this if something strange happens ;)
//      [self addChild:[[GB2DebugDrawLayer alloc] init] z:30];
        
        // Setup object layer
    	objectLayer = [CCSpriteBatchNode batchNodeWithFile:@"jungle.pvr.ccz" capacity:150];
        [self addChild:objectLayer z:10];

        // Setup floor front layer, physics position is 0/0 by default
        [objectLayer addChild:[[Floor floorSprite] ccNode] z:20];

        // add walls to the left
        GB2Node *leftWall = [[GB2Node alloc] initWithStaticBody:nil node:nil];
        [leftWall addEdgeFrom:b2Vec2FromCC(0, 0) to:b2Vec2FromCC(0, 10000)];
        
        // add walls to the right
        GB2Node *rightWall = [[GB2Node alloc] initWithStaticBody:nil node:nil];
        [rightWall addEdgeFrom:b2Vec2FromCC(480, 0) to:b2Vec2FromCC(480, 10000)];
        
        nextDrop = 3.0f;  // drop first object after 3s
        dropDelay = 2.0f; // drop next object after 1s                
        
        [SimpleAudioEngine sharedEngine];
        
        [self scheduleUpdate];
    }
    
	return self;
}

-(void) update: (ccTime) dt
{
    // drop next item
    nextDrop -= dt;    
    if(nextDrop <= 0)
    {
        if(nextObject)
        {            
            // let the object drop
            [nextObject setActive:YES];
            
            // set next drop time
            nextDrop = dropDelay;
            
            // reduce delay to the drop after this
            // this will increase game&#039;s difficulty
            dropDelay *= 0.98f;            
            
        }
        
        // create new random object
        nextObject = [Object randomObject];
        
        // but keep it disabled
        [nextObject setActive:NO];
        
        // set position
        float xPos = gFloatRand(40,440);
        float yPos = 400;
        [nextObject setPhysicsPosition:b2Vec2FromCC(xPos, yPos)];
        
        // add it to our object layer
        [objectLayer addChild:[nextObject ccNode]];
    }    
}

@end
