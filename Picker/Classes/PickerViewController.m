//
//  PickerViewController.m
//  Picker
//
//  Created by Toby Boudreaux on 12/24/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import "PickerViewController.h"

@implementation PickerViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
	pickerDelegate = [[PickerDelegate alloc] init];
	picker = [[LabeledPickerView alloc] init];
	picker.delegate = pickerDelegate;
	picker.showsSelectionIndicator = YES;	// note this is default to NO

	[self.view addSubview:picker];
    [super viewDidLoad];
}


- (void)dealloc
{
	[picker release];
	[pickerDelegate release];
	[super dealloc];
}

@end
