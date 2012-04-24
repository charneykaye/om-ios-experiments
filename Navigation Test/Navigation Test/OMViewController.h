//
//  OMViewController.h
//  Navigation Test
//
//  Created by Nick Kaye on 4/23/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OMViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *buttonBucket;

- (IBAction)buttonWasTouchedUpInside:(id)sender;

@end
