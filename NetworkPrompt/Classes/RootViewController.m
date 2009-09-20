//
//  RootViewController.m
//  NetworkPrompt
//
//  Created by Toby Boudreaux on 2/21/09.
//  Copyright CTO, The Barbarian Group 2009. All rights reserved.
//

#import "RootViewController.h"
#import "NetworkPromptAppDelegate.h"


@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	if(services == nil){
		services = [[NSMutableArray arrayWithObjects:@"Twitter.com", @"Facebook.com", @"TobyJoe.com", nil] retain];
	}
	if(outbox == nil){
		outbox = [[NSMutableArray alloc] init];
	}
	self.title = @"Ping Services";
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
	NSInteger num = 0;
	if([services count] > 0) num++;
	if([outbox count] > 0) num++;
    return num;
}

static const NSInteger kServicesSectionNumber = 0;
static const NSInteger kOutboxSectionNumber = 1;
static const NSInteger kSendingSectionNumber = 2;

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	NSLog(@"Number of rows in section %d", section);
	if(section == kServicesSectionNumber) {
		return [services count];
	}else if(section == kOutboxSectionNumber){
		NSLog(@"tableView: %@", tableView);
		return [outbox count];
	}else{
		return 0;
	}
	//	Return the number of Outbox pings
}


static NSString *CellIdentifier = @"Cell";

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"cellforrowatindexpath");
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	NSUInteger section = indexPath.section;
	NSUInteger row = indexPath.row;

	if(section == kServicesSectionNumber){
		if([services count] == 0){
			NSLog(@"returning placeholder.");
			return [self placeholderCell];
		}
		
		cell.text = [[services objectAtIndex:row] copy];
	}else{
		cell.text = [[outbox objectAtIndex:row] copy];
		cell.selected = NO;
		cell.textColor = [UIColor grayColor];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		cell.userInteractionEnabled = NO;
	}

    return cell;
}

- (UITableViewCell *)placeholderCell
{
    UITableViewCell *cell = [(UITableView *)self.view dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
	cell.text = @"No items.";
	cell.selected = NO;
	cell.textColor = [UIColor grayColor];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.userInteractionEnabled = NO;
	return cell;
}

- (BOOL)offline
{
	//	For this example, we will always be offline
	return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(indexPath.section != kServicesSectionNumber) return;
	
	UITableViewCell *currentCell = [tableView cellForRowAtIndexPath:indexPath];
	[services removeObjectAtIndex:indexPath.row];
	[outbox addObject:[currentCell.text copy]];

	//[tableView reloadData];
	//[tableView beginUpdates];
	/*if([tableView numberOfSections] < 2){
		NSIndexSet *sections = [NSIndexSet indexSetWithIndex:1];
		[tableView insertSections:sections withRowAnimation:UITableViewRowAnimationTop];
	}*/
	
	//[tableView endUpdates];
	
	
	[tableView beginUpdates];
	NSArray *paths = [NSArray arrayWithObject:indexPath];
	[tableView deleteRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationFade];
	NSUInteger newRow = [outbox count] - 1;
	
	NSArray *newPaths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:newRow inSection:kOutboxSectionNumber]];
	[tableView insertRowsAtIndexPaths:newPaths withRowAnimation:UITableViewRowAnimationFade];

	[tableView endUpdates];

	if([self offline]){
		[self showPrompt];
	}else{
		// Add a progress indicator to the cell and do your network mojo.
	}
}

- (void)showPrompt
{
	self.navigationItem.prompt = @"Offline. Will send later.";
	[self performSelector:@selector(hidePrompt:) withObject:self.view afterDelay:2.0];

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	if(section == kServicesSectionNumber){
		return @"Unpinged";
	}else if(section == kOutboxSectionNumber){
		return @"Outbox";
	}else{
		return @"Pending Pings";
	}
}

- (void)hidePrompt:(UITableView *)tableView
{
	NSIndexPath *currentlySelectedRow = [tableView indexPathForSelectedRow];
	UITableViewCell *currentCell = [tableView cellForRowAtIndexPath:currentlySelectedRow];
	if(currentCell != nil){
		currentCell.selected = NO;		
	}
	self.navigationItem.prompt = nil;
}


- (void)dealloc
{
	[services release];
	[outbox release];
    [super dealloc];
}


@end

