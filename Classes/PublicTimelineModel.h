//
//  PublicTimelineModel.h
//  learn_320
//
//  Created by Tony Hillerson on 12/22/09.
//  Copyright 2009 EffectiveUI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>

@interface PublicTimelineModel : TTURLRequestModel {
	TTURLRequest *publicTimelineRequest;
	NSArray *tweets;
}

@property(nonatomic,retain) NSArray *tweets;

@end
