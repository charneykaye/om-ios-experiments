//
//  omSoundboardClip.m
//  Reality Check Soundboard
//
//  Created by Nick Kaye on 4/15/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "omSoundboardClip.h"
#import "omController.h"

@implementation omSoundboardClip

#pragma mark Initialization

-(id) initFromFile:(NSString*) f withController:(omController*) c{
    [super init];
//    NSLog(@"omSoundboardClip initialized, name:%@ controller:%@",f,[[c class] description] );
    name = f;
    controller = c;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:[[NSURL alloc] initFileURLWithPath: [[NSBundle mainBundle] pathForResource:f ofType:@"m4a"]] error:nil];
    [player setDelegate:self];
    [player prepareToPlay];
    return self;
}

#pragma mark Methods

-(BOOL) toggle
{
    if ([self isPlaying])
        [self stop]; 
    else {
        [self setCurrentTime:0];
        [self play];
    }
    return [self isPlaying];
}

-(BOOL) play
{
    [player play];
    [self viewSetBtnState];
    return [self isPlaying];
}

-(void) stop
{
    [player stop];
    [self viewSetBtnState];
}

-(void) setCurrentTime: (double)t
{
    [player setCurrentTime:t];
}

#pragma mark View Methods

-(void) viewSetBtnState
{
//    NSLog(@"viewSetBtnState sees controller class %@",[[controller class] description]);
    if ([self isPlaying])
        [controller setBtnStatePlaying:button];
    else
        [controller setBtnStateStopped:button];
}

#pragma mark Properties

-(BOOL) isPlaying
{
    return [player isPlaying];
}

-(void) setController: (omController*) c
{
    controller = c;
}

-(omController *) controller
{
    return controller;
}

-(void) setPlayer: (AVAudioPlayer*) p
{
    player = p;
}

-(AVAudioPlayer *) player
{
    return player;
}

#pragma mark Synthesized Properties
@synthesize name;
@synthesize button;

#pragma mark AVAudioPlayer delegate methods

- (void)audioPlayerDidFinishPlaying:(omSoundboardClip *)p successfully:(BOOL)flag
{
//    NSLog(@"%@ finished playing.",[self name]);
    [self viewSetBtnState];
    /*
     [viewController setActiveWhatsTheBusinessProblem];
     [viewController setActiveWhatIsTheAsk];
     [viewController setActiveWhyDoYouReallyWantThat];
     [viewController setActiveWhyIsThatAPriority];
     [viewController setActiveWhatsTheValue];
     [viewController setActiveWhyShouldntThatGoStraightToTheBacklog];
     [viewController setActiveCanYouDelineateTheWhatFromTheHow];
     [viewController setActiveWhatIsTheOutput];
     */
}

- (void)playerDecodeErrorDidOccur:(omSoundboardClip *)p error:(NSError *)error
{
}

// we will only get these notifications if playback was interrupted
- (void)audioPlayerBeginInterruption:(omSoundboardClip *)p
{
}

- (void)audioPlayerEndInterruption:(omSoundboardClip *)p
{
}

-(void) dealloc
{
    [player dealloc];
    [super dealloc];
}

@end
