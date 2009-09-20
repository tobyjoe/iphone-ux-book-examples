//
//  BarGameViewController.m
//  BarGame
//
//  Created by Toby Boudreaux on 12/2/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "BarGameViewController.h"

@implementation BarGameViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSLog(@"viewDidLoad. loading photos into the pair.");
	UIImage *theImage = [UIImage imageNamed:@"murray.png"];
	photoView = [[PhotoView alloc] initWithFrame:self.view.frame];
	photoView.image = theImage;
	[self.view addSubview:photoView];
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[photoView release];
    [super dealloc];
}

@end
