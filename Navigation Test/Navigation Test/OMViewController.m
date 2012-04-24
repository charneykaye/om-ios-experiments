//
//  OMViewController.m
//  Navigation Test
//
//  Created by Nick Kaye on 4/23/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "OMViewController.h"
#import "OMAppDelegate.h"
#import "OMBucketViewController.h"

@interface OMViewController ()

@end

@implementation OMViewController
@synthesize buttonBucket;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setButtonBucket:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)buttonWasTouchedUpInside:(id)sender {
    [OMAppDelegate.singleton.navigationController pushViewController:[[OMBucketViewController alloc] init] animated:YES];
}
@end
