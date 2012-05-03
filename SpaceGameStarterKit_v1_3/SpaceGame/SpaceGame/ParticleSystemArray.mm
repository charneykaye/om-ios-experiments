//
//  ParticleSystemArray.mm
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

#import "ParticleSystemArray.h"

@implementation ParticleSystemArray
@synthesize array = _array;

- (id)initWithFile:(NSString *)file capacity:(int)capacity parent:(CCNode *)parent {
    
    if ((self = [super init])) {
        
        _array = [[CCArray alloc] initWithCapacity:capacity];
        for(int i = 0; i < capacity; ++i) {            
            
            CCParticleSystemQuad *particleSystem = [CCParticleSystemQuad particleWithFile:file];                       
            [particleSystem stopSystem];
            [parent addChild:particleSystem z:10];
            [_array addObject:particleSystem];
            
        }
        
    }
    return self;
    
}

- (id)nextParticleSystem {
    CCParticleSystemQuad * retval = [_array objectAtIndex:_nextItem];
    _nextItem++;
    if (_nextItem >= _array.count) _nextItem = 0; 
    
    // Reset particle system scale
    if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad) {
        retval.scale = 0.5;
    } else {
        retval.scale = 1.0;
    }
    
    return retval;
}

- (void)dealloc {
    [_array release];
    _array = nil;
    [super dealloc];
}

@end
