//
//  omMaster.m
//  table test
//
//  Created by Nick Kaye on 4/17/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import "omMaster.h"

#pragma mark singleton instance
static omMaster * _instance;

#pragma mark -
@implementation omMaster

#pragma mark singleton method
-(omMaster *) connect
{
    if (!_instance)
        _instance = [omMaster new];
    return _instance;
}

@end
