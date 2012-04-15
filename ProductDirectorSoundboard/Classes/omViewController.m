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

-(IBAction) btnPressWhatsTheBusinessProblem
{
    [controller playWhatsTheBusinessProblem];
}

-(IBAction) btnPressWhatIsTheAsk
{
    [controller playWhatIsTheAsk];
}

-(IBAction) btnPressWhyDoYouReallyWantThat
{
    [controller playWhyDoYouReallyWantThat];
}

-(IBAction) btnPressWhyIsThatAPriority
{
    [controller playWhyIsThatAPriority];
}

-(IBAction) btnPressWhatsTheValue
{
    [controller playWhatsTheValue];
}

-(IBAction) btnPressWhyShouldntThatGoStraightToTheBacklog
{
    [controller playWhyShouldntThatGoStraightToTheBacklog];
}

-(IBAction) btnPressCanYouDelineateTheWhatFromTheHow
{
    [controller playCanYouDelineateTheWhatFromTheHow];
}

-(IBAction) btnPressWhatIsTheOutput
{
    [controller playWhatIsTheOutput];
}

/*
 // Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 // Custom initialization
 }
 return self;
 }
 */

/*
// Implement loadView to create a view hierarchy programmatically.
-(void)loadView {
    //	controller = [[omController alloc] init];
}
*/

// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
    [super viewDidLoad];
    if (!controller)
        controller = [[omController alloc] init];
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
