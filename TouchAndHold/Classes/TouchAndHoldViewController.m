//
//  TouchAndHoldViewController.m
//  TouchAndHold
//
//  Created by Toby Boudreaux on 12/3/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "TouchAndHoldViewController.h"

@implementation TouchAndHoldViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	expander = [[Expander alloc] initWithFrame:CGRectZero];
	expander.center = self.view.center;
	[self.view addSubview:expander];
}

- (void)dealloc {
	[expander release];
    [super dealloc];
}

@end
