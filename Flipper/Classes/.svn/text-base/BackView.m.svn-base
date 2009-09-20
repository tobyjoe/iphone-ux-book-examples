#import "BackView.h"
#import "FlipperView.h"

@implementation BackView

- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		exitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[exitButton setTitle:@"X" forState:UIControlStateNormal];
		exitButton.frame = CGRectMake(0.0, 0.0, 20.0, 20.0);
		exitButton.center = self.center;
		[exitButton addTarget:self action:@selector(exit:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:exitButton];
		self.backgroundColor = [UIColor clearColor];
		self.image = [UIImage imageNamed:@"back.png"];
		self.userInteractionEnabled = YES;
	}
	return self;
}

- (void)exit:(id)sender
{
	[(FlipperView *)self.superview toggle];
}

- (void)dealloc
{
	[super dealloc];
}


@end
