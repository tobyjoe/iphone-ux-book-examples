//
//  Board.h
//  Tiles
//
//  Created by Toby Boudreaux on 12/4/08.
//  Copyright 2008-2009 Toby Joe Boudreaux. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tile.h"

@interface Board : UIView {
	NSMutableArray *tiles;
	Tile *currentTile;
	BOOL hasTiles;
}

@property (nonatomic, retain) NSMutableArray *tiles;
@property (nonatomic, assign) BOOL hasTiles;

- (void)hideTilesNotMatchingTerm:(NSString *)term;
- (void)addTile;
- (void)removeTile:(Tile *)tile;

@end
