#import "TileSearchViewController.h"
#import "Board.h"

@implementation TileSearchViewController

- (void)viewDidLoad
{
	searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 44.0)];
	searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
	searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
	searchBar.showsCancelButton = NO;

	//	Set myself as the delegate of the search bar.
	searchBar.delegate = self;
	
	[self.view addSubview:searchBar];
	if(board == nil) board = [[Board alloc] initWithFrame:CGRectMake(0.0, 45.0, 320.0, 415.0)];
	[self.view addSubview:board];
}


#pragma mark UISearchBarDelegate methods
- (void)searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar
{
	//	Show cancel button while editing
	searchBar.showsCancelButton = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)theSearchBar
{
	//	Hide cancel button when editing ends
	searchBar.showsCancelButton = NO;
}

- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText
{
	[board filterForColorName:searchText];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)theSearchBar
{
	//	Repopulate the last color unless the user cleared the search
	if (theSearchBar.text.length > 0){
		searchBar.text = lastSearch;
	}else{
		searchBar.text = @"";
	}
	
	[searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)theSearchBar
{
	[lastSearch release];
	lastSearch = [theSearchBar.text copy];
	[searchBar resignFirstResponder];
}


- (void)dealloc
{
	[searchBar release];
	[board release];
	[lastSearch release];
	[super dealloc];
}

@end
