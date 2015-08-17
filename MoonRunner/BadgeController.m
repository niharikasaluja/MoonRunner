//
//  BadgeController.m
//  MoonRunner
//
//  Created by dmi on 17/08/15.
//  Copyright (c) 2015 dmi. All rights reserved.
//

#import "BadgeController.h"
#import "Badge.h"
#import "BadgeEarnStatus.h"
#import "Run.h"
float const silverMultiplier = 1.05;   // 5% speed increase
float const goldMultiplier= 1.10;
@interface BadgeController()
// 10% speed increase
@property (strong,nonatomic) NSArray *badges;

@end
@implementation BadgeController

-(NSArray *)earnStatusesForRuns : (NSArray *)runs
{

    NSMutableArray *earnStatuses = [NSMutableArray array];
for(Badge *badge in self.badges)
{

    BadgeEarnStatus *earnStatus = [BadgeEarnStatus new];
    earnStatus.badge = badge;
    
    for(Run *run in runs)
    {
    
        if(run.distance.floatValue >badge.distance)
        {
        
        
            if(!earnStatus.earnRun)
                earnStatus.earnRun = run;
        }
    
        
        double earnRunSpeed =earnStatus.earnRun.distance.doubleValue / earnStatus.earnRun.duration.doubleValue;
        
        double runSpeed = run.distance.doubleValue / run.duration.doubleValue;
        
        if(!earnStatus.silverRun && runSpeed > earnRunSpeed *silverMultiplier)
        {
        
        
            earnStatus.silverRun = run;
        
        }
        if(!earnStatus.goldRun && runSpeed > earnRunSpeed * goldMultiplier)
        {
        
            earnStatus.goldRun = run;
        
        }
        
        if(!earnStatus.bestRun)
        {
            earnStatus.bestRun = run;
        
        }
        
        else{
        
            double  bestRunSpeed = earnStatus.bestRun.distance.doubleValue / earnStatus.bestRun.duration.doubleValue ;
            
            if(runSpeed > bestRunSpeed)
            {
            
                earnStatus.bestRun = run;
            
            }
        
        }
        
        
    }
    [earnStatuses addObject:earnStatus];
    
}


    return earnStatuses;

}









+(BadgeController *)defaultController
{

    static BadgeController *controller = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
    
        controller = [[BadgeController alloc]init];
        controller.badges = [self badgeArray];
    });
    return controller;
}

+(NSArray *)badgeArray
{

    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"badges" ofType:@"txt"];
    
    NSString *jsonContent = [NSString stringWithContentsOfFile:filePath encoding:nil error:nil];
    NSData  *data=[jsonContent dataUsingEncoding:NSUTF8StringEncoding ];
    NSArray *badgeDicts = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSMutableArray *badgeObjects = [NSMutableArray array];
    
    for(NSDictionary *badgeDict in badgeDicts)
    {
    
        [badgeObjects addObject:[self badgeForDictionary : badgeDict]];
    
    }
    return badgeObjects;
}

+(Badge *)badgeForDictionary :(NSDictionary *)dictionary
{

    Badge *badge = [Badge new];
    badge.name = [dictionary objectForKey:@"name"];
    badge.imageName = [dictionary objectForKey:@"imageName"];
    badge.information = [dictionary objectForKey:@"information"];
    badge.distance = [[dictionary objectForKey:@"distance"]floatValue];
    return badge;
}


@end
