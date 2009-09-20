#import "PickerDelegate.h"

@implementation PickerDelegate

- (id) init
{
	self = [super init];
	if (self != nil) {
		content = [NSArray arrayWithObjects:@"Chicken", @"Turkey", @"Seitan", @"Broccoli", nil];
		[content retain];
	}
	return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [content count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [content objectAtIndex:row];
}

- (void)dealloc
{
	[content release];
    [super dealloc];
}


@end
