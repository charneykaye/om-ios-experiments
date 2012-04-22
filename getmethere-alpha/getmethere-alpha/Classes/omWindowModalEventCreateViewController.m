//
//  omWindowModalEventCreateViewController.m
//  getmethere-alpha
//
//  Created by Nick Kaye on 4/22/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import "omWindowModalEventCreateViewController.h"

@implementation omWindowModalEventCreateViewController

/*
 */
#pragma mark initializer

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*
 */
#pragma mark action handler methods
-(void) cancelWasPressed:(id)sender
{
    omLog(@"Cancel was pressed.");
}

-(void) saveWasPressed:(id)sender
{
    omLog(@"Save was pressed.");
}

/*
 */
#pragma core view delegates

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Create Event";
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelWasPressed:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveWasPressed:)];
    self.navigationItem.rightBarButtonItem = saveButton;    
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
