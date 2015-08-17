//
//  BadgeController.h
//  MoonRunner
//
//  Created by dmi on 17/08/15.
//  Copyright (c) 2015 dmi. All rights reserved.
//

#import <Foundation/Foundation.h>
extern float const silverMultiplier;
extern float const goldMultiplier;
@interface BadgeController : NSObject

+(BadgeController *)defaultController;
- (NSArray *)earnStatusesForRuns:(NSArray *)runArray;
@end
