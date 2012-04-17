//
//  omViewController.h
//  table test
//
//  Created by Nick Kaye on 4/17/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface omViewController : UIViewController 

{
    NSArray *books;
    NSMutableDictionary *sections;        
}

@property (nonatomic,retain) NSArray *books;
@property (nonatomic,retain) NSMutableDictionary *sections;

@end
