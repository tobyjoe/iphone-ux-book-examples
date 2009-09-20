#import "DisclosureViewController.h"

@implementation DisclosureViewController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
	scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	scrollView.contentSize = CGSizeMake(320.0, 460.0);
	scrollView.scrollEnabled = NO;
	[scrollView setPagingEnabled:YES];
	self.view = scrollView;

	MainView *mainView = [[[MainView alloc] initWithFrame:CGRectMake(20.0, 0.0, 280.0, 420.0)] autorelease];
	mainView.controller = self;
	[scrollView addSubview:mainView];

	SecretView *secretView = [[[SecretView alloc] initWithFrame:CGRectMake(320.0, 0.0, 280.0, 420.0)] autorelease];
	[scrollView addSubview:secretView];
	scrollView.contentSize = CGSizeMake(640.0, 460.0);
	
	[super viewDidLoad];
}

- (void)disclose:(id)sender
{
	NSLog(@"Controller disclosing.");
	[scrollView scrollRectToVisible:CGRectMake(320.0, 0.0, 320.0, 460.0) animated:YES];	
}


- (void)dealloc
{
	[scrollView release];
    [super dealloc];
}

@end
