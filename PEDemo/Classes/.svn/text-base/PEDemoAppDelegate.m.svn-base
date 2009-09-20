#import "PEDemoAppDelegate.h"
#import "RootViewController.h"
#import "SettingsViewController.h"
#import "BaseView.h"
#import "AudioToolbox/AudioToolbox.h"

NSString *kPlaySoundEffectsKey	= @"playSoundEffectsKey";
NSString *kTiltScrollKey		= @"tiltScrollKey";
NSString *kEffectsVolumeKey		= @"effectsVolumeKey";

@implementation PEDemoAppDelegate

@synthesize window;
@synthesize navigationController;

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
	
	// Prepare ambient audio
	[self prepareAmbientAudio];

	// Configure and show the window
	
	//	Create a base view to be flipped.
	//	Set the frame to be 20px smaller and bumped down from the top to account for 
	//	the status bar. We don't want 20px of empty space at the top during the flip.
	baseView = [[BaseView alloc] initWithFrame:CGRectMake(0.0, 20.0, 320.0, 460.0)];
	[baseView addSubview:[navigationController view]];
	CGRect adjustedFrame = CGRectMake(0.0, 0.0, 320.0, 416.0);
	navigationController.view.frame = adjustedFrame;

	UIToolbar *toolbar = [[[UIToolbar alloc] initWithFrame:CGRectMake(0.0, 416.0, 320.0, 44.0)] autorelease];
	UIButton *infoButton = [[UIButton buttonWithType:UIButtonTypeInfoLight] autorelease];
    [infoButton addTarget:self action:@selector(showSettings:) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *infoButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:infoButton] autorelease];
	UIBarButtonItem *flexSpace = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil] autorelease];
	[toolbar setItems:[NSArray arrayWithObjects:flexSpace, infoButtonItem, nil]];
	baseView.toolbar = toolbar;

	[window addSubview:baseView];
	[window makeKeyAndVisible];
}

- (void)prepareAmbientAudio
{
	OSStatus result = AudioSessionInitialize(NULL, NULL, NULL, self);
	if(result){
		NSLog(@"Ambient audio could not be prepared. Consider this suspicious.");
	}else {
		UInt32 category = kAudioSessionCategory_AmbientSound;
		result = AudioSessionSetProperty(kAudioSessionProperty_AudioCategory, sizeof(category), &category);
		if(result){
			NSLog(@"Could not set audio session category. This is no good. Fix it!");
		}else {
			result = AudioSessionSetActive(true);
			if(result){
				NSLog(@"Could not set audio session to active status. This is no good. Fix it!");
			}
		}
	}
}

- (BOOL)soundsEnabled
{
	return YES;
}

- (void)buildSettingsView
{
	settingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
	settingsViewController.delegate = self;
	[baseView insertSubview:settingsViewController.view atIndex:0];
}

- (void)showSettings:(id)sender
{
	NSLog(@"showing settings.");
	if(settingsViewController == nil){
		[self buildSettingsView];
	}
	
	[baseView flip];
}

- (void)settingsViewControllerDidSaveSettings
{
	[baseView flip];
}


- (void)applicationWillTerminate:(UIApplication *)application
{
	// Save data if appropriate
}


- (void)dealloc
{
	[baseView release];
	[settingsViewController release];
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
