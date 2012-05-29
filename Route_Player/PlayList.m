//
//  PlayList.m
//  Route_Player
//
//  Created by James Snee on 29/05/2012.
//  Copyright (c) 2012 James Snee. All rights reserved.
//

#import "PlayList.h"

@implementation PlayList
@synthesize playlistItems;

-(id)initWithItems:(NSArray *)items{
	self = [super init];
	if(self){
		playlistItems = items;
		starred = NO;
	}
	return self;
}

-(BOOL)getStarred{
	return starred;
}

-(void)setStarred:(BOOL)value{
	starred = value;
}

@end
