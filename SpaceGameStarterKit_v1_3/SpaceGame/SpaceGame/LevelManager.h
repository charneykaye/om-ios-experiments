//
//  LevelManager.h
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

#import <Foundation/Foundation.h>

typedef enum {
    GameStateTitle = 0,
    GameStateNormal,
    GameStateDone
} GameState;

@interface LevelManager : NSObject {
    
    GameState _gameState;
    double _stageStart;
    double _stageDuration;  
    
    NSDictionary * _data;
    NSArray * _levels;
    int _curLevelIdx;
    NSArray * _curStages;
    int _curStageIdx;
    NSDictionary * _curStage;
}

@property (assign) GameState gameState;
@property (readonly) int curLevelIdx;

- (void)nextStage;
- (void)nextLevel;
- (BOOL)update;
- (float)floatForProp:(NSString *)prop;
- (NSString *)stringForProp:(NSString *)prop;
- (BOOL)boolForProp:(NSString *)prop;
- (BOOL)hasProp:(NSString *)prop;

@end
