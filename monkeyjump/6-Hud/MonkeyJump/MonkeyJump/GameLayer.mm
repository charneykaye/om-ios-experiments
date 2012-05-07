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
#import "Monkey.h"
#import "Hud.h"

// HelloWorldLayer implementation
@implementation GameLayer

@synthesize highestObjectY;

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

        // add monkey
        monkey = [[[Monkey alloc] initWithGameLayer:self] autorelease];
        [objectLayer addChild:[monkey ccNode] z:10000];
        [monkey setPhysicsPosition:b2Vec2FromCC(240,150)];
        
        // enable accelerometer
        self.isAccelerometerEnabled = YES;
        
        // enable touches
        self.isTouchEnabled = YES;
        
        // add hud
        hud = [[[Hud alloc] init] autorelease];
        [self addChild:hud z:10000];
        
        nextDrop = 3.0f;  // drop first object after 3s
        dropDelay = 2.0f; // drop next object after 1s                
        
        [SimpleAudioEngine sharedEngine];
        
        [self scheduleUpdate];
    }
    
	return self;
}

-(void) update: (ccTime) dt
{
    // check for monkey's death
    if(monkey.isDead)
    {
        gameOverTimer += dt;
        if(gameOverTimer > 2.0)
        {
            // delete the physics objects
            [[GB2Engine sharedInstance] deleteAllObjects];
            
            // restart the level
            [[CCDirector sharedDirector] replaceScene:[GameLayer scene]];            
            return;
        }
    }
    
    // show monkey's energy in bananas
    [hud setEnergy:monkey.energy];
    
    // show the score
    [hud setScore:monkey.score];

    // monkeys position
    float mY = [monkey physicsPosition].y * PTM_RATIO;

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
            // this will increase game's difficulty
            dropDelay *= 0.98f;            
        }
        
        // create new random object
        nextObject = [Object randomObject];
        
        // but keep it disabled
        [nextObject setActive:NO];
        
        // set position
        float xPos = gFloatRand(40,440);
        float yPos = 400 + mY;
        [nextObject setPhysicsPosition:b2Vec2FromCC(xPos, yPos)];
        
        // add it to our object layer
        [objectLayer addChild:[nextObject ccNode]];
    }    
    
    // adjust camera
    const float monkeyHeight = 70.0f;
    const float screenHeight = 320.0f;
    float cY = mY - monkeyHeight - screenHeight/2.0f; 
    if(cY < 0)
    {
        cY = 0;
    }
    
    // do some parallax scrolling
    [objectLayer setPosition:ccp(0,-cY)];
    [floorBackground setPosition:ccp(0,-cY*0.8)]; // move floor background slower
    [background setPosition:ccp(0,-cY*0.6)];      // move main background even slower
    
    // iterate over objects and turn objects into static objects
    // if they are some distance below the monkey
    float pruneDistance = 240/PTM_RATIO;
    float prune = [monkey physicsPosition].y - pruneDistance;
    highestObjectY = 0.0f;

    [[GB2Engine sharedInstance] iterateObjectsWithBlock: ^(GB2Node* n) 
     {
         if([n isKindOfClass:[Object class]])
         {
             Object *o = (Object*)n;
             float y = [o physicsPosition].y;

             // record the highest object
             if((y > highestObjectY) && ([o active]))
             {
                 highestObjectY = y;
             }   

             if((y < prune) && 
                ([o linearVelocity].LengthSquared() < 0.1))
             {
                 // set object to static
                 // if it is below the monkey
                 [o setBodyType:b2_staticBody];
             }
         }
     }
     ];
}

- (void)accelerometer:(UIAccelerometer*)accelerometer 
        didAccelerate:(UIAcceleration*)acceleration
{
    // forward accelerometer value to monkey
    [monkey walk:acceleration.y];
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [monkey jump];    
}

@end
