//
//  omAVSoundboard.h
//  ProductDirectorSoundboard
//
//  Created by Nick Kaye on 4/14/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface omAVSoundboard

@property (nonatomic, retain) AVAudioPlayer *player;

-(void)initSoundboard;

@end
