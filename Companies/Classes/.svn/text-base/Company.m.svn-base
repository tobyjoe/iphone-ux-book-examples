#import "Company.h"

@implementation Company

@synthesize name, identifier, abbreviation, employees;

- (id)  initWithName:(NSString *)theName abbreviation:(NSString *)theAbbreviation identifier:(NSUInteger)theIdentifier
{
	self = [super init];
	if (self != nil) {
		self.name = theName;
		self.abbreviation = theAbbreviation;
		self.identifier = theIdentifier;
		self.employees = [NSMutableArray arrayWithCapacity:1];
	}
	return self;	
}

- (void) addEmployee:(Employee *)theEmployee
{
	[self.employees addObject:theEmployee];
}

@end
