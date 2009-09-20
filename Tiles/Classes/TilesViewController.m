//
//  TilesViewController.m
//  Tiles
//
//  Created by Toby Boudreaux on 12/4/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import "TilesViewController.h"

@implementation TilesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	board = [[Board alloc] initWithFrame:CGRectMake(0.0,0.0,320.0,400.0)];
	[board addObserver:self forKeyPath:@"hasTiles" options:NSKeyValueObservingOptionNew context:nil];
	[self.view addSubview:board];
	self.view.backgroundColor = [UIColor whiteColor];
	button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button setTitle:@"Remove" forState:UIControlStateNormal];
	[button setTitle:@"Poop" forState:UIControlStateDisabled];
	[self.view addSubview:button];
	button.frame = CGRectMake(10.0, 405.0, 300.0, 40.0);
	button.backgroundColor = [UIColor whiteColor];
	[button addTarget:board action:@selector(removeSelectedTiles) forControlEvents:UIControlEventTouchDown];
	[self.view bringSubviewToFront:button];
	
}

- (void)observeValueForKeyPath:(NSString *)keyPath
					  ofObject:(id)object
						change:(NSDictionary *)change
					   context:(void *)context
{
	if([keyPath isEqual:@"hasTiles"]) {
		BOOL enabled = [[change objectForKey:NSKeyValueChangeNewKey] boolValue];
		button.enabled = enabled;
	}
}


- (void)dealloc {
	[button release];
	[board release];
    [super dealloc];
}

@end
