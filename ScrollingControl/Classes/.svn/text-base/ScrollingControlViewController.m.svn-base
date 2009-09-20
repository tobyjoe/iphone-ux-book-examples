#import "ScrollingControlViewController.h"
#import "Scroller.h"

@implementation ScrollingControlViewController

- (void)viewDidLoad
{
	CGRect f = CGRectMake(0.0, 0.0, 320.0, 460.0);
	UIImageView *backgroundView = [[[UIImageView alloc] initWithFrame:f] autorelease];
	backgroundView.image = [UIImage imageNamed:@"background.png"];
	[self.view addSubview:backgroundView];

	scroller = [[Scroller alloc] initWithFrame:CGRectMake(0.0, 100.0, 320.0, 60.0)];
	[scroller addTarget:self action:@selector(scrollerDidScroll:) forControlEvents:UIControlEventApplicationReserved];
	[self.view addSubview:scroller];
	[super viewDidLoad];

	f.size.height = 126.0;
	UIImageView *topView = [[[UIImageView alloc] initWithFrame:f] autorelease];
	topView.image = [UIImage imageNamed:@"top.png"];
	[self.view addSubview:topView];
	
}

- (void)scrollerDidScroll:(id)sender
{
	NSLog(@"Scroller did scroll.");
}

- (void)dealloc
{
	[scroller release];
	[super dealloc];
}

@end
