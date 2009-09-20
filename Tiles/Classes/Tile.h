//
//  Tile.h
//  Tiles
//
//  Created by Toby Boudreaux on 12/4/08.
//  Copyright 2008 CTO, The Barbarian Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tile : UIView {
	BOOL selected;
	BOOL hasAppeared;
	UIImageView *backgroundView;
}

@property (nonatomic, assign) BOOL selected;

- (void)toggleSelected;
- (void)disappear;
- (void)appearWithSize:(CGSize)size AtPoint:(CGPoint)point;

@end
