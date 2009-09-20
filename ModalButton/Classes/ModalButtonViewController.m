//
//  ModalButtonViewController.m
//  ModalButton
//
//  Created by Toby Boudreaux on 12/21/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "ModalButtonViewController.h"

@implementation ModalButtonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	button = [[ModalButton alloc] init];
	[button addTarget:self action:@selector(performModalActionForButton:) forControlEvents:UIControlEventTouchUpInside];
	[button retain];
	[self.view addSubview:button];
	button.center = CGPointMake(160.0, 210.0);
}

- (void)performModalActionForButton:(id)sender
{
	ModalButton *btn = (ModalButton *)sender;
	ModalButtonMode mode = btn.mode;
	NSLog(@"The button mode is: %d", mode);
}

- (void)dealloc
{
	[button release];
    [super dealloc];
}

@end
