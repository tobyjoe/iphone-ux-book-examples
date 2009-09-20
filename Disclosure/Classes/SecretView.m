#import "SecretView.h"


@implementation SecretView


- (id)initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame]) {
		label = [[UILabel alloc] initWithFrame:CGRectMake(20.0, self.center.y, 280.0, 60.0)];
		label.lineBreakMode = UILineBreakModeWordWrap;
		label.numberOfLines = 0;
		label.text = @"Totally worth waiting for, eh?";
		[self addSubview:label];
	}
	return self;
}

- (void)dealloc
{
	[label release];
	[super dealloc];
}


@end
