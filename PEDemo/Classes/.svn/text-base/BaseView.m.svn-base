#import "BaseView.h"

@interface BaseView (PrivateMethods)

- (void)showToolbar;
- (void)hideToolbar;

@end


@implementation BaseView

@synthesize toolbar;

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)setToolbar:(UIToolbar *)theToolbar
{
	[self willChangeValueForKey:@"toolbar"];
	[theToolbar retain];
	[toolbar release];
	toolbar = theToolbar;
	[self didChangeValueForKey:@"toolbar"];
	[self addSubview:toolbar];
	[self bringSubviewToFront:toolbar];
}


- (void)flip
{
	[UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
	
	UIViewAnimationTransition direction;
	
	if(isFlipped){
		direction = UIViewAnimationTransitionFlipFromLeft;
		isFlipped = NO;
		[self showToolbar];
	}else{
		direction = UIViewAnimationTransitionFlipFromRight;
		isFlipped = YES;
		[self hideToolbar];
	}

	
	[self exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
	
    [UIView setAnimationTransition:direction forView:self cache:YES];
	[UIView commitAnimations];	
	
}

- (void)showToolbar
{
	toolbar.hidden = NO;
}

- (void)hideToolbar
{
	toolbar.hidden = YES;
}

- (void)dealloc
{
    [super dealloc];
}


@end
