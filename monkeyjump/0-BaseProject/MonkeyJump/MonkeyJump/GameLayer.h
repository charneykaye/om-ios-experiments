//
//  GameLayer.h
//  MonkeyJump
//
//  Created by Andreas Löw on 10.11.11.
//  Copyright codeandweb.de 2011. All rights reserved.
//

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// GameLayer
@interface GameLayer : CCLayer
{
}

// returns a CCScene that contains the GameLayer as the only child
+(CCScene *) scene;

@end
