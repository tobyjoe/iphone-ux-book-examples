#import "RootViewController.h"
#import "SegmentedPaginatorAppDelegate.h"
#import "NumberLabel.h"

@implementation RootViewController

- (void)viewDidLoad
{
	UISegmentedControl *segmentedControl = [[[UISegmentedControl alloc]
											 initWithItems:
											 [NSArray arrayWithObjects:
											  @"1",
											  @"2",
											  @"3",
											  @"4",
											  @"5",
											  nil]] autorelease];
	[segmentedControl addTarget:self action:@selector(segmentChosen:)
			   forControlEvents:UIControlEventValueChanged];
	segmentedControl.frame = CGRectMake(0, 0, 200, 30.0);
	segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
	segmentedControl.momentary = NO;

	self.navigationItem.titleView = segmentedControl;
	
	UIScrollView *scrollView = [[UIScrollView alloc]
								initWithFrame:self.view.frame];
	scrollView.contentSize = CGSizeMake(320.0, 422.0);
	scrollView.scrollEnabled = NO;
	[scrollView setPagingEnabled:YES];

	UIView *viewOne = [[UIView alloc]
					   initWithFrame:CGRectMake(0.0, 0.0, 320.0, 422.0)];
	viewOne.backgroundColor = [UIColor redColor];
	NumberLabel *labelOne = [[NumberLabel alloc] initWithFrame:viewOne.frame];
	labelOne.text = @"1";

	[viewOne addSubview:labelOne];
	[labelOne release];
	
	UIView *viewTwo = [[UIView alloc]
					   initWithFrame:CGRectMake(320.0, 0.0, 320.0, 422.0)];
	viewTwo.backgroundColor = [UIColor blueColor];
	UIView *viewThree = [[UIView alloc]
						 initWithFrame:CGRectMake(640.0, 0.0, 320.0, 422.0)];
	viewThree.backgroundColor = [UIColor greenColor];
	UIView *viewFour = [[UIView alloc]
						initWithFrame:CGRectMake(960.0, 0.0, 320.0, 422.0)];
	viewFour.backgroundColor = [UIColor orangeColor];
	UIView *viewFive = [[UIView alloc]
						initWithFrame:CGRectMake(1280.0, 0.0, 320.0, 422.0)];
	viewFive.backgroundColor = [UIColor yellowColor];

	[scrollView addSubview:viewOne];
	[scrollView addSubview:viewTwo];
	[scrollView addSubview:viewThree];
	[scrollView addSubview:viewFour];
	[scrollView addSubview:viewFive];
	scrollView.contentSize = CGSizeMake(1600.0, 422.0);

	[viewOne release];
	[viewTwo release];
	[viewThree release];
	[viewFour release];
	[viewFive release];

	self.view = scrollView;
}

- (void)segmentChosen:(id)sender
{
	UISegmentedControl* segmentedControl = sender;
	NSUInteger i = [segmentedControl selectedSegmentIndex];
	UIScrollView *scrollView = (UIScrollView *)self.view;
	[scrollView scrollRectToVisible:CGRectMake((320.0 * i), 0.0, 320.0, 422.0)
						   animated:YES];
}

@end

