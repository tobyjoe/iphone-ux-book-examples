//
//  ImageSearchViewController.h
//  ImageSearch
//
//  Created by Toby Boudreaux on 11/16/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ImageSearchViewController : UIViewController <UIWebViewDelegate, UISearchBarDelegate> {
	UIWebView *webView;
	UIImageView *lastKnownView;
	NSMutableDictionary *lastKnownSearch;
	BOOL lastKnownSearchIsDirty;
	NSString *searchTermFromURL;
}

@property (nonatomic, assign) NSString *searchTermFromURL;

- (void) loadLastKnownSearch;
- (void) performSearchWithTerm:(NSString *)searchTerm;
- (void) performSearchForSearchBar:(UISearchBar *)theSearchBar;
- (void) createLastKnownSearchSnapshot;
- (void) prepareForTermination;
- (void) setLatestURLString:(NSString *)theURLString;
- (NSString *) latestURLString;
- (void) setLatestSearchTerm:(NSString *)theTerm;
- (NSString *) latestSearchTerm;
- (void) reloadLastKnownSearch;
- (void) loadLastKnownSearchImageFromCache;

@end

