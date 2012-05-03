//
//  GameObject.mm
//  SpaceGame
//
//  Created by Ray Wenderlich on 6/25/11.
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

#import "GameObject.h"
#import "ShapeCache.h"

@implementation GameObject
@synthesize maxHp = _maxHp;

- (void)setupHealthBar {
    
    if (_healthBarType == HealthBarTypeNone) return;
    
    _healthBarBg = [CCSprite spriteWithSpriteFrameName:@"healthbar_bg.png"];
    _healthBarBg.position = ccpAdd(self.position, ccp(self.contentSize.width/2, -_healthBarBg.contentSize.height));
    [self addChild:_healthBarBg];
    
    NSString *progressSpriteName;
    if (_healthBarType == HealthBarTypeGreen) {
        progressSpriteName = @"healthbar_green.png";
    } else {
        progressSpriteName = @"healthbar_red.png";
    } 
    _healthBarProgressFrame = [[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:progressSpriteName] retain];
    _healthBarProgress = [CCSprite spriteWithSpriteFrameName:progressSpriteName];
    _healthBarProgress.position = ccp(_healthBarProgress.contentSize.width/2,
                                      _healthBarProgress.contentSize.height/2);
    _fullWidth = _healthBarProgress.textureRect.size.width;
    [_healthBarBg addChild:_healthBarProgress];
    
}

- (id)initWithSpriteFrameName:(NSString *)spriteFrameName world:(b2World *)world shapeName:(NSString *)shapeName maxHp:(float)maxHp healthBarType:(HealthBarType)healthBarType {
    
    if ((self = [super initWithSpriteFrameName:spriteFrameName])) {        
        _hp = maxHp;
        _maxHp = maxHp;
        _world = world;
        _shapeName = [shapeName retain];
        _healthBarType = healthBarType;
        [self setupHealthBar];
        [self scheduleUpdate];
    }
    return self;    
}

- (void) destroyBody {
    if (_body != NULL) {
        _world->DestroyBody(_body);
        _body = NULL;
    }
}

- (void) createBody {
    
    [self destroyBody];
    
    b2BodyDef bodyDef;
    bodyDef.type = b2_dynamicBody;
    bodyDef.position.Set(self.position.x/PTM_RATIO, 
                         self.position.y/PTM_RATIO);
    bodyDef.userData = self;
    _body = _world->CreateBody(&bodyDef);
    [[ShapeCache sharedShapeCache] 
     addFixturesToBody:_body
     forShapeName:_shapeName
     scale:self.scale];
    [self setAnchorPoint:
     [[ShapeCache sharedShapeCache] anchorPointForShape:_shapeName]];
    
}

- (void)setNodeInvisible:(CCNode *)sender {
    sender.position = CGPointZero;
    sender.visible = NO;
    [self destroyBody];
}

- (void)revive {
    _hp = _maxHp;
    [self stopAllActions];
    self.visible = YES;
    self.opacity = 255;
    [self createBody];
    _displayedWidth = _fullWidth;
    _healthBarBg.visible = NO;
}

- (BOOL)dead {
    return _hp == 0;
}

- (void)takeHit {
    if (_hp > 0) {
        _hp--;
    }
    if (_hp == 0) {
        [self destroy];
    } 
}

- (void)destroy {
    
    _hp = 0;
    [self stopAllActions];
    [self runAction:
     [CCSequence actions:
      [CCFadeOut actionWithDuration:0.1],
      [CCCallFuncN actionWithTarget:self 
                           selector:@selector(setNodeInvisible:)],
      nil]];
    
}

- (void)fadeOutDone {
    _healthBarBg.visible = FALSE;
}

- (void)update:(ccTime)dt {
    
    if (_healthBarType == HealthBarTypeNone) return;
    
    float POINTS_PER_SEC = 50;
    
    float percentage = _hp / _maxHp;
    percentage = MIN(percentage, 1.0);
    percentage = MAX(percentage, 0);
    float desiredWidth = _fullWidth *percentage;
    
    if (desiredWidth < _displayedWidth) {
        _displayedWidth = MAX(desiredWidth, _displayedWidth - POINTS_PER_SEC*dt);
    } else {
        _displayedWidth = MIN(desiredWidth, _displayedWidth + POINTS_PER_SEC*dt);
    }
    
    CGRect oldTextureRect = _healthBarProgress.textureRect;
    CGRect newTextureRect = CGRectMake(oldTextureRect.origin.x, 
                                       oldTextureRect.origin.y, 
                                       _displayedWidth, 
                                       oldTextureRect.size.height);
    
    CGRect rectInPixels = CC_RECT_POINTS_TO_PIXELS( newTextureRect );
    [_healthBarProgress setTextureRectInPixels:rectInPixels 
                                       rotated:_healthBarProgressFrame.rotated
                                 untrimmedSize:_healthBarProgressFrame.originalSizeInPixels];
    
    _healthBarProgress.position = ccp(_displayedWidth/2,
                                      _healthBarProgress.contentSize.height/2);
    
    if (desiredWidth != _displayedWidth) {
        _healthBarBg.visible = TRUE;
        [_healthBarBg stopAllActions];
        [_healthBarBg runAction:
         [CCSequence actions:
          [CCFadeTo actionWithDuration:0.25 opacity:255],
          [CCDelayTime actionWithDuration:2.0],
          [CCFadeTo actionWithDuration:0.25 opacity:0],
          [CCCallFunc actionWithTarget:self selector:@selector(fadeOutDone)],
          nil]];  
        [_healthBarProgress stopAllActions];
        [_healthBarProgress runAction:
         [CCSequence actions:
          [CCFadeTo actionWithDuration:0.25 opacity:255],
          [CCDelayTime actionWithDuration:2.0],
          [CCFadeTo actionWithDuration:0.25 opacity:0],
          nil]];
    }
    
}

- (void)dealloc {
    [_healthBarProgressFrame release];
    _healthBarProgressFrame = nil;
    [_shapeName release];
    _shapeName = nil;
    [super dealloc];
}

@end
