#import <Foundation/Foundation.h>
@class Chore;

@interface ChoreListDataSource : NSObject <UITableViewDataSource> {
	NSMutableArray *chores;
}

@property (nonatomic, retain) NSMutableArray *chores;

- (void)addChore:(NSString *)description;
- (void)toggleCompletedForChoreAtIndex:(NSUInteger)index;
- (Chore *)choreAtIndex:(NSUInteger)index;
- (NSUInteger)choreCount;
- (NSUInteger)completedChoreCount;


@end
