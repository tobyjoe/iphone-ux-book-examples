//
//  RootViewController.m
//  IndexedUITableViewSample
//
//  Created by Toby Boudreaux on 11/1/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "RootViewController.h"
#import "IndexedUITableViewSampleAppDelegate.h"


@implementation RootViewController

#define NUMBER_OF_CELLS 4


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	if(alphabet == nil){
		alphabet = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];	
	}
    return [alphabet count];
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
    cell.text = [NSString stringWithFormat:@"Item %i", indexPath.row];
    // Set up the cell
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic -- create and push a new view controller
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section is the region name -- get this from the dictionary at the section index
	NSLog(@"title for header in section: %i", section);
    return [NSString stringWithFormat:@"Section %@", [alphabet objectAtIndex:section]];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    /*
     Return the index titles for each of the sections (e.g. "A", "B", "C"...).
     */
	NSLog(@"sectionIndexTitlesForTableView.");
    return alphabet;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    // Return the index for the given section title
	NSLog(@"sectionForSectionIndexTitle: %@", title);
	return [alphabet indexOfObject:title];
}

- (void)viewDidLoad {
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
	[alphabet release];
	[super dealloc];
}


@end

