#import "FrontView.h"
#import "FlipperView.h"

@implementation FrontView

#define PADDING 10.0

- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		infoButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
		[infoButton addTarget:self action:@selector(showInfo:) forControlEvents:UIControlEventTouchUpInside];
		infoButton.center = CGPointMake(self.frame.size.width - infoButton.frame.size.width/2 - PADDING, self.frame.size.height - infoButton.frame.size.height/2 - PADDING);
		[self addSubview:infoButton];
		self.backgroundColor = [UIColor clearColor];
		self.image = [UIImage imageNamed:@"front.png"];
		self.userInteractionEnabled = YES;
	}
	return self;
}

- (void)showInfo:(id)sender
{
	[(FlipperView *)self.superview toggle];
}

@end
