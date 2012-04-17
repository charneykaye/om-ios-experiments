//
//  global.h
//  table test
//
//  Created by Nick Kaye on 4/17/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "constants.h"

#ifndef table_test_global_h
#define table_test_global_h

#pragma mark macros

#if !defined(LOG_DEVELOPER_VERBOSE_ENABLED) || LOG_DEVELOPER_VERBOSE_ENABLED == 0 
#define omLogDev(...) while(0)
#else
#define omLogDev(...) NSLog(@"%s-Line: %d->%@", __func__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#endif

#endif