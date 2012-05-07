/*
 MIT License
 
 Copyright (c) 2010 Andreas Loew / www.code-and-web.de
 
 For more information about htis module visit
 http://www.PhysicsEditor.de
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "Monkey.h"
#import "GB2Contact.h"
#import "GMath.h"
#import "Object.h"
#import "SimpleAudioEngine.h"
#import "GameLayer.h"

#define JUMP_IMPULSE 6.0f
#define WALK_FACTOR 3.0f
#define MAX_WALK_IMPULSE 0.2f
#define ANIM_SPEED 0.3f
#define MAX_VX 2.0f

@implementation Monkey

-(id) initWithGameLayer:(GameLayer*)gl
{    
    self = [super initWithDynamicBody:@"monkey"
                      spriteFrameName:@"monkey/idle/1.png"];
    
    if(self)
    {
        // do not let the monkey rotate
        [self setFixedRotation:true];
        
        // monkey uses continuous collision detection
        // to avoid sticking him into fast falling objects
        [self setBullet:YES];
        
        // store the game layer
        gameLayer = gl;
    }
    
    return self;
}

-(void) walk:(float)newDirection
{
    direction = newDirection;
}

-(void) updateCCFromPhysics
{
    // call the selector of the super class
    // this updates monkey's sprite from the physics
    [super updateCCFromPhysics];
        
    // update animation phase
    animDelay -= 1.0f/60.0f;
    if(animDelay <= 0)
    {
        animDelay = ANIM_SPEED;
        animPhase++;
        if(animPhase > 2)
        {
            animPhase = 1;
        }
    }
    
    // get the current velocity
    b2Vec2 velocity = [self linearVelocity];
    float vX = velocity.x;
    
    // determine direction of the monkey
    bool isLeft = (direction < 0);
    
    if((isLeft && (vX > -MAX_VX)) || ((!isLeft && (vX < MAX_VX))))
    {
        // apply the directional impulse
        float impulse = clamp(-[self mass]*direction*WALK_FACTOR, 
                              -MAX_WALK_IMPULSE, 
                              MAX_WALK_IMPULSE);            
        [self applyLinearImpulse:-b2Vec2(impulse,0) point:[self worldCenter]];        
    }

    // direction as string
    NSString *dir = isLeft ? @"left" : @"right";        

    // update animation phase
    NSString *frameName;
    const float standingLimit = 0.1;
    if((vX > -standingLimit) && (vX < standingLimit))
    {
        // standing
        frameName = [NSString stringWithFormat:@"monkey/idle/2.png"];            
    }
    else
    {
        // walking
        NSString *action = @"walk";
        frameName = [NSString stringWithFormat:@"monkey/%@/%@_%d.png", action, dir, animPhase];        
    }
    
    // set the display frame
    [self setDisplayFrameNamed:frameName];
}

@end
