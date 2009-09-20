//
//  ModalButtonViewController.h
//  ModalButton
//
//  Created by Toby Boudreaux on 12/21/08.
//  Copyright CTO, The Barbarian Group 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalButton.h"

@interface ModalButtonViewController : UIViewController {
	ModalButton *button;
}

- (void)performModalActionForButton:(id)sender;

@end

