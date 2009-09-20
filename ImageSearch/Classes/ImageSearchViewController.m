
#import "ImageSearchViewController.h"

static NSString * const kSearchURLString = 
@"http://www.google.com/m/search?q=%@&site=images";
#define CONTENT_WIDTH 320.0
#define CONTENT_HEIGHT 434.0
#define SEARCH_BAR_HEIGHT 44.0
#define CONTENT_Y 46.0

@implementation ImageSearchViewController

@synthesize searchTermFromURL;

#pragma mark UIView loading methods
- (void)loadView
{
	//	Create our main view.
	UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];

	//	Set the autoresizing mask bits to allow flexible resizing if needed.
	view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;

	//	Create the search bar.
	CGRect searchBarFrame = CGRectMake(0.0, 0.0, CONTENT_WIDTH, SEARCH_BAR_HEIGHT);
	UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:searchBarFrame];
	searchBar.delegate = self;
	[view addSubview:searchBar];

	//	Assign the UIView to our view property.
	self.view = view;
	[view release];
}

- (void)viewDidLoad
{
	//	Let the call stack close so the Default.png file will disappear.
	[super viewDidLoad];

	//	Shift the time-intensive load off to a new call stack.
	//	You can also extend this to spin off a new thread, which would
	//	allow users to interact with any already present UI.
	if(searchTermFromURL == nil){
		[self performSelector:@selector(loadLastKnownSearch) withObject:nil afterDelay:0.01];
	}else{
		[self performSelector:@selector(performSearchWithTerm:) withObject:searchTermFromURL afterDelay:0.01];
	}
}

- (void) buildWebView
{
	CGRect frame = self.view.frame;
	frame.origin.y = CONTENT_Y;
	frame.size.height = CONTENT_HEIGHT;
	webView = [[UIWebView alloc] initWithFrame:frame];
	webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	webView.delegate = self;
}


#pragma mark Search methods
- (void) loadLastKnownSearch
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	lastKnownSearch = (NSMutableDictionary *)[defaults dictionaryForKey:@"lastKnownSearch"];

	if(lastKnownSearch == nil){
		lastKnownSearch = [[NSMutableDictionary alloc] init];
		return;
	}
	
	[self reloadLastKnownSearch];
	
	[self loadLastKnownSearchImageFromCache];
}

- (void) loadLastKnownSearchImageFromCache
{
	NSString *lastKnownViewPath =
		[NSString stringWithFormat:@"%@/../Documents/lastKnownView.png",
		 [[NSBundle mainBundle] bundlePath]];
	NSFileManager *manager = [NSFileManager defaultManager];
	if([manager fileExistsAtPath:lastKnownViewPath]){
		UIImage *lastKnownViewImage = [UIImage
									   imageWithContentsOfFile:lastKnownViewPath];
		lastKnownView = [[UIImageView alloc] initWithImage:lastKnownViewImage];
		CGRect frame = lastKnownView.frame;
		frame.origin.y = CONTENT_Y;
		frame.size.height = CONTENT_HEIGHT;
		lastKnownView.frame = frame;
		NSLog(@"adding subview: lastknownview");
		[self.view addSubview:lastKnownView];
	}	
}

- (void) performSearchWithTerm:(NSString *)searchTerm
{
	NSString *theURLString = [NSString stringWithFormat:kSearchURLString,
							  searchTerm];
	
	NSURL *theURL = [NSURL URLWithString:theURLString];
	NSURLRequest *theRequest = [NSURLRequest requestWithURL:theURL];

	if(webView == nil){
		[self buildWebView];
	}

	[webView loadRequest:theRequest];
	[lastKnownSearch setValue:searchTerm forKey:@"searchTerm"];
	[self setLatestURLString:theURLString];
	lastKnownSearchIsDirty = YES;
}


#pragma mark Rehydrating the last known search
- (void) reloadLastKnownSearch
{
	NSURL *theURL = [NSURL URLWithString:[self latestURLString]];
	NSURLRequest *theRequest = [NSURLRequest requestWithURL:theURL];

	if(webView == nil){
		[self buildWebView];
	}
	
	[webView loadRequest:theRequest];
	lastKnownSearchIsDirty = YES;
}


#pragma mark Managing the "history"
- (void) setLatestSearchTerm:(NSString *)theTerm
{
	[lastKnownSearch setValue:theTerm forKey:@"searchTerm"];
}

- (NSString *) latestSearchTerm
{
	return [lastKnownSearch valueForKey:@"searchTerm"];
}

- (void) setLatestURLString:(NSString *)theURLString
{
	[lastKnownSearch setValue:theURLString forKey:@"theURLString"];
}

- (NSString *) latestURLString
{
	return [lastKnownSearch valueForKey:@"theURLString"];
}

- (void) clearCachedSearch
{
	NSLog(@"clearCachedSearch finds subviews: %@", self.view.subviews);
	[lastKnownView removeFromSuperview];
	[self.view setNeedsDisplay];
}

#pragma mark UISearchBarDelegate methods
- (void) searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
	[self clearCachedSearch];
}

- (void) searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
	[self performSearchForSearchBar:searchBar];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	[self performSearchForSearchBar:searchBar];
}

- (void) performSearchForSearchBar:(UISearchBar *)theSearchBar
{
	NSString *newSearchTerm = [theSearchBar text];
	if(newSearchTerm == nil){
		return;
	}
	[self performSearchWithTerm:newSearchTerm];
}


#pragma mark UIWebViewDelegate methods
- (void)webViewDidFinishLoad:(UIWebView *)theWebView
{
	NSString *loc = [[webView.request URL] absoluteString];
	[self setLatestURLString:loc];
	[self.view addSubview:webView];
	[lastKnownView removeFromSuperview];
}


#pragma mark Termination methods
- (void) prepareForTermination
{
	if(lastKnownSearchIsDirty){
		[self createLastKnownSearchSnapshot];
	}
}

- (void) createLastKnownSearchSnapshot
{
	CGRect rect = webView.frame;
	
	//	Scroll to the top for the screencap.
	[webView stringByEvaluatingJavaScriptFromString:@"window.scrollTo(0, 0);"];

	UIGraphicsBeginImageContext(rect.size);
	CGContextRef currentContext = UIGraphicsGetCurrentContext();
	CALayer *contentsLayer = webView.layer;
	[contentsLayer renderInContext:currentContext];

	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	
	//	Close this transaction
	UIGraphicsEndImageContext();
	NSString *path =
		[NSString stringWithFormat:@"%@/../Documents/lastKnownView.png",
		 [[NSBundle mainBundle] bundlePath]];
	NSData *d = UIImagePNGRepresentation(image);
	[d writeToFile:path atomically:NO];

	//	Save the strings for the search.
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:lastKnownSearch forKey:@"lastKnownSearch"];
	lastKnownSearchIsDirty = NO;
}

- (void)dealloc
{
	[searchTermFromURL release];
	[webView release];
	[lastKnownView release];
	[lastKnownSearch release];
	[super dealloc];
}

@end
