//
//  omTargetEditViewController.m
//  Ontime
//
//  Created by Nick Kaye on 4/26/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "omTargetEditViewController.h"

@interface omTargetEditViewController ()

@end

@implementation omTargetEditViewController

/*
 */
#pragma mark properties

@synthesize delegate;

/*
 */
#pragma mark button actions

- (IBAction)cancel:(id)sender
{
	[self.delegate omTargetEditViewControllerDidCancel:self];
}

- (IBAction)save:(id)sender
{
	[self.delegate omTargetEditViewControllerDidSave:self];
}

/*
 */
#pragma mark - PlayerDetailsViewControllerDelegate

- (void)omTargetEditViewControllerDidCancel:(omTargetEditViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)omTargetEditViewControllerDidSave:(omTargetEditViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}


/*
 */
#pragma mark view nib protocol methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
