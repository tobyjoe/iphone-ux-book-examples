//
//  SliderViewController.m
//  Slider
//
//  Created by Toby Boudreaux on 12/27/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import "SliderViewController.h"

@implementation SliderViewController

- (void)viewDidLoad
{
	standardSlider = [[UISlider alloc] initWithFrame:CGRectMake(60,20,200,40)];
	[self.view addSubview:standardSlider];

	customSlider = [[UISlider alloc] initWithFrame:CGRectMake(60,60,200,40)];
	customSlider.backgroundColor = [UIColor clearColor];

	[customSlider setThumbImage:[UIImage imageNamed:@"thumbOff.png"] forState:UIControlStateNormal];
	[customSlider setThumbImage:[UIImage imageNamed:@"thumbOn.png"] forState:UIControlStateHighlighted];

	UIImage *leftTrack = [[UIImage imageNamed:@"leftTrack.png"] stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
	UIImage *rightTrack = [[UIImage imageNamed:@"rightTrack.png"] stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
	
	[customSlider setMinimumTrackImage:leftTrack forState:UIControlStateNormal];
	[customSlider setMaximumTrackImage:rightTrack forState:UIControlStateNormal];

	[self.view addSubview:customSlider];

	[super viewDidLoad];
}

- (void)dealloc
{
	[standardSlider release];
	[customSlider release];
	[super dealloc];
}

@end
