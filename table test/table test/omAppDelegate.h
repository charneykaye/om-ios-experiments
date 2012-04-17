//
//  omAppDelegate.h
//  table test
//
//  Created by Nick Kaye on 4/17/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import <UIKit/UIKit.h>

@class omViewController;

@interface omAppDelegate : UIResponder <UIApplicationDelegate> {
UIWindow * window;
omViewController * viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet omViewController * viewController;
@end
