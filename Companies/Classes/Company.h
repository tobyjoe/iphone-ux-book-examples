#import <Foundation/Foundation.h>

@class Employee;

@interface Company : NSObject {
	NSString *name;
	NSString *abbreviation;
	NSMutableArray *employees;
	NSUInteger identifier;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *abbreviation;
@property (nonatomic, retain) NSMutableArray *employees;
@property (nonatomic, assign) NSUInteger identifier;

- (id) initWithName:(NSString *)theName abbreviation:(NSString *)theAbbreviation identifier:(NSUInteger)theIdentifier;
- (void) addEmployee:(Employee *)theEmployee;

@end
