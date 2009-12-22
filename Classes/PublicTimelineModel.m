//
//  PublicTimelineModel.m
//  learn_320
//
//  Created by Tony Hillerson on 12/22/09.
//  Copyright 2009 EffectiveUI. All rights reserved.
//

#import "PublicTimelineModel.h"
#import "JSON.h"

@implementation PublicTimelineModel

@synthesize tweets;

- (void) dealloc {
	[publicTimelineRequest release];
	[super dealloc];
}

- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more {
	cachePolicy = TTURLRequestCachePolicyNoCache; // make this always load for now
	publicTimelineRequest = [[TTURLRequest alloc] initWithURL:@"http://twitter.com/statuses/public_timeline.json" delegate:self];
	[publicTimelineRequest setCachePolicy:cachePolicy];
	publicTimelineRequest.response = [[[TTURLDataResponse alloc] init] autorelease];
	[publicTimelineRequest send];
}

- (void)requestDidFinishLoad:(TTURLRequest*)loadedRequest {
	TTURLDataResponse *response = (TTURLDataResponse*)loadedRequest.response;
	NSData *data = response.data;
	NSString *jsonResponse = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
	NSError *error;
	SBJSON *sbjson = [[SBJSON alloc] init];
	self.tweets = (NSArray *)[sbjson objectWithString:jsonResponse error:&error];
	[jsonResponse release];
	[sbjson release];
	[super requestDidFinishLoad:loadedRequest];
}

@end
