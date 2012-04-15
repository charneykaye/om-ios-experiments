//
//  omController.m
//  ProductDirectorSoundboard
//
//  Created by Nick Kaye on 4/14/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//



#import "omController.h"
#import "omViewController.h"
#import "omSoundboardClip.h"

@implementation omController

@synthesize player;

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

- (void)initAudio
{
	[self registerForBackgroundNotifications];
    [self initAudioPlayers];
    
	OSStatus result = AudioSessionInitialize(NULL, NULL, NULL, NULL);
	if (result)
		NSLog(@"Error initializing audio session! %ld", result);
	
	[[AVAudioSession sharedInstance] setDelegate: self];
	NSError *setCategoryError = nil;
	[[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: &setCategoryError];
	if (setCategoryError)
		NSLog(@"Error setting category! %@", [[setCategoryError class] description]);
	
	result = AudioSessionAddPropertyListener (kAudioSessionProperty_AudioRouteChange, RouteChangeListener, self);
	if (result) 
		NSLog(@"Could not add property listener! %ld", result);
	
}

-(void)initAudioPlayers
{
//    NSLog(@"Preparing, we got viewController %@ and button %@",[[viewController class] description],[[[viewController btnWhatsTheBusinessProblem] class] description]);
    
	playerWhatsTheBusinessProblem = [self initGetAudioPlayerFromFile:@"WhatsTheBusinessProblem"];
    
	playerWhatIsTheAsk = [self initGetAudioPlayerFromFile:@"WhatIsTheAsk"];
    
	playerWhatIsTheOutput = [self initGetAudioPlayerFromFile:@"WhatIsTheOutput"];
    
	playerWhatsTheValue = [self initGetAudioPlayerFromFile:@"WhatsTheValue"];
    
	playerCanYouDelineateTheWhatFromTheHow = [self initGetAudioPlayerFromFile:@"CanYouDelineateTheWhatFromTheHow"];
    
	playerWhyDoYouReallyWantThat = [self initGetAudioPlayerFromFile:@"WhyDoYouReallyWantThat"];
    
	playerWhyIsThatAPriority = [self initGetAudioPlayerFromFile:@"WhyIsThatAPriority"];
    
	playerWhyShouldntThatGoStraightToTheBacklog = [self initGetAudioPlayerFromFile:@"WhyShouldntThatGoStraightToTheBacklog"];
}

-(omSoundboardClip*) initGetAudioPlayerFromFile:(NSString*) f {    
//    NSLog(@"Initialized %@ from file %@.m4a",[[p class] description],f);
    omSoundboardClip * p = [[omSoundboardClip alloc] initFromFile:f withController:self];
    return p;
}

-(void)initAudioPlayerButtons
{
//    NSLog(@"Preparing, we got viewController %@ and button %@",[[viewController class] description],[[[viewController btnWhatsTheBusinessProblem] class] description]);
    
	[playerWhatsTheBusinessProblem setButton:[viewController btnWhatsTheBusinessProblem]];
	[playerWhatIsTheAsk setButton:[viewController btnWhatIsTheAsk]];
	[playerWhatIsTheOutput setButton:[viewController btnWhatIsTheOutput]];
	[playerWhatsTheValue setButton:[viewController btnWhatsTheValue]];
	[playerCanYouDelineateTheWhatFromTheHow setButton:[viewController btnCanYouDelineateTheWhatFromTheHow]];
	[playerWhyDoYouReallyWantThat setButton:[viewController btnWhyDoYouReallyWantThat]];
	[playerWhyIsThatAPriority setButton:[viewController btnWhyIsThatAPriority]];
	[playerWhyShouldntThatGoStraightToTheBacklog setButton:[viewController btnWhyShouldntThatGoStraightToTheBacklog]];
    
}

-(omViewController *) viewController
{
    return viewController;
}

-(void) setViewController: (omViewController*) vc
{
//    NSLog(@"omController sets viewController to class %@",[[vc class]description]);
    viewController = vc;
}

-(void) setBtnStatePlaying: (UIButton*) b
{
    [viewController setBtnStatePlaying:b];
}

-(void) setBtnStateStopped: (UIButton*) b
{
    [viewController setBtnStateStopped:b];
}

-(void) pressedWhatsTheBusinessProblem
{
    [playerWhatsTheBusinessProblem toggle];
}

-(void) pressedWhatIsTheAsk
{
    [playerWhatIsTheAsk toggle];
}

-(void) pressedWhyDoYouReallyWantThat
{
    [playerWhyDoYouReallyWantThat toggle];
}

-(void) pressedWhyIsThatAPriority
{
    [playerWhyIsThatAPriority toggle];
}

-(void) pressedWhatsTheValue
{
    [playerWhatsTheValue toggle];
}

-(void) pressedWhyShouldntThatGoStraightToTheBacklog
{
    [playerWhyShouldntThatGoStraightToTheBacklog toggle];
}

-(void) pressedCanYouDelineateTheWhatFromTheHow
{
    [playerCanYouDelineateTheWhatFromTheHow toggle];
}

-(void) pressedWhatIsTheOutput
{
    [playerWhatIsTheOutput toggle];
}

/*
-(void)updateCurrentTimeForPlayer:(omSoundboardClip *)p
{
//    NSLog(@"updateCurrentTimeForPlayer");
}

- (void)updateCurrentTime
{
//    NSLog(@"updateCurrentTime");
}

- (void)updateViewForPlayerState:(omSoundboardClip *)p
{
//    NSLog(@"updateViewForPlayerState");	
}

- (void)updateViewForPlayerStateInBackground:(omSoundboardClip *)p
{
//    NSLog(@"updateViewForPlayerStateInBackground");
}

-(void)updateViewForPlayerInfo:(omSoundboardClip*)p
{
//    NSLog(@"updateViewForPlayerInfo");
}

-(void)pausePlaybackForPlayer:(omSoundboardClip*)p
{
	[p pause];
	[self updateViewForPlayerState:p];
}

-(void)startPlaybackForPlayer:(omSoundboardClip*)p
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
 */

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
//	omController* This = (omController*)inClientData;
	
	if (inID == kAudioSessionProperty_AudioRouteChange) {
		
		CFDictionaryRef routeDict = (CFDictionaryRef)inData;
		NSNumber* reasonValue = (NSNumber*)CFDictionaryGetValue(routeDict, CFSTR(kAudioSession_AudioRouteChangeKey_Reason));
		
		int reason = [reasonValue intValue];

		if (reason == kAudioSessionRouteChangeReason_OldDeviceUnavailable) {
//			[This pausePlaybackForPlayer:This.player];
		}
	}
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