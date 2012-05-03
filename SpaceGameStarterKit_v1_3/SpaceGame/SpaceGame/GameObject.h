//
//  GameObject.h
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

#import "cocos2d.h"
#import "Box2D.h"
#import "Common.h"

typedef enum {
    HealthBarTypeNone = 0,
    HealthBarTypeGreen,
    HealthBarTypeRed
} HealthBarType;

@interface GameObject : CCSprite {
    float _hp;
    float _maxHp;
    b2World* _world;
    b2Body* _body;
    NSString *_shapeName;
    HealthBarType _healthBarType;
    CCSprite * _healthBarBg;
    CCSprite * _healthBarProgress;
    CCSpriteFrame * _healthBarProgressFrame;
    float _fullWidth;
    float _displayedWidth;
}

@property (assign) float maxHp;

- (id)initWithSpriteFrameName:(NSString *)spriteFrameName world:(b2World *)world shapeName:(NSString *)shapeName maxHp:(float)maxHp healthBarType:(HealthBarType)healthBarType;
- (BOOL)dead;
- (void)destroy;
- (void)revive;
- (void)takeHit;

@end
