#import "Employee.h"

@implementation Employee

@synthesize identifier, company, name, title;

- (id) initWithName:(NSString *)theName title:(NSString *)theTitle identifier:(NSUInteger)theIdentifier company:(Company *)theCompany
{
	self = [super init];
	if (self != nil) {
		self.name = theName;
		self.title = theTitle;
		self.identifier = theIdentifier;
		self.company = theCompany;
	}
	return self;	
}

@end
