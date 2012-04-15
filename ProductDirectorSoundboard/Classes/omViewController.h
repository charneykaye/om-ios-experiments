//
//  omViewController.h
//  ProductDirectorSoundboard
//
//  Created by Nick Kaye on 4/14/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

/*
 1. WhatsTheBusinessProblem
 2. WhatIsTheAsk
 3. WhyDoYouReallyWantThat
 4. WhyIsThatAPriority
 5. WhatsTheValue
 6. WhyShouldntThatGoStraightToTheBacklog
 7. CanYouDelineateTheWhatFromTheHow
 8. WhatIsTheOutput
 */ 

#import <UIKit/UIKit.h>
#import "omController.h"

@interface omViewController : UIViewController

@property (strong, nonatomic) IBOutlet omController * controller;
@property (strong, nonatomic) IBOutlet UIButton * btnCanYouDelineateTheWhatFromTheHow;
@property (strong, nonatomic) IBOutlet UIButton * btnWhatIsTheAsk;
@property (strong, nonatomic) IBOutlet UIButton * btnWhatIsTheOutput;
@property (strong, nonatomic) IBOutlet UIButton * btnWhatsTheBusinessProblem;
@property (strong, nonatomic) IBOutlet UIButton * btnWhatsTheValue;
@property (strong, nonatomic) IBOutlet UIButton * btnWhyDoYouReallyWantThat;
@property (strong, nonatomic) IBOutlet UIButton * btnWhyIsThatAPriority;
@property (strong, nonatomic) IBOutlet UIButton * btnWhyShouldntThatGoStraightToTheBacklog;      

-(IBAction) btnPressWhatsTheBusinessProblem;
-(IBAction) btnPressWhatIsTheAsk;
-(IBAction) btnPressWhyDoYouReallyWantThat;
-(IBAction) btnPressWhyIsThatAPriority;
-(IBAction) btnPressWhatsTheValue;
-(IBAction) btnPressWhyShouldntThatGoStraightToTheBacklog;
-(IBAction) btnPressCanYouDelineateTheWhatFromTheHow;
-(IBAction) btnPressWhatIsTheOutput;

-(void) setBtnStatePlaying: (UIButton *) btn;
-(void) setBtnStateStopped: (UIButton *) btn;

@end