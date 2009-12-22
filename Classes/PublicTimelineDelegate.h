//
//  PublicTimelineDelegate.h
//  learn_320
//
//  Created by Tony Hillerson on 12/22/09.
//  Copyright 2009 EffectiveUI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>

@interface PublicTimelineDelegate : NSObject<TTURLRequestDelegate> {
	id responseDelegate;
	TTURLRequest *request;
}

- (id) initWithURL:(NSString *)url responseDelegate:(id)responseDelegate;
- (void) load;

@end
