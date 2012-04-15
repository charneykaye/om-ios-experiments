//
//  omController.h
//  ProductDirectorSoundboard
//
//  Created by Nick Kaye on 4/14/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@class omViewController;

@interface omController : NSObject <UIPickerViewDelegate, AVAudioPlayerDelegate> {
    
	AVAudioPlayer	* playerWhatsTheBusinessProblem;
	AVAudioPlayer	* playerWhatIsTheAsk;
	AVAudioPlayer	* playerWhyDoYouReallyWantThat;
	AVAudioPlayer	* playerWhyIsThatAPriority;
	AVAudioPlayer	* playerWhatsTheValue;
	AVAudioPlayer	* playerWhyShouldntThatGoStraightToTheBacklog;
	AVAudioPlayer	* playerCanYouDelineateTheWhatFromTheHow;
	AVAudioPlayer	* playerWhatIsTheOutput;
	
	BOOL								inBackground;
}

-(void) initAudio;
-(void) initAudioPlayers;
-(AVAudioPlayer*) initGetAudioPlayerFromFile:(NSString*) f;

-(void) playWhatsTheBusinessProblem;
-(void) playWhatIsTheAsk;
-(void) playWhyDoYouReallyWantThat;
-(void) playWhyIsThatAPriority;
-(void) playWhatsTheValue;
-(void) playWhyShouldntThatGoStraightToTheBacklog;
-(void) playCanYouDelineateTheWhatFromTheHow;
-(void) playWhatIsTheOutput;
-(BOOL) playTogglePlayer: (AVAudioPlayer *) p;

- (IBAction)buttonPressed:(UIButton*)sender;

- (void)registerForBackgroundNotifications;

@property (nonatomic, assign)	AVAudioPlayer	*player;
@property (nonatomic, assign)   NSURL * tempUrl;
@property (nonatomic, assign)	NSError	* playerError;

@property (nonatomic, assign)   omViewController * viewController;

@property (nonatomic, assign) AVAudioPlayer	* playerWhatsTheBusinessProblem;
@property (nonatomic, assign) AVAudioPlayer	* playerWhatIsTheAsk;
@property (nonatomic, assign) AVAudioPlayer	* playerWhyDoYouReallyWantThat;
@property (nonatomic, assign) AVAudioPlayer	* playerWhyIsThatAPriority;
@property (nonatomic, assign) AVAudioPlayer	* playerWhatsTheValue;
@property (nonatomic, assign) AVAudioPlayer	* playerWhyShouldntThatGoStraightToTheBacklog;
@property (nonatomic, assign) AVAudioPlayer	* playerCanYouDelineateTheWhatFromTheHow;
@property (nonatomic, assign) AVAudioPlayer	* playerWhatIsTheOutput;

@property (nonatomic, assign)	BOOL			inBackground;
@end