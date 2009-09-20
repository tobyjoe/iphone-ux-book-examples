//
//  FlipperViewController.m
//  Flipper
//
//  Created by Toby Boudreaux on 12/29/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "FlipperViewController.h"

@implementation FlipperViewController


- (void)viewDidLoad
{
	flipperView = [[FlipperView alloc] initWithFrame:CGRectMake(0.0, 0.0, 118.0, 118.0)];
	[self.view addSubview:flipperView];
	flipperView.center = CGPointMake(self.view.center.x, 79.0);
	[super viewDidLoad];
}


- (void)dealloc
{
	[flipperView release];
	[super dealloc];
}

@end
