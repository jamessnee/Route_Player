//
//  ViewController.m
//  Route_Player
//
//  Created by James Snee on 23/05/2012.
//  Copyright (c) 2012 James Snee. All rights reserved.
//

#import "ViewController.h"
#import "PlayListBuilder.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize timePicker,musicPlayerController,currentPlaylist;

-(void)startPlayback{
	MPMediaItemCollection *mediaCollection = [[MPMediaItemCollection alloc]initWithItems:currentPlaylist];
	[musicPlayerController setQueueWithItemCollection:mediaCollection];
	[musicPlayerController play];
}

-(IBAction)goButton:(id)sender{
	NSTimeInterval time = [timePicker countDownDuration];
	NSNumber *secs = [NSNumber numberWithDouble:time];
	currentPlaylist = [PlayListBuilder buildPlaylist:secs];
	[self startPlayback];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	musicPlayerController = [MPMusicPlayerController applicationMusicPlayer];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end