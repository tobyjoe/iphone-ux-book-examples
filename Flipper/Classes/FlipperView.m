#import "FlipperView.h"
#import "FrontView.h"
#import "BackView.h"

@implementation FlipperView

@synthesize isFlipped;

- (id)initWithFrame:(CGRect)frame
{
	if(self = [super initWithFrame:frame]){
		frontView = [[FrontView alloc] initWithFrame:self.frame];
		backView = [[BackView alloc] initWithFrame:self.frame];

		//	Add the front view as the main content to start off.
		[self addSubview:frontView];

		//	Insert the back view under the front view, hidden.
		[self insertSubview:backView belowSubview:frontView];
		
		self.backgroundColor = [UIColor clearColor];
		self.clipsToBounds = YES;
	}
	return self;
}

- (void)toggle
{
	[UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];

	UIViewAnimationTransition direction;

	if(isFlipped){
		direction = UIViewAnimationTransitionFlipFromLeft;
		isFlipped = NO;
	}else{
		direction = UIViewAnimationTransitionFlipFromRight;
		isFlipped = YES;
	}

	//	Mid-animation, swap the views.
	[self exchangeSubviewAtIndex:0 withSubviewAtIndex:1];

    [UIView setAnimationTransition:direction forView:self cache:YES];
	[UIView commitAnimations];
}

- (void)dealloc
{
	[frontView release];
	[backView release];
	[super dealloc];
}


@end
