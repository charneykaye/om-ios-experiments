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

@interface ActionLayer : CCLayer {
    CCLabelBMFont * _titleLabel1;
    CCLabelBMFont * _titleLabel2;
    CCMenuItemLabel *_playItem;
    CCSpriteBatchNode *_batchNode;
    CCSprite *_ship;
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
}

+ (id)scene;

@end