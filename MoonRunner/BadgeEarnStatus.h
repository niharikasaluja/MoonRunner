//
//  BadgeEarnStatus.h
//  MoonRunner
//
//  Created by dmi on 17/08/15.
//  Copyright (c) 2015 dmi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Badge;
@class Run;

extern float const silverMultiplier;
extern float const goldMultiplier;

@interface BadgeEarnStatus : NSObject

@property (strong , nonatomic) Badge *badge;
@property(strong,nonatomic) Run *earnRun;
@property(strong,nonatomic) Run *silverRun;
@property(strong,nonatomic) Run *goldRun;
@property(strong,nonatomic) Run *bestRun;

-(NSArray *)earnStatusesForRun : (NSArray *)runArray;


@end
