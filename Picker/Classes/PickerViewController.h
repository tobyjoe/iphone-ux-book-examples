//
//  PickerViewController.h
//  Picker
//
//  Created by Toby Boudreaux on 12/24/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerDelegate.h"
#import "LabeledPickerView.h"

@interface PickerViewController : UIViewController {
	UIPickerView *picker;
	PickerDelegate *pickerDelegate;
}

@end

