#import "ButtonsViewController.h"
#import "PrettyButton.h"

@implementation ButtonsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self createStandardButton];
	[self createPrettyButton];
}

#pragma mark Standard button and click handler
- (void)createStandardButton
{
	// Create a button with a rounded-rectangle style
	UIButton *standardButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	float x = 30.0;
	float y = 30.0;
	float width = 120.0;
	float height = 40.0;
	// Create the frame that determines the size of the button
	CGRect frame = CGRectMake(x, y, width, height);
	standardButton.frame = frame;
	// Set the title of the button for the normal state
	[standardButton setTitle:@"Standard" forState:UIControlStateNormal];
	// Add self as a target
	[standardButton addTarget:self action:@selector(standardButtonPressed:)
			 forControlEvents:UIControlEventTouchUpInside];
	// Set the button as a subview of my view
	[self.view addSubview:standardButton];
}

- (void)standardButtonPressed:(id)sender
{
	NSLog(@"Standard button pressed.");
}

#pragma mark Pretty button and click handler
- (void)createPrettyButton
{
	// Create an instance of a custom button subclass
	PrettyButton *prettyButton = [[PrettyButton alloc] init];
	float x = 170.0;
	float y = 30.0;
	float width = 120.0;
	float height = 40.0;
	// Create the frame that determines the size of the button
	CGRect frame = CGRectMake(x, y, width, height);
	prettyButton.frame = frame;
	// Set the title of the button for the normal state
	[prettyButton setTitle:@"Custom" forState:UIControlStateNormal];
	// Add self as a target
	[prettyButton addTarget:self action:@selector(prettyButtonPressed:)
		   forControlEvents:UIControlEventTouchUpInside];
	// Set the button as a subview of my view
	[self.view addSubview:prettyButton];
	[prettyButton release];
}

- (void)prettyButtonPressed:(id)sender
{
	NSLog(@"Pretty button pressed.");
}

@end
