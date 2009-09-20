//
//  RootViewController.m
//  UINavigationControllerSample
//
//  Created by Toby Boudreaux on 11/2/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import "RootViewController.h"
#import "UINavigationControllerSampleAppDelegate.h"


@implementation RootViewController
- (void) loadView
{
	NSLog(@"loadView.");
	allSetUp = NO;
	[super loadView];
}
- (void) viewWillAppear:(BOOL)animated {
	NSLog(@"viewWillAppear. all set up? %i", allSetUp);
	if(allSetUp == YES){
		return;
	}
	if(self.title == nil){
		self.title = @"Root VC";
	}
	CGRect appRect = [[UIScreen mainScreen] applicationFrame];
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5.0, 20.0, appRect.size.width-10, 20.0)];
	label.backgroundColor = [UIColor clearColor];
	label.text = @"This is a view on a navigation controller.";
	[self.view addSubview:label];
	[label release];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button setTitle:@"Next Controller" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(pushNextViewController:)
		 forControlEvents:UIControlEventTouchUpInside];
	button.frame = CGRectMake(5.0, 50.0, 200.0, 40.0);
	button.center = CGPointMake(appRect.size.width/2, 100.0);
	[self.view addSubview:button];

	if([self.navigationController.viewControllers count] > 1){
		UIButton *homeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[homeButton setTitle:@"Back to Root" forState:UIControlStateNormal];
		[homeButton addTarget:self action:@selector(backToRoot:)
		 forControlEvents:UIControlEventTouchUpInside];
		homeButton.frame = CGRectMake(5.0, 50.0, 200.0, 40.0);
		homeButton.center = CGPointMake(appRect.size.width/2, 150.0);
		[self.view addSubview:homeButton];
	}
	allSetUp = YES;
	[super viewWillAppear:animated];
}

- (IBAction) pushNextViewController:(id)sender
{
	RootViewController *secondViewController = [[RootViewController alloc] init];
	secondViewController.title = [NSString stringWithFormat:@"VC #%i", [self.navigationController.viewControllers count]];
	NSLog(@"pushNextViewController.");
	[self.navigationController pushViewController:secondViewController animated:YES];
	[secondViewController release];
}

- (IBAction) backToRoot:(id)sender
{
	[self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)dealloc {
	[super dealloc];
}


@end

