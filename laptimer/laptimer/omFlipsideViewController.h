//
//  omFlipsideViewController.h
//  laptimer
//
//  Created by Nick Kaye on 4/21/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import <UIKit/UIKit.h>

@class omFlipsideViewController;

@protocol omFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(omFlipsideViewController *)controller;
@end

@interface omFlipsideViewController : UIViewController

@property (weak, nonatomic) id <omFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
