//
//  omTableView.m
//  table test
//
//  Created by Nick Kaye on 4/17/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "global.h"
#import "omTableView.h"

@implementation omTableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    int o;
    o = 1;
    return o;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString * o;
    o = @"Test";
    return o;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int o;
    o = 1;
    return o;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSArray * o;
    return o;
}

@end
