//
//  ViewController.m
//  Route_Player
//
//  Created by James Snee on 23/05/2012.
//  Copyright (c) 2012 James Snee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize timePicker,musicPlayerController;

-(void)buildPlaylist:(NSNumber *)secs{
	MPMediaQuery *entireLibrary = [MPMediaQuery songsQuery];
	NSArray *libItems = [entireLibrary items];
	NSLog(@"Items Count: %d",[libItems count]);
}

-(IBAction)goButton:(id)sender{
	NSTimeInterval time = [timePicker countDownDuration];
	NSNumber *secs = [NSNumber numberWithDouble:time];
	[self buildPlaylist:secs];
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
