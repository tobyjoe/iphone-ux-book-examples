#import "RootViewController.h"
#import "ChoreListDataSource.h"
#import "Chore.h"

@implementation RootViewController

@synthesize choreListDataSource;

- (void)dealloc
{
	[choreListDataSource release];
	[super dealloc];
}
-(void)fuck:(id)sender
{
	NSLog(@"fuck.");
}
- (void)showNewChoreScreen:(id)sender
{
	UIViewController *choreAdditionController = [[UIViewController
														 alloc]
												 initWithNibName:@"ChoreEditor"
												 bundle:nil];

	choreAdditionController.navigationItem.leftBarButtonItem.target = self;
	choreAdditionController.navigationItem.leftBarButtonItem.action =
	@selector(fuck:);

	[self.navigationController
	 presentModalViewController:choreAdditionController
	 animated:YES];
}


- (void)updateTitle
{
	NSUInteger choreCount = [self.choreListDataSource choreCount];
	NSUInteger completedChoreCount = [self.choreListDataSource
									  completedChoreCount];
	self.title = [NSString stringWithFormat:@"Finished %u of %u",
				  completedChoreCount,
				  choreCount];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]
						  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
						  target:self
						  action:@selector(showNewChoreScreen:)]
						 autorelease];

	if(self.choreListDataSource == nil){
		self.choreListDataSource = [[[ChoreListDataSource alloc] init] autorelease];
		[self.choreListDataSource addChore:@"Scoop Litterbox"];
		[self.choreListDataSource addChore:@"Scrub Toilet"];
		[self.choreListDataSource addChore:@"Mow Lawn"];
		[self.choreListDataSource addChore:@"Sharpen Knives"];
	}
	self.tableView.dataSource = self.choreListDataSource;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Mark the item as completed or not. Toggle.
	[self.choreListDataSource toggleCompletedForChoreAtIndex:indexPath.row];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];

	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

	Chore *chore = [self.choreListDataSource choreAtIndex:indexPath.row];
	if(chore.isCompleted){
		cell.accessoryType = UITableViewCellAccessoryCheckmark;	
		cell.textLabel.textColor = [UIColor lightGrayColor];
	}else{
		cell.accessoryType = UITableViewCellAccessoryNone;
		cell.textLabel.textColor = [UIColor blackColor];
	}
	
	[self updateTitle];
}

@end

