#import "RootViewController.h"
#import "PEDemoAppDelegate.h"
#import "SecondaryViewController.h"
#import "AudioToolbox/AudioToolbox.h"

@implementation RootViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	if(items == nil){
		items = [NSArray arrayWithObjects:@"Emory", @"Michele", @"Bob", @"Diane", @"Beverly", @"Shelley", @"Noah", @"Melissa", @"Rob", @"Ryan", @"Simone", @"Shep", @"Murray", nil];
		[items retain];
	}
	self.title = @"Family";
	self.navigationItem.rightBarButtonItem = [self editButtonItem];
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	cell.text = [items objectAtIndex:indexPath.row];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
	SecondaryViewController *secondaryViewController = [[SecondaryViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
	secondaryViewController.title = [items objectAtIndex:indexPath.row];
	[self.navigationController pushViewController:secondaryViewController animated:YES];
	[secondaryViewController release];
	
	[self playSelectionSound];
}

- (void)playSelectionSound
{
	SystemSoundID soundID;
	if([(PEDemoAppDelegate *)[UIApplication sharedApplication].delegate soundsEnabled] == NO){
		NSLog(@"Sounds off...");
		return;
	}
	NSLog(@"Play selection sound.");
	NSString *path = [[NSBundle mainBundle] pathForResource:@"tick" ofType:@"caf"];
	NSLog(@"Path to sound: %@", path);
	OSStatus error = AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:path], &soundID);
	NSLog(@"ERROR: %d", error);
	AudioServicesPlaySystemSound(soundID);
}


- (void)dealloc
{
	[items release];
    [super dealloc];
}


@end

