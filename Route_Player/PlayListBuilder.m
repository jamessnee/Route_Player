//
//  PlayListBuilder.m
//  Route_Player
//
//  Created by James Snee on 24/05/2012.
//  Copyright (c) 2012 James Snee. All rights reserved.
//

#import "PlayListBuilder.h"

@implementation PlayListBuilder

+(NSArray *)fitForTime:(NSNumber *)secs withSongs:(NSArray *)songs{
	
}

+(NSArray *)sortSongArray:(NSArray *)songs byType:(sortType)sType{
	NSArray *sorted = [songs sortedArrayUsingComparator:^NSComparisonResult(id a, id b){
		MPMediaItem *songA = (MPMediaItem *)a;
		MPMediaItem *songB = (MPMediaItem *)b;
		NSInteger compA;
		NSInteger compB;
		if(sType==RATING){
			compA = [[songA  valueForProperty:MPMediaItemPropertyRating] integerValue];
			compB = [[songB valueForProperty:MPMediaItemPropertyRating] integerValue];
		}else if(sType==PLAYCOUNT){
			compA = [[songA valueForProperty:MPMediaItemPropertyPlayCount] integerValue];
			compB = [[songB valueForProperty:MPMediaItemPropertyPlayCount] integerValue];
		}
		if(compA>compB)
			return NSOrderedAscending;
		else if(compA==compB)
			return NSOrderedSame;
		else
			return NSOrderedDescending;
	}];
	
	return sorted;
}

+(NSArray *)buildPlaylist:(NSNumber *)secs{
	MPMediaQuery *entireLibrary = [MPMediaQuery songsQuery];
	NSArray *libItems = [entireLibrary items];
	libItems = [self sortSongArray:libItems byType:RATING];
	libItems = [self fitForTime:secs withSongs:libItems];

	return libItems;
}

@end
