#import "ImageSearchAppDelegate.h"
#import "ImageSearchViewController.h"

@implementation ImageSearchAppDelegate

@synthesize window;
@synthesize viewController;


- (void) applicationDidFinishLaunching:(UIApplication *)application
{
	NSLog(@"applicationDidFinishLaunching.");
	isForegroundApplication = YES;
	// Override point for customization after app launch
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}

- (void) applicationWillTerminate:(UIApplication *)application
{
	NSLog(@"Ok, beginning termination.");
	if(isForegroundApplication){
		NSLog(@"Home button pressed or memory warning. Save state and bail.");
	}else{
		NSLog(@"Moved to the background at some point. Save state and bail.");
	}
	[viewController prepareForTermination];
	NSLog(@"Ok, terminating. Bye bye.");
}

- (void) applicationWillResignActive:(UIApplication *)application
{
	NSLog(@"Moving to the background");
	isForegroundApplication = NO;
}

- (void) applicationDidBecomeActive:(UIApplication *)application
{
	NSLog(@"Moving from background to foreground.");
	isForegroundApplication = YES;
}


#pragma mark Custom URL handler methods
/*
 The URI structure is:
 imagesearch:///search?query=my%20term%20here
*/
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
	BOOL success = NO;
	if(!url){
		return NO;
	}
	if ([@"/search" isEqualToString:[url path]]){
		NSArray *queryComponents = [[url query] componentsSeparatedByString:@"&"];
		NSString *queryComponent;
		for(queryComponent in queryComponents){
			NSArray	*query = [queryComponent componentsSeparatedByString:@"="];
			if([query count] == 2){
				NSString *key = [query objectAtIndex:0];
				NSString *value = [query objectAtIndex:1];

				if ([@"query" isEqualToString:key]){
					NSString *searchTerm =
						(NSString *)CFURLCreateStringByReplacingPercentEscapes(
							kCFAllocatorDefault,
							(CFStringRef)value, CFSTR("")
						);
					[self performSearch:searchTerm];
					[searchTerm release];
					success = YES;
				}
			}
		}
	}
	return success;
}

- (void) performSearch:(NSString *)searchTerm
{
	viewController.searchTermFromURL = searchTerm;
	[viewController performSearchWithTerm:searchTerm];
}

- (void) dealloc
{
    [viewController release];
    [window release];
    [super dealloc];
}

@end
