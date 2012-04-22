//
//  omEventTableViewController.m
//  getmethere-alpha
//
//  Created by Nick Kaye on 4/21/12.
//  Copyright (c) 2012 Outright Mental. All rights reserved.
//

#import "omEventTableViewController.h"
#import "omAppDelegate.h"
#import "omEvent.h"

@implementation omEventTableViewController

/*
 */
#pragma mark properties

@synthesize managedObjectContext = _managedObjectContext;

@synthesize eventArray = _eventArray;

@synthesize inEditMode = _inEditMode;

/*
 */
#pragma mark initializer

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*
 */
#pragma mark action handlers

- (void)addTime:(id)sender { 
    
    omEvent * event = (omEvent *)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
    [event setTimeStamp: [NSDate date]]; 
    
    NSError *error;
    
    if(![self.managedObjectContext save:&error]){
        
#pragma todo add warning to user to try again or restart the application
        
	    //This is a serious error saying the record
	    //could not be saved. Advise the user to
	    //try again or restart the application. 
        
    }
    
    [self.eventArray insertObject:event atIndex:0];
    
    [self.tableView reloadData];
    
}

-(void) addWasPressed:(id)sender
{
    [[omAppDelegate instance] presentModalAddNewEvent];
}

-(void) editWasPressed:(id)sender
{
    self.inEditMode = !self.inEditMode;
    [self.tableView setEditing:self.inEditMode animated:YES];
}

/*
 */
#pragma mark data retrieval

- (void)fetchRecords { 
    
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
    
    // Setup the fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity]; 
    
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    
    // Fetch the records and handle an error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[self.managedObjectContext executeFetchRequest:request error:&error] mutableCopy]; 
    
    if (!mutableFetchResults) {
        // Handle the error.
        // This is a serious error and should advise the user to restart the application
    } 
    
    // Save our fetched data to an array
    [self setEventArray: mutableFetchResults];
} 

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Events";
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addWasPressed:)];
    self.navigationItem.rightBarButtonItem = addButton;

    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editWasPressed:)];
    self.navigationItem.leftBarButtonItem = editButton;
    
    [self fetchRecords];
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.eventArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { 
    
    static NSString *CellIdentifier = @"Cell";
    static NSDateFormatter *dateFormatter = nil; 
    
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"h:mm.ss a"];
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; 
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    
    omEvent *event = [self.eventArray objectAtIndex: [indexPath row]];
    omEvent *previousEvent = nil; 
    
    if ([self.eventArray count] > ([indexPath row] + 1)) {
        previousEvent = [self.eventArray objectAtIndex: ([indexPath row] + 1)];
    }
    
    [cell.textLabel setText: [dateFormatter stringFromDate: [event timeStamp]]]; 
    
    if (previousEvent) {
        NSTimeInterval timeDifference = [[event timeStamp] timeIntervalSinceDate: [previousEvent timeStamp]];
        [cell.detailTextLabel setText: [NSString stringWithFormat:@"+%.02f sec", timeDifference]];
    } else {
        [cell.detailTextLabel setText: @"---"];
    } 
    
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
