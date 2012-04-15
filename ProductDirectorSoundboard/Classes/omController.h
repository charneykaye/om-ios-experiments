//
//  omController.h
//  ProductDirectorSoundboard
//
//  Created by Nick Kaye on 4/14/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "omSoundboardClip.h"

@class omViewController;

@interface omController : NSObject {    
	BOOL								inBackground;
    omViewController                    * viewController;
}

@property (nonatomic, assign)	omSoundboardClip	*player;

@property (nonatomic, assign) omSoundboardClip	* playerWhatsTheBusinessProblem;
@property (nonatomic, assign) omSoundboardClip	* playerWhatIsTheAsk;
@property (nonatomic, assign) omSoundboardClip	* playerWhyDoYouReallyWantThat;
@property (nonatomic, assign) omSoundboardClip	* playerWhyIsThatAPriority;
@property (nonatomic, assign) omSoundboardClip	* playerWhatsTheValue;
@property (nonatomic, assign) omSoundboardClip	* playerWhyShouldntThatGoStraightToTheBacklog;
@property (nonatomic, assign) omSoundboardClip	* playerCanYouDelineateTheWhatFromTheHow;
@property (nonatomic, assign) omSoundboardClip	* playerWhatIsTheOutput;

@property (nonatomic, assign)	BOOL			inBackground;

-(void) initAudio;
-(void) initAudioPlayers;
-(omSoundboardClip*) initGetAudioPlayerFromFile:(NSString*) f;
-(void)initAudioPlayerButtons;

-(omViewController*) viewController;
-(void) setViewController: (omViewController*) vc;

-(void) pressedWhatsTheBusinessProblem;
-(void) pressedWhatIsTheAsk;
-(void) pressedWhyDoYouReallyWantThat;
-(void) pressedWhyIsThatAPriority;
-(void) pressedWhatsTheValue;
-(void) pressedWhyShouldntThatGoStraightToTheBacklog;
-(void) pressedCanYouDelineateTheWhatFromTheHow;
-(void) pressedWhatIsTheOutput;

- (void)registerForBackgroundNotifications;
- (void)setInBackgroundFlag;
- (void)clearInBackgroundFlag;

@end