#import "ChoreListDataSource.h"
#import "Chore.h";

@implementation ChoreListDataSource

@synthesize chores;

- (void) dealloc
{
	[chores release];
	[super dealloc];
}

- (NSUInteger)choreCount
{
	return [chores count];
}

- (NSUInteger)completedChoreCount
{
	NSUInteger c = 0;
	for(Chore *chore in self.chores){
		if(chore.isCompleted) c++;
	}
	return c;
}

- (id) init
{
	self = [super init];
	if (self != nil) {
		if(self.chores == nil){
			self.chores = [NSMutableArray arrayWithCapacity:1];
		}
		
	}
	return self;
}

- (void)addChore:(NSString *)description
{
	Chore *chore = [[[Chore alloc] init] autorelease];
	chore.completed = NO;
	chore.description = description;
	[self.chores addObject:chore];
}

- (void)removeChoreAtIndex:(NSUInteger)index
{
	[self.chores removeObjectAtIndex:index];
}

- (Chore *)choreAtIndex:(NSUInteger)index
{
	return [self.chores objectAtIndex:index];
}

- (void)toggleCompletedForChoreAtIndex:(NSUInteger)index
{
	Chore *chore =
	(Chore *)[self.chores objectAtIndex:index];
	NSAssert(chore != nil, @"Chore not found.");
	chore.completed = !chore.isCompleted;
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [chores count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView
							 dequeueReusableCellWithIdentifier:CellIdentifier];
	if(cell == nil){
		NSLog(@"cell was nil.");
		cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewStylePlain
				 reuseIdentifier:CellIdentifier]
				autorelease];
    }

	Chore *chore =
	(Chore *)[chores objectAtIndex:indexPath.row];
	cell.textLabel.text = chore.description;

	 UIImage *image = [UIImage imageNamed:@"b1.png"];
	 UIImageView *imageView = [[[UIImageView alloc] initWithFrame:CGRectZero] autorelease];
	 imageView.image = image;
	[imageView sizeToFit];
	 cell.accessoryView = imageView;
	 //[self.accessoryView sizeToFit];
	 //[self.contentView sizeToFit];
	
	
	return cell;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(editingStyle == UITableViewCellEditingStyleDelete){
		[self removeChoreAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
						 withRowAnimation:YES];
	}else if(editingStyle == UITableViewCellEditingStyleInsert){
		
	}
}

- (BOOL)tableView:(UITableView *)tableView
canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}

- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
	  toIndexPath:(NSIndexPath *)toIndexPath
{
	[self.chores exchangeObjectAtIndex:fromIndexPath.row
	 withObjectAtIndex:toIndexPath.row];
}


- (BOOL)tableView:(UITableView *)tableView
canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
	return YES;
}



@end
