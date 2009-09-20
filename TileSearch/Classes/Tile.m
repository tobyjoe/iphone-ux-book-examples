#import "Tile.h"

@implementation Tile

@synthesize colorName;

- (id) initWithFrame:(CGRect)frame image:(UIImage *)img colorName:(NSString *)theColorName;
{
	self = [super initWithFrame:frame];
	if (self != nil) {
		self.image =img;
		self.colorName = theColorName;
	}
	return self;
}

- (void)dim
{
	self.alpha = 0.5;
}

- (void)highlight
{
	self.alpha = 1.0;
}

- (void)dealloc {
	[colorName release];
	[super dealloc];
}

@end
