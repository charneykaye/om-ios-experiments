//
//  main.m
//  MonkeyJump
//
//  Created by Andreas Löw on 10.11.11.
//  Copyright codeandweb.de 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"AppDelegate");
    [pool release];
    return retVal;
}
