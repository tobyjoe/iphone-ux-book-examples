//
//  RootViewController.m
//  Companies
//
//  Created by Toby Boudreaux on 1/25/09.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "RootViewController.h"
#import "CompaniesAppDelegate.h"
#import "EmployeesViewController.h"

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	appDelegate = [UIApplication sharedApplication].delegate;
	self.title = @"Companies";
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [appDelegate.companies count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	Company *company = [appDelegate.companies objectAtIndex:indexPath.row];
	cell.text = company.name;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	Company *company = [appDelegate.companies objectAtIndex:indexPath.row];

	//	Create the view controller. Pass it the Company instance. Let it animate. 
	//	When it animates in, let the view controller handle its own loading of
	//	any subordinate data to the Company instance, such as a list of Employee names
	EmployeesViewController *employeesViewController = [[EmployeesViewController alloc] initWithCompany:company];
	[self.navigationController pushViewController:employeesViewController animated:YES];
	[employeesViewController release];
}
- (void)dealloc
{
	[appDelegate release];
    [super dealloc];
}


@end

