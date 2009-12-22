//
//  TwitterAPI.m
//  learn_320
//
//  Created by Tony Hillerson on 12/22/09.
//  Copyright 2009 EffectiveUI. All rights reserved.
//

#import "TwitterAPI.h"
#import "PublicTimelineDelegate.h"

@implementation TwitterAPI

+ (void) loadPublicTimelineWithDelegate:(id)delegate {
	PublicTimelineDelegate *timelineDelegate = [[[PublicTimelineDelegate alloc] initWithURL:@"http://twitter.com/statuses/public_timeline.json" responseDelegate:delegate] autorelease];
	[timelineDelegate load];
}

@end
