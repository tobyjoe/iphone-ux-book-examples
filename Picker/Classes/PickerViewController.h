//
//  PickerViewController.h
//  Picker
//
//  Created by Toby Boudreaux on 12/24/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickerDelegate.h"
#import "LabeledPickerView.h"

@interface PickerViewController : UIViewController {
	UIPickerView *picker;
	PickerDelegate *pickerDelegate;
}

@end

