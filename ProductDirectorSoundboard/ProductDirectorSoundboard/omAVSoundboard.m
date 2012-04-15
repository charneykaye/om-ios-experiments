//
//  omAVSoundboard.m
//  ProductDirectorSoundboard
//
//  Created by Nick Kaye on 4/14/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "omAVSoundboard.h"

@implementation omAVSoundboard

@synthesize player; // the player object

-(void)initSoundboard
{
    NSString * soundFilePath = [[NSBundle mainBundle] pathForResource: @"sound" ofType: @"wav"];
    
    NSURL * fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    
    AVAudioPlayer * newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
    
    self.player = newPlayer;
    
    [player prepareToPlay];
    [player setDelegate: self];
}

@end
