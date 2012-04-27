//
//  omTargetRootViewController.m
//  Ontime
//
//  Created by Nick Kaye on 4/26/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "omTargetRootViewController.h"
#import "omTargetEditViewController.h"

@interface omTargetRootViewController ()

@end

@implementation omTargetRootViewController

/*
 */
#pragma mark navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    /*
	if ([segue.identifier isEqualToString:@"TargetAdd"])
	{
		UINavigationController *navigationController = 
        segue.destinationViewController;
		omTargetEditViewController 
        * targetEditViewController = 
        [[navigationController viewControllers] 
         objectAtIndex:0];
		[targetEditViewController setDelegate:self];
	}
     */
}

/*
 */
#pragma mark view protocol methods

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
