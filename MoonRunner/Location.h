//
//  Location.h
//  MoonRunner
//
//  Created by dmi on 17/08/15.
//  Copyright (c) 2015 dmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Run;

@interface Location : NSManagedObject

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSDate * timestamp;
@property (nonatomic, retain) NSOrderedSet *run;
@end

@interface Location (CoreDataGeneratedAccessors)

- (void)insertObject:(Run *)value inRunAtIndex:(NSUInteger)idx;
- (void)removeObjectFromRunAtIndex:(NSUInteger)idx;
- (void)insertRun:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeRunAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInRunAtIndex:(NSUInteger)idx withObject:(Run *)value;
- (void)replaceRunAtIndexes:(NSIndexSet *)indexes withRun:(NSArray *)values;
- (void)addRunObject:(Run *)value;
- (void)removeRunObject:(Run *)value;
- (void)addRun:(NSOrderedSet *)values;
- (void)removeRun:(NSOrderedSet *)values;
@end
