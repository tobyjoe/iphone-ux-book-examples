//
//  RootViewController.m
//  MonthIndexedUITableViewSample
//
//  Created by Toby Boudreaux on 11/1/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import "RootViewController.h"
#import "MonthIndexedUITableViewSampleAppDelegate.h"


@implementation RootViewController

#define NUMBER_OF_CELLS 7


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	if(months == nil){
		months = [NSArray arrayWithObjects:@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", nil];	
		[months retain];
	}
	if(weekdays == nil){
		weekdays = [NSArray arrayWithObjects:@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday", nil];	
		[weekdays retain];
	}
    return [months count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return NUMBER_OF_CELLS;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
	weekday = [[weekdays objectAtIndex:indexPath.row] copy];
	NSString *format = (indexPath.row > 4) ? @"%@: Freelance" : @"%@: Go to Work";
    cell.text = [NSString stringWithFormat:format, weekday];
    // Set up the cell
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic -- create and push a new view controller
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section is the region name -- get this from the dictionary at the section index
    return [NSString stringWithFormat:@"%@", [months objectAtIndex:section]];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    /*
     Return the index titles for each of the sections (e.g. "A", "B", "C"...)
     */
    return months;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    // Return the index for the given section title
	return [months indexOfObject:title];
}

- (void)viewDidLoad {
	self.title = @"Calendar: 2009-2044";
    [super viewDidLoad];
    // Uncomment the following line to add the Edit button to the navigation bar.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[months release];
	[weekday release];
	[weekdays release];
	[super dealloc];
}

@end

