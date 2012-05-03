//
//  BossShip.h
//  SpaceGame
//
//  Created by Ray Wenderlich on 6/26/11.
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

@class ActionLayer;

@interface BossShip : GameObject {
    ActionLayer * _layer;
    BOOL _initialMove;
    CCSprite * _shooter1;
    CCSprite * _shooter2;
    CCSprite * _cannon;
}

- (id)initWithWorld:(b2World*)world layer:(ActionLayer*)layer;
- (void)updateWithShipPosition:(CGPoint)shipPosition;

@end
