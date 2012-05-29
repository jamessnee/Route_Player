//
//  PlayList_VC.h
//  Route_Player
//
//  Created by James Snee on 29/05/2012.
//  Copyright (c) 2012 James Snee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PlayList;

@interface PlayList_VC : UIViewController{
	PlayList *currPlaylist;
}

@property(strong)PlayList *currPlaylist;

@end
