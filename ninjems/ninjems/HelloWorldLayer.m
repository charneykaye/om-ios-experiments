//
//  HelloWorldLayer.m
//  ningems
//
//  Created by Nick Kaye on 5/6/12.
//  Copyright Outright Mental 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "SimpleAudioEngine.h"
#import "GameOverScene.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

static BOOL __isMusicPlaying;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void)gameLogic:(ccTime)dt {
    [self addTarget];
}

-(void)spriteMoveFinished:(id)sender {
    CCSprite *sprite = (CCSprite *)sender;
    if (sprite.tag == 1) { // target
        [_targets removeObject:sprite];
        GameOverScene *gameOverScene = [GameOverScene node];
        [gameOverScene.layer.label setString:@"womp :["];
        [[CCDirector sharedDirector] replaceScene:gameOverScene];        
    } else if (sprite.tag == 2) { // projectile
        [_projectiles removeObject:sprite];
    }    
    [self removeChild:sprite cleanup:YES];
}

- (void)update:(ccTime)dt {
    
    NSMutableArray *projectilesToDelete = [[NSMutableArray alloc] init];
    for (CCSprite *projectile in _projectiles) {
        CGRect projectileRect = CGRectMake(
                                           projectile.position.x - (projectile.contentSize.width/4), 
                                           projectile.position.y - (projectile.contentSize.height/4), 
                                           projectile.contentSize.width/2, 
                                           projectile.contentSize.height/2);
        
        NSMutableArray *targetsToDelete = [[NSMutableArray alloc] init];
        for (CCSprite *target in _targets) {
            CGRect targetRect = CGRectMake(
                                           target.position.x - (target.contentSize.width/4), 
                                           target.position.y - (target.contentSize.height/4), 
                                           target.contentSize.width/2, 
                                           target.contentSize.height/2);
            
            if (CGRectIntersectsRect(projectileRect, targetRect)) {
                [targetsToDelete addObject:target];				
            }						
        }
        
        for (CCSprite *target in targetsToDelete) {
            [_targets removeObject:target];
            [self removeChild:target cleanup:YES];									
            [[SimpleAudioEngine sharedEngine] playEffect:@"hit.caf"];            
            _projectilesDestroyed++;
            if (_projectilesDestroyed > 30) {
                GameOverScene *gameOverScene = [GameOverScene node];
                _projectilesDestroyed = 0;
                [gameOverScene.layer.label setString:@"You Win!"];
                [[CCDirector sharedDirector] replaceScene:gameOverScene];
            }            
        }
        
        if (targetsToDelete.count > 0) {
            [projectilesToDelete addObject:projectile];
        }
        [targetsToDelete release];
    }
    
    for (CCSprite *projectile in projectilesToDelete) {
        [_projectiles removeObject:projectile];
        [self removeChild:projectile cleanup:YES];
    }
    [projectilesToDelete release];
}

-(void)addTarget {
    
    CCSprite *target = [CCSprite spriteWithFile:@"target.png" 
                                           rect:CGRectMake(0, 0, 24, 64)]; 
    
    // Determine where to spawn the target along the Y axis
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    int minY = target.contentSize.height/2;
    int maxY = winSize.height - target.contentSize.height/2;
    int rangeY = maxY - minY;
    int actualY = (arc4random() % rangeY) + minY;
    
    // Create the target slightly off-screen along the right edge,
    // and along a random position along the Y axis as calculated above
    target.position = ccp(winSize.width + (target.contentSize.width/2), actualY);
    target.tag = 1;
    [_targets addObject:target];    
    [self addChild:target];
    
    // Determine speed of the target
    int minDuration = 2.0;
    int maxDuration = 4.0;
    int rangeDuration = maxDuration - minDuration;
    int actualDuration = (arc4random() % rangeDuration) + minDuration;
    
    // Create the actions
    id actionMove = [CCMoveTo actionWithDuration:actualDuration 
                                        position:ccp(-target.contentSize.width/2, actualY)];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self 
                                             selector:@selector(spriteMoveFinished:)];
    [target runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
    
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // Choose one of the touches to work with
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    // Set up initial location of projectile
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    CCSprite *projectile = [CCSprite spriteWithFile:@"gem-A.png" 
                                               rect:CGRectMake(0, 0, 25, 36)];
    projectile.position = ccp(20, winSize.height/2);
    
    // Determine offset of location to projectile
    int offX = location.x - projectile.position.x;
    int offY = location.y - projectile.position.y;
    
    // Bail out if we are shooting down or backwards
    if (offX <= 0) return;
    
    // Ok to add now - we've double checked position
    projectile.tag = 2;
    [_projectiles addObject:projectile];
    [self addChild:projectile];
    
    // Determine where we wish to shoot the projectile to
    int realX = winSize.width + (projectile.contentSize.width/2);
    float ratio = (float) offY / (float) offX;
    int realY = (realX * ratio) + projectile.position.y;
    CGPoint realDest = ccp(realX, realY);
    
    // Determine the length of how far we're shooting
    int offRealX = realX - projectile.position.x;
    int offRealY = realY - projectile.position.y;
    float length = sqrtf((offRealX*offRealX)+(offRealY*offRealY));
    float velocity = 400/1; // 480pixels/1sec
    float realMoveDuration = length/velocity;
    
    // Move projectile to actual endpoint
    [projectile runAction:[CCSequence actions:
                           [CCMoveTo actionWithDuration:realMoveDuration position:realDest],
                           [CCCallFuncN actionWithTarget:self selector:@selector(spriteMoveFinished:)],
                           nil]];
    
    // sound
    [[SimpleAudioEngine sharedEngine] playEffect:@"shoot.caf"];
    
}

/*
 */
#pragma mark initializer

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super initWithColor:ccc4(255,255,255,255)] )) {
		
        /*
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];
        label.position =  ccp( size.width /2 , size.height/2 );
        [self addChild: label];
         */

		// ask director the the window size
		CGSize winSize = [[CCDirector sharedDirector] winSize];
	
        // arrays
        _targets = [[NSMutableArray alloc] init];
        _projectiles = [[NSMutableArray alloc] init];
        
        // player
        CCSprite *player = [CCSprite spriteWithFile:@"ninja.png" 
                                               rect:CGRectMake(0, 0, 64, 59)];        
        player.position = ccp(player.contentSize.width/2, winSize.height/2);        
        [self addChild:player];
        
        // audio
        [self musicStart];

        
        // events
        [self schedule:@selector(gameLogic:) interval:1.0];
        [self schedule:@selector(update:)];
        self.isTouchEnabled = YES;
	}
	return self;
}

-(void) musicStart
{
    if (__isMusicPlaying) return;
    __isMusicPlaying = YES;
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"background-music-aac.caf"];
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
    [_targets release];
    _targets = nil;
    [_projectiles release];
    _projectiles = nil;	
    
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
