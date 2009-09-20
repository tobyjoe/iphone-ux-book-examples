#import "NumberLabel.h"

@implementation NumberLabel

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
		self.font = [UIFont fontWithName:@"Helvetica-Bold" size:128.0];
		self.backgroundColor = [UIColor clearColor];
		self.textAlignment = UITextAlignmentCenter;
    }
    return self;
}


- (void)dealloc
{
    [super dealloc];
}

@end
