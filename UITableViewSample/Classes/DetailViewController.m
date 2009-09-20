//
//  DetailViewController.m
//  UITableViewSample
//
//  Created by Toby Boudreaux on 11/1/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "DetailViewController.h"


@implementation DetailViewController

// Implement loadView to create a view hierarchy programmatically.
- (void)loadView {
	CGRect appRect = [[UIScreen mainScreen] applicationFrame];

	UIView *contentView = [[UIView alloc] initWithFrame:appRect];
	contentView.backgroundColor = [UIColor grayColor];
	
	CGRect labelRect = CGRectMake(0.0, 0.0, appRect.size.width, 40.0);
	UILabel *label = [[UILabel alloc] initWithFrame:labelRect];
	label.backgroundColor = [UIColor clearColor];
	label.font = [UIFont boldSystemFontOfSize:24];
	label.text = @"Sub-Item 3";
	label.textAlignment = UITextAlignmentCenter;
	
	[contentView addSubview:label];
	CGRect af = [[UIScreen mainScreen] applicationFrame];

	UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 50.0, appRect.size.width, 240.0)];
	imageView.image = [UIImage imageNamed:@"tobyjoe.jpg"];
	[contentView addSubview:imageView];
	
	self.view = contentView;

	[imageView release];
	[label release];
	[contentView release];
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
	[self.view release];
    [super dealloc];
}


@end
