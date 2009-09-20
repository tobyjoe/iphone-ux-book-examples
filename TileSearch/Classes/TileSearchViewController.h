#import <UIKit/UIKit.h>
@class Board;

@interface TileSearchViewController : UIViewController <UISearchBarDelegate> {
	Board *board;
	UISearchBar *searchBar;
	NSString *lastSearch;
}

@end

