//
//  SecondLevelViewController.m
//  UITableViewSample
//
//  Created by Toby Boudreaux on 11/1/08.
//  Copyright 2008 CTO, The Barbarian Group. All rights reserved.
//

#import "SecondLevelViewController.h"


@implementation SecondLevelViewController

// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
	self.title = @"Item 1, Level 2";
	self.tableView.rowHeight = (self.view.frame.size.height - 40) / 4;
    [super viewDidLoad];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.text = [NSString stringWithFormat:@"Sub-Item %i", indexPath.row];
    // Set up the cell
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	//	We don't care which thing was selected for the purposes of this example.
	//	We just want to show the new view sliding in.
	if(detailViewController == nil){
		detailViewController = [[DetailViewController alloc] init];
	}
	[self.navigationController pushViewController:detailViewController animated:YES];
	
}


- (void)dealloc {
	[detailViewController release];
    [super dealloc];
}


@end

