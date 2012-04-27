//
//  omTargetEditTableViewController.m
//  Ontime
//
//  Created by Nick Kaye on 4/27/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "omTargetEditTableViewController.h"

@interface omTargetEditTableViewController ()

@end

@implementation omTargetEditTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/*
 */
#pragma mark action handler methods

- (IBAction)doTouchCancel:(id)sender {
    OTLogDev(@"cancel");
}

- (IBAction)doTouchSave:(id)sender {
    OTLogDev(@"save");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void) doEditRepeat
{
    OTLogDev(@"repeat");
//    [self.destinationEditFieldViewController setupFieldRepeat];
//    [self.navigationController pushViewController:self.destinationEditFieldViewController animated:YES];
}

-(void) doEditLocation
{
    OTLogDev(@"location");
//    [self.destinationEditFieldViewController setupFieldLocation];
//    [self.navigationController pushViewController:self.destinationEditFieldViewController animated:YES];
}

-(void) doEditLabel
{
    OTLogDev(@"label");
//    [self.destinationEditFieldViewController setupFieldLabel];
//    [self.navigationController pushViewController:self.destinationEditFieldViewController animated:YES];
}

-(void) doEditTbdTwo
{
    OTLogDev(@"tbd");
//    [self.destinationEditFieldViewController setupFieldTbd];
//    [self.navigationController pushViewController:self.destinationEditFieldViewController animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { 
    
    switch(indexPath.row)
    {
        case 0:
            return [self tableCellRepeat: tableView];
            break;
        case 1:
            return [self tableCellLocation: tableView];
            break;
        case 2:
            return [self tableCellLabel: tableView];
            break;
        case 3:
            return [self tableCellTbdTwo: tableView];
            break;
    }
    
    return nil;
    /*
     
     static NSString *CellIdentifier, *CellTextLabel, *CellDetailTextLabel;
     
     OTLogDev(@"%i",indexPath.row);
     
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; 
     
     if (cell == nil)
     cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
     
     [cell.textLabel setText: CellTextLabel]; 
     [cell.detailTextLabel setText: CellDetailTextLabel];
     
     return cell;     
     */
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch(indexPath.row)
    {
        case 0:
            [self doEditRepeat];
            break;
        case 1:
            [self doEditLocation];
            break;
        case 2:
            [self doEditLabel];
            break;
        case 3:
            [self doEditTbdTwo];
            break;
    }    
}


-(UITableViewCell *) tableCellRepeat: (UITableView *)tableView
{
    UITableViewCell *cell = [self tableCellInit:tableView withIdentifier:@"Repeat"];
    [cell.textLabel setText: @"Repeat"]; 
    [cell.detailTextLabel setText: @"Whenever"];    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;         
}

-(UITableViewCell *) tableCellLocation: (UITableView *)tableView
{
    UITableViewCell *cell = [self tableCellInit:tableView withIdentifier:@"Location"];
    [cell.textLabel setText: @"Location"]; 
    [cell.detailTextLabel setText: @"Wherever"];    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;             
}

-(UITableViewCell *) tableCellLabel: (UITableView *)tableView
{
    UITableViewCell *cell = [self tableCellInit:tableView withIdentifier:@"Label"];
    [cell.textLabel setText: @"Label"]; 
    [cell.detailTextLabel setText: @"Whatever"];    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;         
}

-(UITableViewCell *) tableCellTbdTwo: (UITableView *)tableView
{
    UITableViewCell *cell = [self tableCellInit:tableView withIdentifier:@"T.B.D."];
    [cell.textLabel setText: @"T.B.D."]; 
    [cell.detailTextLabel setText: @"T.B.D."];    
    return cell;         
}

-(UITableViewCell *) tableCellInit: (UITableView *)tableView withIdentifier: (NSString *)CellIdentifier
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; 
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier]; 
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


@end
