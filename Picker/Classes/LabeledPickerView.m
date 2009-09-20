#import "LabeledPickerView.h"

@interface _UIPickerViewSelectionBar : UIView
@end

@implementation LabeledPickerView

- (void)drawRect:(CGRect)rect
{
	// Draw the label if it needs to be drawn
	if(fixedLabel == nil){
		fixedLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 200.0, 40.0)];
		fixedLabel.font = [UIFont boldSystemFontOfSize:20.0];
		fixedLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
		fixedLabel.backgroundColor = [UIColor clearColor];
		fixedLabel.shadowColor = [UIColor whiteColor];
		fixedLabel.shadowOffset = CGSizeMake(0, 1);
		fixedLabel.text = @"...is tasty.";
		NSArray *svs = [self subviews];
		UIView *v;
		for(v in svs){
			if([v isKindOfClass:[_UIPickerViewSelectionBar class]]){
				CGPoint c = CGPointMake(v.center.x + 40.0, v.center.y - 86);
				fixedLabel.center = c;
				[v addSubview:fixedLabel];
				return;
			}
		}
	}
}

- (void)dealloc
{
	[fixedLabel release];
	[super dealloc];
}

@end
