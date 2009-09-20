#import "PrettyButton.h"

@implementation PrettyButton

- (id)init
{
	if(self = [super init]){
		if(!standardImg){
			UIImage *image = [UIImage imageNamed:@"standard.png"];
			standardImg = [image stretchableImageWithLeftCapWidth:12
													 topCapHeight:12];
		}
		
		if(!hoverImg){
			UIImage *image = [UIImage imageNamed:@"hover.png"];
			hoverImg = [image stretchableImageWithLeftCapWidth:12
												  topCapHeight:12];
		}
		
		[self setBackgroundImage:standardImg forState:UIControlStateNormal];
		[self setBackgroundImage:hoverImg forState:UIControlStateHighlighted];
		[self setTitleColor:[UIColor colorWithRed:.208
											green:.318
											 blue:.525
											alpha:1.0]
				   forState:UIControlStateNormal];
		[self setTitleColor:[UIColor whiteColor]
				   forState:UIControlStateHighlighted];
		self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold"
											   size:15.0];
		self.titleLabel.textAlignment = UITextAlignmentCenter;
	}
	return self;
}
@end
