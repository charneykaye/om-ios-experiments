//
//  GameLayer.h
//  MonkeyJump
//
//  Created by Andreas Löw on 10.11.11.
//  Copyright codeandweb.de 2011. All rights reserved.
//

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

@class Object;
@class Monkey;

// GameLayer
@interface GameLayer : CCLayer
{
    CCSprite *background;                   //!< weak reference
    CCSprite *floorBackground;              //!< weak reference 
    CCSpriteBatchNode* objectLayer;         //!< weak reference

    ccTime nextDrop;                        //!< delay until next item drop
    ccTime dropDelay;                       //!< delay between drops

    Object *nextObject;                     //!< weak reference    
    
    Monkey *monkey;                         //!< weak reference
}

// returns a CCScene that contains the GameLayer as the only child
+(CCScene *) scene;

@end
