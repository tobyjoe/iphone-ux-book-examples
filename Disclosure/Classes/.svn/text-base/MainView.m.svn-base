#import "MainView.h"


@implementation MainView

@synthesize controller;

- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		self.backgroundColor = [UIColor clearColor];

		disclosure = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
		[self addSubview:disclosure];
		disclosure.center = CGPointMake(270.0, 20.0);

		label = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 10.0, 240.0, 20.0)];
		label.text = @"Teaser copy here.";
		[self addSubview:label];
	}
	return self;
}

- (void)setController:(UIViewController *)theController
{
	[theController retain];
	[controller release];
	controller = theController;
	[disclosure addTarget:controller action:@selector(disclose:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)dealloc
{
	[label release];
	[disclosure release];
    [super dealloc];
}


@end
