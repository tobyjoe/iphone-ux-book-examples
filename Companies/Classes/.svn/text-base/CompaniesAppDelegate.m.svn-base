#import "CompaniesAppDelegate.h"
#import "RootViewController.h"
#import "Company.h"
#import "Employee.h"

@implementation CompaniesAppDelegate

@synthesize window;
@synthesize navigationController;
@synthesize companies;

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
	Employee *e1 = [[Employee alloc] initWithName:@"Keith Butters" title:@"Partner, ECD" identifier:1337 company:nil];
	
	Company *c1 = [[Company alloc] initWithName:@"The Barbarian Group" abbreviation:@"B" identifier:1001];
	[c1 addEmployee:e1];
	[e1 release];

	Company *c2 = [[Company alloc] initWithName:@"Myrtleman Industries" abbreviation:@"M" identifier:1002];
	Company *c3 = [[Company alloc] initWithName:@"Sterling Cooper" abbreviation:@"S" identifier:1003];
	
	companies = [[NSArray arrayWithObjects:c1, c2, c3, nil] retain];

	[c1 release];
	[c2 release];
	[c3 release];

	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application
{
	// Save data if appropriate
}


- (void)dealloc
{
	[companies release];
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
