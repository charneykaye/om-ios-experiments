//
//  main.m
//  date test
//
//  Created by Nick Kaye on 4/29/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSDate * xDate = [NSDate dateWithNaturalLanguageString:@"April 19, 1983"];
        NSTimeInterval seconds = [xDate timeIntervalSinceNow];
        NSLog(@"%f",seconds);
        int years = (int) seconds / ( 60 * 60 * 24 * 365 );
        NSLog(@"%i years",years);
    }
    return 0;
}

