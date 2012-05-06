//
//  AppDelegate.h
//  ninjalgems
//
//  Created by Nick Kaye on 5/6/12.
//  Copyright Outright Mental 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
