//
//  MathController.h
//  MoonRunner
//
//  Created by dmi on 14/08/15.
//  Copyright (c) 2015 dmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathController : NSObject

+(NSString *)stringifyDistance : (float)meters;
+(NSString *)stringifySecondCount :(int)seconds usingLongFormat :(BOOL)longFormat;
+(NSString *)stringifyAvgPaceFromDist:(float)meters overTimes:(int)seconds;

@end
