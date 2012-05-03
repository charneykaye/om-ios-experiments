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

- (id)initWithSpriteFrameName:(NSString *)spriteFrameName world:(b2World *)world shapeName:(NSString *)shapeName maxHp:(float)maxHp {
    
    if ((self = [super initWithSpriteFrameName:spriteFrameName])) {        
        _hp = maxHp;
        _maxHp = maxHp;
        _world = world;
        _shapeName = [shapeName retain];        
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

- (void)dealloc {
    [_shapeName release];
    _shapeName = nil;
    [super dealloc];
}

@end
