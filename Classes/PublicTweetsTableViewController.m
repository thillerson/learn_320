//
//  PublicTweetsTableViewController.m
//  learn_320
//
//  Created by Tony Hillerson on 12/22/09.
//  Copyright 2009 EffectiveUI. All rights reserved.
//

#import "PublicTweetsTableViewController.h"
#import "PublicTweetsTableViewDataSource.h"
#import "PublicTimelineModel.h"

@implementation PublicTweetsTableViewController

- (id)init {
  if (self = [super init]) {
    self.title = @"Tweetz";
		id<TTTableViewDataSource> ds = [PublicTweetsTableViewDataSource dataSourceWithItems:nil];
		ds.model = [[PublicTimelineModel alloc] init];
		self.dataSource = ds;
	}
	return self;
}

- (void) viewDidLoad {
	[self reload];
}

- (void)dealloc {
    [super dealloc];
}

@end

