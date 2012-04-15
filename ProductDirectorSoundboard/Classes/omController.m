//
//  omController.m
//  ProductDirectorSoundboard
//
//  Created by Nick Kaye on 4/14/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//



#import "omController.h"
#import "omViewController.h"
#import <AVFoundation/AVAudioSettings.h>

@implementation omController

@synthesize player;
@synthesize tempUrl;
@synthesize playerError;

@synthesize viewController;

@synthesize inBackground;

@synthesize playerWhatsTheBusinessProblem, playerWhatIsTheAsk, playerWhyDoYouReallyWantThat, playerWhyIsThatAPriority, playerWhatsTheValue, playerWhyShouldntThatGoStraightToTheBacklog, playerCanYouDelineateTheWhatFromTheHow, playerWhatIsTheOutput; 

void RouteChangeListener(	void *                  inClientData,
							AudioSessionPropertyID	inID,
							UInt32                  inDataSize,
							const void *            inData);

-(omController *) init {
    [super init];
    [self initAudio];
    return self;
}

-(void) playWhatsTheBusinessProblem
{
    [self playTogglePlayer:playerWhatsTheBusinessProblem];
    [viewController setActiveWhatsTheBusinessProblem];
}

-(void) playWhatIsTheAsk
{
    [self playTogglePlayer:playerWhatIsTheAsk];
    [viewController setActiveWhatIsTheAsk];
}

-(void) playWhyDoYouReallyWantThat
{
    [self playTogglePlayer:playerWhyDoYouReallyWantThat];
    [viewController setActiveWhyDoYouReallyWantThat];
}

-(void) playWhyIsThatAPriority
{
    [self playTogglePlayer:playerWhyIsThatAPriority];
    [viewController setActiveWhyIsThatAPriority];
}

-(void) playWhatsTheValue
{
    [self playTogglePlayer:playerWhatsTheValue];
    [viewController setActiveWhatsTheValue];
}

-(void) playWhyShouldntThatGoStraightToTheBacklog
{
    [self playTogglePlayer:playerWhyShouldntThatGoStraightToTheBacklog];
    [viewController setActiveWhyShouldntThatGoStraightToTheBacklog];
}

-(void) playCanYouDelineateTheWhatFromTheHow
{
    [self playTogglePlayer:playerCanYouDelineateTheWhatFromTheHow];
    [viewController setActiveCanYouDelineateTheWhatFromTheHow];
}

-(void) playWhatIsTheOutput
{
    [self playTogglePlayer:playerWhatIsTheOutput];
    [viewController setActiveWhatIsTheOutput];
}

-(BOOL) playTogglePlayer: (AVAudioPlayer *) p
{
    if ([p isPlaying])
        [p stop]; 
    else {
        [p setCurrentTime:0];
        [p play];
    }
    return [p isPlaying];
}

-(void)updateCurrentTimeForPlayer:(AVAudioPlayer *)p
{
//    NSLog(@"updateCurrentTimeForPlayer");
}

- (void)updateCurrentTime
{
//    NSLog(@"updateCurrentTime");
}

- (void)updateViewForPlayerState:(AVAudioPlayer *)p
{
//    NSLog(@"updateViewForPlayerState");	
}

- (void)updateViewForPlayerStateInBackground:(AVAudioPlayer *)p
{
//    NSLog(@"updateViewForPlayerStateInBackground");
}

-(void)updateViewForPlayerInfo:(AVAudioPlayer*)p
{
//    NSLog(@"updateViewForPlayerInfo");
}


- (void)initAudio
{
	[self registerForBackgroundNotifications];
    [self initAudioPlayers];
			
	OSStatus result = AudioSessionInitialize(NULL, NULL, NULL, NULL);
//	if (result)
//		NSLog(@"Error initializing audio session! %ld", result);
	
	[[AVAudioSession sharedInstance] setDelegate: self];
	NSError *setCategoryError = nil;
	[[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: &setCategoryError];
//	if (setCategoryError)
//		NSLog(@"Error setting category! %@", [[setCategoryError class] description]);
	
	result = AudioSessionAddPropertyListener (kAudioSessionProperty_AudioRouteChange, RouteChangeListener, self);
//	if (result) 
//		NSLog(@"Could not add property listener! %ld", result);
	
}

-(void)initAudioPlayers
{
	playerWhatsTheBusinessProblem = [self initGetAudioPlayerFromFile:@"WhatsTheBusinessProblem"];
	playerWhatIsTheAsk = [self initGetAudioPlayerFromFile:@"WhatIsTheAsk"];
	playerWhatIsTheOutput = [self initGetAudioPlayerFromFile:@"WhatIsTheOutput"];
	playerWhatsTheValue = [self initGetAudioPlayerFromFile:@"WhatsTheValue"];
	playerCanYouDelineateTheWhatFromTheHow = [self initGetAudioPlayerFromFile:@"CanYouDelineateTheWhatFromTheHow"];
	playerWhyDoYouReallyWantThat = [self initGetAudioPlayerFromFile:@"WhyDoYouReallyWantThat"];
	playerWhyIsThatAPriority = [self initGetAudioPlayerFromFile:@"WhyIsThatAPriority"];
	playerWhyShouldntThatGoStraightToTheBacklog = [self initGetAudioPlayerFromFile:@"WhyShouldntThatGoStraightToTheBacklog"];
}

-(AVAudioPlayer*) initGetAudioPlayerFromFile:(NSString*) f{
    tempUrl = [[NSURL alloc] initFileURLWithPath: [[NSBundle mainBundle] pathForResource:f ofType:@"m4a"]];
    AVAudioPlayer * p = [[AVAudioPlayer alloc] initWithContentsOfURL:tempUrl error:nil];
    p.delegate = self;    
    [p prepareToPlay];
//    NSLog(@"Initialized %@ from file %@.m4a",[[p class] description],f);
    return p;
}

-(void)pausePlaybackForPlayer:(AVAudioPlayer*)p
{
	[p pause];
	[self updateViewForPlayerState:p];
}

-(void)startPlaybackForPlayer:(AVAudioPlayer*)p
{
	if ([p play])
	{
		[self updateViewForPlayerState:p];
	}
	else
    {
//		NSLog(@"Could not play %@\n", p.url);
    }
}

- (IBAction)buttonPressed:(UIButton *)sender
{
	if (player.playing == YES)
		[self pausePlaybackForPlayer: player];
	else
		[self startPlaybackForPlayer: player];
}

- (void)dealloc
{
	[super dealloc];
	
	[player release];
	
}

#pragma mark AudioSession handlers

void RouteChangeListener(	void *                  inClientData,
							AudioSessionPropertyID	inID,
							UInt32                  inDataSize,
							const void *            inData)
{
	omController* This = (omController*)inClientData;
	
	if (inID == kAudioSessionProperty_AudioRouteChange) {
		
		CFDictionaryRef routeDict = (CFDictionaryRef)inData;
		NSNumber* reasonValue = (NSNumber*)CFDictionaryGetValue(routeDict, CFSTR(kAudioSession_AudioRouteChangeKey_Reason));
		
		int reason = [reasonValue intValue];

		if (reason == kAudioSessionRouteChangeReason_OldDeviceUnavailable) {

			[This pausePlaybackForPlayer:This.player];
		}
	}
}

#pragma mark AVAudioPlayer delegate methods

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)p successfully:(BOOL)flag
{
    [viewController setActiveWhatsTheBusinessProblem];
    [viewController setActiveWhatIsTheAsk];
    [viewController setActiveWhyDoYouReallyWantThat];
    [viewController setActiveWhyIsThatAPriority];
    [viewController setActiveWhatsTheValue];
    [viewController setActiveWhyShouldntThatGoStraightToTheBacklog];
    [viewController setActiveCanYouDelineateTheWhatFromTheHow];
    [viewController setActiveWhatIsTheOutput];
}

- (void)playerDecodeErrorDidOccur:(AVAudioPlayer *)p error:(NSError *)error
{
//	NSLog(@"ERROR IN DECODE: %@\n", error); 
}

// we will only get these notifications if playback was interrupted
- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)p
{
//	NSLog(@"Interruption begin. Updating UI for new state");
	// the object has already been paused,	we just need to update UI
	if (inBackground)
	{
		[self updateViewForPlayerStateInBackground:p];
	}
	else
	{
		[self updateViewForPlayerState:p];
	}
}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)p
{
//	NSLog(@"Interruption ended. Resuming playback");
	[self startPlaybackForPlayer:p];
}

#pragma mark background notifications
- (void)registerForBackgroundNotifications
{
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(setInBackgroundFlag)
												 name:UIApplicationWillResignActiveNotification
											   object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(clearInBackgroundFlag)
												 name:UIApplicationWillEnterForegroundNotification
											   object:nil];
}

- (void)setInBackgroundFlag
{
	inBackground = true;
}

- (void)clearInBackgroundFlag
{
	inBackground = false;
}

@end