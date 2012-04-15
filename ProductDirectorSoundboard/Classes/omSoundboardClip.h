//
//  omSoundboardClip.h
//  Reality Check Soundboard
//
//  Created by Nick Kaye on 4/15/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@class omController;

@interface omSoundboardClip : NSObject <AVAudioPlayerDelegate> {
    omController * controller;
    AVAudioPlayer * player;
}

#pragma mark Initialization
-(id) initFromFile:(NSString*) f withController:(omController*) vc;

#pragma mark Methods
-(BOOL) toggle;
-(BOOL) play;
-(void) stop;
-(void) setCurrentTime: (double)t;
-(void) setController: (omController *) c;
-(void) setPlayer: (AVAudioPlayer *) p;

#pragma mark Properties
-(BOOL) isPlaying;
-(omController *) controller;
-(AVAudioPlayer *) player;

#pragma mark Synthesized Properties
@property (nonatomic, assign) NSString              * name;
@property (nonatomic, assign) UIButton              * button;

#pragma mark AVAudioPlayer delegate methods
- (void)audioPlayerDidFinishPlaying:(omSoundboardClip *)p successfully:(BOOL)flag;
- (void)playerDecodeErrorDidOccur:(omSoundboardClip *)p error:(NSError *)error;
// we will only get these notifications if playback was interrupted
- (void)audioPlayerBeginInterruption:(omSoundboardClip *)p;
- (void)audioPlayerEndInterruption:(omSoundboardClip *)p;

@end
