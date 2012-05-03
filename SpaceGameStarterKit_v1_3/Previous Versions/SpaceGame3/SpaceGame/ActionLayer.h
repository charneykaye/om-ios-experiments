//
//  ActionLayer.h
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

#import "cocos2d.h"
#import "SpriteArray.h"
#import "Box2D.h"
#import "GLES-Render.h"
#import "GameObject.h"
#import "ParticleSystemArray.h"
#import "LevelManager.h"

enum GameStage {
    GameStageTitle = 0,
    GameStageAsteroids,
    GameStageDone
};

@interface ActionLayer : CCLayer {
    CCLabelBMFont * _titleLabel1;
    CCLabelBMFont * _titleLabel2;
    CCMenuItemLabel *_playItem;
    CCSpriteBatchNode *_batchNode;
    GameObject *_ship;
    float _shipPointsPerSecY;
    double _nextAsteroidSpawn;
    SpriteArray * _asteroidsArray;
    SpriteArray * _laserArray;
    CCParallaxNode *_backgroundNode;
    CCSprite *_spacedust1;
    CCSprite *_spacedust2;
    CCSprite *_planetsunrise;
    CCSprite *_galaxy;
    CCSprite *_spacialanomaly;
    CCSprite *_spacialanomaly2;
    b2World * _world;
    GLESDebugDraw * _debugDraw;
    b2ContactListener * _contactListener;
    ParticleSystemArray * _explosions;
    GameStage _gameStage;
    BOOL _gameOver;
    //double _gameWonTime;
    LevelManager * _levelManager;
    CCLabelBMFont *_levelIntroLabel1;
    CCLabelBMFont *_levelIntroLabel2;
    SpriteArray * _alienArray;
    double _nextAlienSpawn;
    double _numAlienSpawns;
    CGPoint _alienSpawnStart;
    ccBezierConfig _bezierConfig;
    double _nextShootChance;
    SpriteArray * _enemyLasers;
    SpriteArray * _powerups;
    double _nextPowerupSpawn;
    BOOL _invincible;
    ParticleSystemArray * _boostEffects;
}

+ (id)scene;
- (void)newStageStarted;

@end