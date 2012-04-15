 //
 //  omAppDelegate.m
 //  ProductDirectorSoundboard
 //
 //  Created by Nick Kaye on 4/14/12.
 //  Copyright (c) 2012 Outright Mental. All rights reserved.
 //


#import "omAppDelegate.h"
#import "omViewController.h"

@implementation omAppDelegate

@synthesize window;
@synthesize viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
