//
//  LabeledPickerView.h
//  Picker
//
//  Created by Toby Boudreaux on 12/24/08.
//  Copyright 2008 CTO, The Barbarian Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@class _UIPickerViewSelectionBar;

@interface LabeledPickerView : UIPickerView {
	UILabel *fixedLabel;
}

@end
