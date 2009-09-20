//
//  RotatorViewController.m
//  Rotator
//
//  Created by Toby Boudreaux on 2/3/09.
//  Copyright CTO, The Barbarian Group 2009. All rights reserved.
//

#import "RotatorViewController.h"

@implementation RotatorViewController

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)viewDidLoad
{
	UIImage *blurImage = [UIImage imageNamed:@"blur.png"];
	blurView = [[UIImageView alloc] initWithImage:blurImage];
	blurView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	//	Block UI events from passing "through" this view
	blurView.userInteractionEnabled = YES;
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	NSLog(@"should i rotate?");
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	NSLog(@"will rotate.");
    // Stop any animations, hot UI objects, or redraw operations
    // Prepare for rotation
	[self.view addSubview:blurView];
	[self.view bringSubviewToFront:blurView];
	
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	NSLog(@"did rotate.");
    // Restart any animations, hot UI objects, or redraw operations
	[blurView removeFromSuperview];
}

- (void)dealloc
{
	[portraitImage release];
	[landscapeImage release];
	[blurView release];
    [super dealloc];
}

@end
