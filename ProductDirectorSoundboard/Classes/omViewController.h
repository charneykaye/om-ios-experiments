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
{
    IBOutlet UIButton * btnCanYouDelineateTheWhatFromTheHow;
	IBOutlet UIButton * btnWhatIsTheAsk;
    IBOutlet UIButton * btnWhatIsTheOutput;
    IBOutlet UIButton * btnWhatsTheBusinessProblem;
    IBOutlet UIButton * btnWhatsTheValue;
    IBOutlet UIButton * btnWhyDoYouReallyWantThat;
    IBOutlet UIButton * btnWhyIsThatAPriority;
    IBOutlet UIButton * btnWhyShouldntThatGoStraightToTheBacklog;      
}

@property (strong, nonatomic) IBOutlet omController * controller;

-(IBAction) btnPressWhatsTheBusinessProblem;
-(IBAction) btnPressWhatIsTheAsk;
-(IBAction) btnPressWhyDoYouReallyWantThat;
-(IBAction) btnPressWhyIsThatAPriority;
-(IBAction) btnPressWhatsTheValue;
-(IBAction) btnPressWhyShouldntThatGoStraightToTheBacklog;
-(IBAction) btnPressCanYouDelineateTheWhatFromTheHow;
-(IBAction) btnPressWhatIsTheOutput;

-(void) setActiveWhatsTheBusinessProblem;
-(void) setActiveWhatIsTheAsk;
-(void) setActiveWhyDoYouReallyWantThat;
-(void) setActiveWhyIsThatAPriority;
-(void) setActiveWhatsTheValue;
-(void) setActiveWhyShouldntThatGoStraightToTheBacklog;
-(void) setActiveCanYouDelineateTheWhatFromTheHow;
-(void) setActiveWhatIsTheOutput;

@end