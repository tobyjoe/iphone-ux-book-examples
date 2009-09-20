#import <Foundation/Foundation.h>

@class Company;

@interface Employee : NSObject {
	NSUInteger identifier;
	Company *company;
	NSString *name;
	NSString *title;
}

@property (nonatomic, assign) NSUInteger identifier;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) Company *company;

- (id) initWithName:(NSString *)theName title:(NSString *)theTitle identifier:(NSUInteger)theIdentifier company:(Company *)theCompany;

@end
