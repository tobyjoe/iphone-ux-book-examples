//
//  TilesViewController.m
//  Tiles
//
//  Created by Toby Boudreaux on 12/4/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import "TilesViewController.h"

@implementation TilesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	board = [[Board alloc] initWithFrame:CGRectMake(0.0, 44.0, 320.0, 356.0)];
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

	UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 44.0)];
	searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
	searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
	searchBar.showsCancelButton = NO;
	[self.view addSubview:searchBar];
	
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

#pragma mark UISearchBarDelegate methods
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
	// We are in edit mode, so present the cancel button.
	searchBar.showsCancelButton = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
	// We are no longer in edit mode, so hide the cancel button.
	searchBar.showsCancelButton = NO;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
	[board createSelectionSnapshot];
	[board 
	
	NSString *cellTitle;
	for (cellTitle in listContent)
	{
		NSComparisonResult result = [cellTitle compare:searchText options:NSCaseInsensitiveSearch
												 range:NSMakeRange(0, [searchText length])];
		if (result == NSOrderedSame)
		{
			[filteredListContent addObject:cellTitle];
		}
	}
	
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	// If there was a prior search term, revert to it on cancellation
	if (searchBar.text.length > 0)
	{
		[filteredListContent removeAllObjects];
		[filteredListContent addObjectsFromArray: savedContent];
	}
	
	// Hide the keyboard by resigning firstResponder status
	[searchBar resignFirstResponder];
	
	// Reset the search text to an empty string
	searchBar.text = @"";
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	// Hide the keyboard by resigning firstResponder status
	[searchBar resignFirstResponder];
}


- (void)dealloc {
	[button release];
	[board release];
    [super dealloc];
}

@end
