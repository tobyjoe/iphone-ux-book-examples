//
//  RootViewController.m
//  UITableViewControllerChainSample
//
//  Created by Toby Boudreaux on 11/3/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "RootViewController.h"
#import "UITableViewControllerChainSampleAppDelegate.h"


@implementation RootViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [nodes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"OMG_Its_a_Cell";
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	}

	cell.text = [NSString stringWithFormat:@"%@ - %@", self.title, [nodes objectAtIndex:indexPath.row]];

	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic -- create and push a new view controller
	RootViewController *nextLevelViewController = [[RootViewController alloc] init];
	[self.navigationController pushViewController:nextLevelViewController animated:YES];
	[nextLevelViewController release];
}


- (void)viewDidLoad
{
	if(nodes == nil){
		nodes = [NSArray arrayWithObjects:@"One", @"Two", @"Three", @"Four", nil];
		[nodes retain];
	}
	
	self.title = [NSString stringWithFormat:@"Level %i", [self.navigationController.viewControllers count]];

	[super viewDidLoad];
    // Uncomment the following line to add the Edit button to the navigation bar.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc
{
	[nodes release];
    [super dealloc];
}


@end

