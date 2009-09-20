//
//  RootViewController.m
//  UITableViewSample
//
//  Created by Toby Boudreaux on 11/1/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import "RootViewController.h"
#import "UITableViewSampleAppDelegate.h"


@implementation RootViewController

- (void)viewDidLoad {
	self.title = @"Level 1";
	self.tableView.rowHeight = (self.view.frame.size.height - 40) / 8;
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.text = [NSString stringWithFormat:@"Item %i", indexPath.row];
    // Set up the cell
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	//	We don't care which thing was selected for the purposes of this example.
	//	We just want to show the new view sliding in.
	if(secondLevelViewController == nil){
		secondLevelViewController = [[SecondLevelViewController alloc] init];
	}
	[self.navigationController pushViewController:secondLevelViewController animated:YES];
	
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
	[secondLevelViewController release];
    [super dealloc];
}


@end

