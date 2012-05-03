//
//  LevelManager.mm
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

#import "LevelManager.h"
#import <QuartzCore/QuartzCore.h>

@implementation LevelManager
@synthesize gameState = _gameState;
@synthesize curLevelIdx = _curLevelIdx;

- (id)init {
    if ((self = [super init])) {
        
        NSString *levelDefsFile = [[NSBundle mainBundle] pathForResource:@"Levels" ofType:@"plist"];
        _data = [[NSDictionary dictionaryWithContentsOfFile:levelDefsFile] retain];
        NSAssert(_data != nil, @"Couldn't open Levels file");
        
        _levels = (NSArray *) [_data objectForKey:@"Levels"];
        NSAssert(_levels != nil, @"Couldn't find Levels entry");
        
        _curLevelIdx = -1;
        _curStageIdx = -1;
        _gameState = GameStateTitle;
        
    }
    return self;
}

- (BOOL)hasProp:(NSString *)prop {
    NSString * retval =  (NSString *) [_curStage objectForKey:prop];
    return retval != nil;
}

- (NSString *)stringForProp:(NSString *)prop {
    NSString * retval =  (NSString *) [_curStage objectForKey:prop];
    //NSAssert(retval != nil, @"Couldn't find prop %@", prop);
    return retval;
}

- (float)floatForProp:(NSString *)prop {
    NSNumber * retval = (NSNumber *) [_curStage objectForKey:prop];
    ///NSAssert(retval != nil, @"Couldn't find prop %@", prop);
    return retval.floatValue;
}

- (BOOL)boolForProp:(NSString *)prop {
    NSNumber * retval =  (NSNumber *) [_curStage objectForKey:prop];
    if (!retval) return FALSE;
    return [retval boolValue];
}

- (void)nextLevel {
    _curLevelIdx++;
    if (_curLevelIdx >= _levels.count) {
        _gameState = GameStateDone;
        return;
    }    
    _curStages = (NSArray *) [_levels objectAtIndex:_curLevelIdx];
    [self nextStage];
}

- (void)nextStage {
    _curStageIdx++;
    if (_curStageIdx >= _curStages.count) {
        _curStageIdx = -1;
        [self nextLevel];
        return;
    }
    
    _gameState = GameStateNormal;
    _curStage = [_curStages objectAtIndex:_curStageIdx];
    
    _stageDuration = [self floatForProp:@"Duration"];
    _stageStart = CACurrentMediaTime();
    
    NSLog(@"Stage ending in: %f", _stageDuration);
    
}

- (BOOL)update {
    if (_gameState == GameStateTitle || _gameState == GameStateDone) return FALSE;
    if (_stageDuration == -1) return FALSE;
    
    double curTime = CACurrentMediaTime();
    if (curTime > _stageStart + _stageDuration) {
        [self nextStage];
        return TRUE;
    }
    
    return FALSE;
}

- (void)dealloc {
    [_data release];
    [super dealloc];
}

@end