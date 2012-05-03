//
//  ActionLayer.m
//  SpaceGame
//
//  Created by Ray Wenderlich on 6/24/11.
//  Copyright 2011 Ray Wenderlich. All rights reserved.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// DO NOT DISTRIBUTE WITHOUT PRIOR AUTHORIZATION (SEE LICENSE.TXT)
//

#import "ActionLayer.h"
#import "SimpleAudioEngine.h"
#import "Common.h"
#import "CCParallaxNode-Extras.h"

@implementation ActionLayer

+ (id)scene {
    
    CCScene *scene = [CCScene node];
    ActionLayer *layer = [ActionLayer node];
    [scene addChild:layer];
    return scene;
    
}

- (void)removeNode:(CCNode *)sender {
    [sender removeFromParentAndCleanup:YES];
}

- (void)invisNode:(CCNode *)sender {
    sender.visible = FALSE;
}

- (void)spawnShip {
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    
    _ship = [CCSprite spriteWithSpriteFrameName:@"SpaceFlier_sm_1.png"];
    _ship.position = ccp(-_ship.contentSize.width/2, 
                         winSize.height * 0.5);
    [_batchNode addChild:_ship z:1];
    
    [_ship runAction:
     [CCSequence actions:
      [CCEaseOut actionWithAction:
       [CCMoveBy actionWithDuration:0.5 
                           position:ccp(_ship.contentSize.width/2 + winSize.width*0.3, 0)]
                             rate:4.0],
      [CCEaseInOut actionWithAction:
       [CCMoveBy actionWithDuration:0.5 
                           position:ccp(-winSize.width*0.2, 0)]
                               rate:4.0],
      nil]];
    
    CCSpriteFrameCache * cache = 
        [CCSpriteFrameCache sharedSpriteFrameCache];

    CCAnimation *animation = [CCAnimation animation];
    [animation addFrame:
        [cache spriteFrameByName:@"SpaceFlier_sm_1.png"]];
    [animation addFrame:
        [cache spriteFrameByName:@"SpaceFlier_sm_2.png"]];
    animation.delay = 0.2;

    [_ship runAction:
     [CCRepeatForever actionWithAction:
      [CCAnimate actionWithAnimation:animation]]];
    
}

- (void)playTapped:(id)sender {
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"powerup.caf"];
    
    NSArray * nodes = [NSArray arrayWithObjects:_titleLabel1, _titleLabel2, _playItem, nil];
    for (CCNode *node in nodes) {
        [node runAction:
         [CCSequence actions:
          [CCEaseOut actionWithAction:
           [CCScaleTo actionWithDuration:0.5 scale:0] rate:4.0],
          [CCCallFuncN actionWithTarget:self selector:@selector(removeNode:)],
          nil]];
    }
    
    [self spawnShip];
    
}

- (void)setupTitle {
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    
    NSString *fontName = @"SpaceGameFont.fnt";
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        fontName = @"SpaceGameFont-hd.fnt";
    }
    
    _titleLabel1 = [CCLabelBMFont labelWithString:@"Space Game" fntFile:fontName];
    _titleLabel1.scale = 0;
    _titleLabel1.position = ccp(winSize.width/2, winSize.height * 0.8);
    [self addChild:_titleLabel1 z:100];
    [_titleLabel1 runAction:
     [CCEaseOut actionWithAction:
      [CCScaleTo actionWithDuration:1.0 scale:0.5] rate:4.0]];
    
    _titleLabel2 = [CCLabelBMFont labelWithString:@"Starter Kit" fntFile:fontName];
    _titleLabel2.position = ccp(winSize.width/2, winSize.height * 0.6);
    _titleLabel2.scale = 0;
    [self addChild:_titleLabel2 z:100];    
    [_titleLabel2 runAction:
     [CCSequence actions:
      [CCDelayTime actionWithDuration:1.0],
      [CCEaseOut actionWithAction:
       [CCScaleTo actionWithDuration:1.0 scale:1.25] rate:4.0],
      nil]];
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"title.caf"];
    
    CCLabelBMFont *playLabel = [CCLabelBMFont labelWithString:@"Play" fntFile:fontName];    
    _playItem = [CCMenuItemLabel itemWithLabel:playLabel target:self selector:@selector(playTapped:)];
    _playItem.scale = 0;
    _playItem.position = ccp(winSize.width/2, winSize.height * 0.3);

    CCMenu *menu = [CCMenu menuWithItems:_playItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu];

    [_playItem runAction:
     [CCSequence actions:
      [CCDelayTime actionWithDuration:2.0],
      [CCEaseOut actionWithAction:
       [CCScaleTo actionWithDuration:0.5 scale:0.5] rate:4.0],
      nil]];
    
}

- (void)setupSound {
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"SpaceGame.caf" loop:YES];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"explosion_large.caf"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"explosion_small.caf"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"laser_enemy.caf"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"laser_ship.caf"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"shake.caf"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"powerup.caf"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"boss.caf"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"cannon.caf"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"title.caf"];
}

- (void)setupStars {
    CGSize winSize = [CCDirector sharedDirector].winSize;
    NSArray *starsArray = [NSArray arrayWithObjects:@"Stars1.plist", @"Stars2.plist", @"Stars3.plist", nil];
    for(NSString *stars in starsArray) {        
        CCParticleSystemQuad *starsEffect = [CCParticleSystemQuad particleWithFile:stars];        
        starsEffect.position = ccp(winSize.width*1.5, winSize.height/2);
        starsEffect.posVar = ccp(starsEffect.posVar.x, (winSize.height/2) * 1.5);
        if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad) {
            starsEffect.scale = 0.5;
            starsEffect.posVar = ccpMult(starsEffect.posVar, 2.0);
        }
        [self addChild:starsEffect];
    }   
}

- (void)setupBatchNode {
    NSString *spritesPvrCcz = @"Sprites.pvr.ccz";
    NSString *spritesPlist = @"Sprites.plist"; 
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        spritesPvrCcz = @"Sprites-hd.pvr.ccz";
        spritesPlist = @"Sprites-hd.plist";
    }
    
    _batchNode = [CCSpriteBatchNode batchNodeWithFile:spritesPvrCcz];
    [self addChild:_batchNode z:-1];
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:spritesPlist];
}

- (void)setupArrays {
    _asteroidsArray = [[SpriteArray alloc] initWithCapacity:30 spriteFrameName:@"asteroid.png" batchNode:_batchNode];
    _laserArray = [[SpriteArray alloc] initWithCapacity:15 spriteFrameName:@"laserbeam_blue.png" batchNode:_batchNode];
}

- (void)setupBackground {
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    
    // 1) Create the CCParallaxNode
    _backgroundNode = [CCParallaxNode node];
    [self addChild:_backgroundNode z:-2];
    
    // 2) Create the sprites we'll add to the CCParallaxNode
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        _spacedust1 = [CCSprite spriteWithFile:@"bg_front_spacedust-hd.png"];
        _spacedust2 = [CCSprite spriteWithFile:@"bg_front_spacedust-hd.png"];
        _planetsunrise = [CCSprite spriteWithFile:@"bg_planetsunrise-hd.png"];
        _galaxy = [CCSprite spriteWithFile:@"bg_galaxy-hd.png"];
        _spacialanomaly = [CCSprite spriteWithFile:@"bg_spacialanomaly-hd.png"];
        _spacialanomaly2 = [CCSprite spriteWithFile:@"bg_spacialanomaly2-hd.png"];
        _spacedust1.scale = 1.5;
        _spacedust2.scale = 1.5;
    } else {
        _spacedust1 = [CCSprite spriteWithFile:@"bg_front_spacedust.png"];
        _spacedust2 = [CCSprite spriteWithFile:@"bg_front_spacedust.png"];
        _planetsunrise = [CCSprite spriteWithFile:@"bg_planetsunrise.png"];
        _galaxy = [CCSprite spriteWithFile:@"bg_galaxy.png"];
        _spacialanomaly = [CCSprite spriteWithFile:@"bg_spacialanomaly.png"];
        _spacialanomaly2 = [CCSprite spriteWithFile:@"bg_spacialanomaly2.png"];
    }
    
    // 3) Determine relative movement speeds for space dust and background
    CGPoint dustSpeed = ccp(0.1, 0.1);
    CGPoint bgSpeed = ccp(0.05, 0.05);
    
    // 4) Add children to CCParallaxNode
    [_backgroundNode addChild:_spacedust1 z:0 parallaxRatio:dustSpeed positionOffset:ccp(0,winSize.height/2)];
    [_backgroundNode addChild:_spacedust2 z:0 parallaxRatio:dustSpeed positionOffset:ccp(_spacedust1.contentSize.width*_spacedust1.scale,winSize.height/2)];     
    [_backgroundNode addChild:_galaxy z:-1 parallaxRatio:bgSpeed positionOffset:ccp(0,winSize.height * 0.7)];
    [_backgroundNode addChild:_planetsunrise z:-1 parallaxRatio:bgSpeed positionOffset:ccp(600,winSize.height * 0)];        
    [_backgroundNode addChild:_spacialanomaly z:-1 parallaxRatio:bgSpeed positionOffset:ccp(900,winSize.height * 0.3)];        
    [_backgroundNode addChild:_spacialanomaly2 z:-1 parallaxRatio:bgSpeed positionOffset:ccp(1500,winSize.height * 0.9)];
    
}

- (id)init {
    if ((self = [super init])) {
        [self setupSound];
        [self setupTitle];
        [self setupStars];
        [self setupBatchNode];
        self.isAccelerometerEnabled = YES;
        [self scheduleUpdate];
        [self setupArrays];
        self.isTouchEnabled = YES;
        [self setupBackground];
    }
    return self;    
}

- (void)updateShipPos:(ccTime)dt {
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    
    float maxY = winSize.height - _ship.contentSize.height/2;
    float minY = _ship.contentSize.height/2;
    
    float newY = _ship.position.y + (_shipPointsPerSecY * dt);
    newY = MIN(MAX(newY, minY), maxY);
    _ship.position = ccp(_ship.position.x, newY);
    
}

- (void)updateAsteroids:(ccTime)dt {
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    
    // Is it time to spawn an asteroid?
    double curTime = CACurrentMediaTime();
    if (curTime > _nextAsteroidSpawn) {
        
        // Figure out the next time to spawn an asteroid
        float randSecs = randomValueBetween(0.20, 1.0);
        _nextAsteroidSpawn = randSecs + curTime;
        
        // Figure out a random Y value to spawn the asteroid
        float randY = randomValueBetween(0.0, winSize.height);
        
        // Figure out a random amount of time it should take
        // to go from right to left
        float randDuration = randomValueBetween(2.0, 10.0);
        
        // Create a new asteroid sprite
        CCSprite *asteroid = [_asteroidsArray nextSprite];
        [asteroid stopAllActions];
        asteroid.visible = YES;
        
        // Set its position to be offscreen to the right
        asteroid.position = ccp(winSize.width+asteroid.contentSize.width/2, randY);
        
        // Set it's size to be one of 3 random sizes
        int randNum = arc4random() % 3;
        if (randNum == 0) {
            asteroid.scale = 0.25;
        } else if (randNum == 1) {
            asteroid.scale = 0.5;
        } else {
            asteroid.scale = 1.0;
        }
        
        // Move it offscreen to the left, and when it's done call removeNode
        [asteroid runAction:
         [CCSequence actions:
          [CCMoveBy actionWithDuration:randDuration position:ccp(-winSize.width-asteroid.contentSize.width, 0)],
          [CCCallFuncN actionWithTarget:self selector:@selector(invisNode:)],
          nil]];
        
    }
}

- (void)updateCollisions:(ccTime)dt {
    
    for (CCSprite *laser in _laserArray.array) {
        if (!laser.visible) continue;
        
        for (CCSprite *asteroid in _asteroidsArray.array) {
            if (!asteroid.visible) continue;
            
            if (CGRectIntersectsRect(asteroid.boundingBox, laser.boundingBox)) {
                
                [[SimpleAudioEngine sharedEngine] playEffect:@"explosion_large.caf" pitch:1.0f pan:0.0f gain:0.25f];
                asteroid.visible = NO;
                laser.visible = NO;
                break;
            }   
        }        
    }
    
}

- (void)updateBackground:(ccTime)dt {
    CGPoint backgroundScrollVel = ccp(-1000, 0);
    _backgroundNode.position = ccpAdd(_backgroundNode.position, ccpMult(backgroundScrollVel, dt));
    
    NSArray *spaceDusts = [NSArray arrayWithObjects:_spacedust1, _spacedust2, nil];
    for (CCSprite *spaceDust in spaceDusts) {
        if ([_backgroundNode convertToWorldSpace:spaceDust.position].x < -spaceDust.contentSize.width*self.scale) {
            [_backgroundNode incrementOffset:ccp(2*spaceDust.contentSize.width*spaceDust.scale,0) forChild:spaceDust];
        }
    }

    NSArray *backgrounds = [NSArray arrayWithObjects:_planetsunrise, _galaxy, _spacialanomaly, _spacialanomaly2, nil];
    for (CCSprite *background in backgrounds) {
        if ([_backgroundNode convertToWorldSpace:background.position].x < -background.contentSize.width*self.scale) {
            [_backgroundNode incrementOffset:ccp(2000,0) forChild:background];
        }
    }
}

- (void)update:(ccTime)dt {
    [self updateShipPos:dt];
    [self updateAsteroids:dt];
    [self updateCollisions:dt];
    [self updateBackground:dt];
}

- (void)accelerometer:(UIAccelerometer *)accelerometer 
        didAccelerate:(UIAcceleration *)acceleration {
    
    #define kFilteringFactor 0.75
    static UIAccelerationValue rollingX = 0, rollingY = 0, rollingZ = 0;
    
    rollingX = (acceleration.x * kFilteringFactor) + 
        (rollingX * (1.0 - kFilteringFactor));    
    rollingY = (acceleration.y * kFilteringFactor) + 
        (rollingY * (1.0 - kFilteringFactor));    
    rollingZ = (acceleration.z * kFilteringFactor) + 
        (rollingZ * (1.0 - kFilteringFactor));
    
    float accelX = rollingX;
    float accelY = rollingY;
    float accelZ = rollingZ;
    
    //NSLog(@"accelX: %f, accelY: %f, accelZ: %f", 
    //      accelX, accelY, accelZ);
    
    CGSize winSize = [CCDirector sharedDirector].winSize;

    #define kRestAccelX 0.6
    #define kShipMaxPointsPerSec (winSize.height*0.5)
    #define kMaxDiffX 0.2

    float accelDiffX = kRestAccelX - ABS(accelX);
    float accelFractionX = accelDiffX / kMaxDiffX;
    float pointsPerSecX = kShipMaxPointsPerSec * accelFractionX;

    _shipPointsPerSecY = pointsPerSecX;
    
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"laser_ship.caf" pitch:1.0f pan:0.0f gain:0.25f];
    
    CCSprite *shipLaser = [_laserArray nextSprite];
    [shipLaser stopAllActions];
    shipLaser.visible = YES;
    
    shipLaser.position = ccpAdd(_ship.position, ccp(shipLaser.contentSize.width/2, 0));
    [shipLaser runAction:
     [CCSequence actions:
      [CCMoveBy actionWithDuration:0.5 position:ccp(winSize.width, 0)],
      [CCCallFuncN actionWithTarget:self selector:@selector(invisNode:)],
      nil]];
    
}

- (void)dealloc {
    [_asteroidsArray release];
    [_laserArray release];
    [super dealloc];
}

@end
