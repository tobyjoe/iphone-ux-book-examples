#import <Foundation/Foundation.h>

@interface Chore : NSObject {
	BOOL completed;
	NSString *description;
}

@property (nonatomic, assign, getter=isCompleted) BOOL completed;
@property (nonatomic, retain) NSString *description;

@end
