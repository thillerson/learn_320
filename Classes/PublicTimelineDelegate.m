//
//  PublicTimelineDelegate.m
//  learn_320
//
//  Created by Tony Hillerson on 12/22/09.
//  Copyright 2009 EffectiveUI. All rights reserved.
//

#import "PublicTimelineDelegate.h"
#import <Three20/Three20.h>
#import "JSON.h"

@implementation PublicTimelineDelegate

- (void) dealloc {
	[request release];
	[super dealloc];
}

- (id) initWithURL:(NSString *)url responseDelegate:(id)responder {
	if (self = [self init]) {
		request = [[TTURLRequest alloc] initWithURL:url delegate:self];
		[request setCachePolicy:TTURLRequestCachePolicyNoCache];
		request.response = [[[TTURLDataResponse alloc] init] autorelease];
		responseDelegate = responder; // deliberately weak
	}
	return self;
}

- (void) load {
	[self retain];
	[request send];
}

#pragma mark -
#pragma mark TTURLRequestDelegate methods

- (void)requestDidFinishLoad:(TTURLRequest*)loadedRequest {
	TTURLDataResponse *response = (TTURLDataResponse*)loadedRequest.response;
	NSData *data = response.data;
	NSString *jsonResponse = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
	NSError *error;
	SBJSON *sbjson = [[SBJSON alloc] init];
	NSArray *tweets = (NSArray *)[sbjson objectWithString:jsonResponse error:&error];
	if (nil != responseDelegate && [responseDelegate respondsToSelector:@selector(publicTimelineLoaded:)]) {
		[responseDelegate performSelector:@selector(publicTimelineLoaded:) withObject:tweets];
	}
	[tweets release];
	[self release];
}


@end
