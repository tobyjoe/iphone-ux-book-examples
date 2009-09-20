#import "Scroller.h"
#import "NumView.h"

@interface Scroller (PrivateMethods)

- (void)snapToClosestNumber;

@end

@implementation Scroller

#define WIDTH 500.0
#define NUM 10
#define NUM_WIDTH (WIDTH / NUM)
#define HALF (NUM_WIDTH / 2)
#define HEIGHT 40.0
#define INSET_WIDTH 160.0

- (void)snapToClosestNumber
{
	CGPoint coff = numbersView.contentOffset;
	float normalizedX = coff.x + INSET_WIDTH;
	double diff = fmod(normalizedX, NUM_WIDTH);
	
	// Move to the left or right, as needed
	if(diff < NUM_WIDTH){
		// If we're at the max...
		if(normalizedX == WIDTH){
			normalizedX -= NUM_WIDTH;
		}
		normalizedX -= diff;
	}else{
		normalizedX += diff;
	}
	
	float leftX = normalizedX - INSET_WIDTH + HALF;
	
	[numbersView scrollRectToVisible:CGRectMake(leftX, 0.0, 320.0, HEIGHT) animated:YES];	
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	NSLog(@"sending actions for UIControlEventApplicationReserved.");
	[self sendActionsForControlEvents:UIControlEventApplicationReserved];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
	[self snapToClosestNumber];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	[self snapToClosestNumber];
}

- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		numbersView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 66.0)];
		numbersView.delegate = self;
		numbersView.showsHorizontalScrollIndicator = NO;
		numbersView.showsVerticalScrollIndicator = NO;
		numbersView.delaysContentTouches = NO;
		numbersView.bounces = YES;

		self.backgroundColor = [UIColor clearColor];
		//	Add in a bunch of subs
		NSUInteger i = 0;
		NumView *numView;
		CGRect frame;
		for(i; i < NUM; i++){
			frame = CGRectMake((i * NUM_WIDTH), 20.0, NUM_WIDTH, HEIGHT);
			numView = [[[NumView alloc] initWithFrame:frame number:i] autorelease];
			[numbersView addSubview:numView];
			numView.frame = frame;
		}
		[self addSubview:numbersView];
		numbersView.contentSize = CGSizeMake(WIDTH, HEIGHT);
		numbersView.contentInset = UIEdgeInsetsMake(0.0, INSET_WIDTH, 0.0, INSET_WIDTH);
	}
	return self;
}

- (void)dealloc
{
	[numbersView release];
	[super dealloc];
}


@end
