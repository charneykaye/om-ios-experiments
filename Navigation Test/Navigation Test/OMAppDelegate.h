//
//  OMAppDelegate.h
//  Navigation Test
//
//  Created by Nick Kaye on 4/23/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OMViewController;

@interface OMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) OMViewController *viewController;

@property (strong, nonatomic) UINavigationController *navigationController;

#pragma mark singleton
+(OMAppDelegate *) singleton;

@end
