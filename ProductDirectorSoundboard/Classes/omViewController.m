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

-(void) setActiveWhatsTheBusinessProblem
{
	BOOL a = [[controller playerWhatsTheBusinessProblem] isPlaying];
//    NSLog(@"setActiveWhatsTheBusinessProblem: %@", a?@"YES":@"NO");
    if(a)
        [btnWhatsTheBusinessProblem setAlpha:0.5];
    else
        [btnWhatsTheBusinessProblem setAlpha:1.0];
}

-(void) setActiveWhatIsTheAsk
{
	BOOL a = [[controller playerWhatIsTheAsk] isPlaying];
//    NSLog(@"setActiveWhatIsTheAsk: %@", a?@"YES":@"NO");
    if(a)
        [btnWhatIsTheAsk setAlpha:0.5];
    else
        [btnWhatIsTheAsk setAlpha:1.0];
}

-(void) setActiveWhyDoYouReallyWantThat
{
	BOOL a = [[controller playerWhyDoYouReallyWantThat] isPlaying];
//    NSLog(@"setActiveWhyDoYouReallyWantThat: %@", a?@"YES":@"NO");
    if(a)
        [btnWhyDoYouReallyWantThat setAlpha:0.5];
    else
        [btnWhyDoYouReallyWantThat setAlpha:1.0];    
}

-(void) setActiveWhyIsThatAPriority
{
	BOOL a = [[controller playerWhyIsThatAPriority] isPlaying];
//    NSLog(@"setActiveWhyIsThatAPriority: %@", a?@"YES":@"NO");
    if(a)
        [btnWhyIsThatAPriority setAlpha:0.5];
    else
        [btnWhyIsThatAPriority setAlpha:1.0];
}

-(void) setActiveWhatsTheValue
{
	BOOL a = [[controller playerWhatsTheValue] isPlaying];
//    NSLog(@"setActiveWhatsTheValue: %@", a?@"YES":@"NO");
    if(a)
        [btnWhatsTheValue setAlpha:0.5];
    else
        [btnWhatsTheValue setAlpha:1.0];
}

-(void) setActiveWhyShouldntThatGoStraightToTheBacklog
{
	BOOL a = [[controller playerWhyShouldntThatGoStraightToTheBacklog] isPlaying];
//    NSLog(@"setActiveWhyShouldntThatGoStraightToTheBacklog: %@", a?@"YES":@"NO");
    if(a)
        [btnWhyShouldntThatGoStraightToTheBacklog setAlpha:0.5];
    else
        [btnWhyShouldntThatGoStraightToTheBacklog setAlpha:1.0];
}

-(void) setActiveCanYouDelineateTheWhatFromTheHow
{
	BOOL a = [[controller playerCanYouDelineateTheWhatFromTheHow] isPlaying];
//    NSLog(@"setActiveCanYouDelineateTheWhatFromTheHow: %@", a?@"YES":@"NO");
    if(a)
        [btnCanYouDelineateTheWhatFromTheHow setAlpha:0.5];
    else
        [btnCanYouDelineateTheWhatFromTheHow setAlpha:1.0];
}

-(void) setActiveWhatIsTheOutput
{
	BOOL a = [[controller playerWhatIsTheOutput] isPlaying];
//    NSLog(@"setActiveWhatIsTheOutput: %@", a?@"YES":@"NO");
    if(a)
        [btnWhatIsTheOutput setAlpha:0.5];
    else
        [btnWhatIsTheOutput setAlpha:1.0];
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
    if (!controller) {
        controller = [[omController alloc] init];
        [controller setViewController:self];
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
