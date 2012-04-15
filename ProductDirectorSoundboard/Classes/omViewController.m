//
//  omViewController.m
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

#import "omViewController.h"

@implementation omViewController

@synthesize controller;

@synthesize btnCanYouDelineateTheWhatFromTheHow, btnWhatIsTheAsk, btnWhatsTheValue, btnWhatIsTheOutput, btnWhyIsThatAPriority, btnWhyDoYouReallyWantThat, btnWhatsTheBusinessProblem, btnWhyShouldntThatGoStraightToTheBacklog;

-(IBAction) btnPressWhatsTheBusinessProblem
{
    [controller pressedWhatsTheBusinessProblem];
}

-(IBAction) btnPressWhatIsTheAsk
{
    [controller pressedWhatIsTheAsk];
}

-(IBAction) btnPressWhyDoYouReallyWantThat
{
    [controller pressedWhyDoYouReallyWantThat];
}

-(IBAction) btnPressWhyIsThatAPriority
{
    [controller pressedWhyIsThatAPriority];
}

-(IBAction) btnPressWhatsTheValue
{
    [controller pressedWhatsTheValue];
}

-(IBAction) btnPressWhyShouldntThatGoStraightToTheBacklog
{
    [controller pressedWhyShouldntThatGoStraightToTheBacklog];
}

-(IBAction) btnPressCanYouDelineateTheWhatFromTheHow
{
    [controller pressedCanYouDelineateTheWhatFromTheHow];
}

-(IBAction) btnPressWhatIsTheOutput
{
    [controller pressedWhatIsTheOutput];
}

-(void) setBtnStatePlaying: (UIButton *) btn
{
//    NSLog(@"setBtnStatePlaying: %@", [[btn class] description]);
    [btn setAlpha:0.5];
}

-(void) setBtnStateStopped: (UIButton *) btn
{
//    NSLog(@"setBtnStateStopped: %@", [[btn class] description]);
    [btn setAlpha:1.0];
}

// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
    [super viewDidLoad];
    if (!controller) {
        controller = [[omController alloc] init];
        [controller setViewController:self];
        [controller initAudioPlayerButtons];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

@end
