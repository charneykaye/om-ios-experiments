//
//  omViewController.m
//  ProductDirectorSoundboard
//
//  Created by Nick Kaye on 4/14/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "omViewController.h"

@implementation omViewController

// @synthesize display;

-(IBAction)btnPressed:(id)sender
{
    if (![sender isKindOfClass:[UIButton class]])
    NSLog(@"btnPressed sent a %@ class object",[[sender class] description]);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)btnWasPressed
{
    NSLog(@"That shit got pressed");
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
