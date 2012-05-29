//
//  PlayList.h
//  Route_Player
//
//  Created by James Snee on 29/05/2012.
//  Copyright (c) 2012 James Snee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayList : NSObject{
	NSArray *playlistItems;
	BOOL starred;
}

@property(strong)NSArray *playlistItems;

-(id)initWithItems:(NSArray *)items;
-(BOOL)getStarred;
-(void)setStarred:(BOOL)value;

@end
