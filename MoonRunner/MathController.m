//
//  MathController.m
//  MoonRunner
//
//  Created by dmi on 14/08/15.
//  Copyright (c) 2015 dmi. All rights reserved.
//

#import "MathController.h"

@implementation MathController

static bool const isMetric = YES;
static int const metersInKM = 1000;
static int const metersInMiles = 1609.344;



+(NSString *)stringifyDistance : (float)meters
{
    float unitDivider;
    NSString *unitName;
    
    if(isMetric)
    {
       unitName=@"km";
        unitDivider=metersInKM;
    
    }
    else
    {
  
        unitName = @"Miles";
        unitDivider = metersInMiles;
        
    }
   return [NSString stringWithFormat:@"%.2f %@", (meters / unitDivider), unitName];}



+(NSString *)stringifySecondCount:(int)seconds usingLongFormat:(BOOL)longFormat
{

    int remainingSeconds = seconds;
    int hours = remainingSeconds/3600;
    remainingSeconds = remainingSeconds - hours *3600;
    int minutes = remainingSeconds/60;
    remainingSeconds = remainingSeconds - minutes *60;
    if(longFormat)
    {
    
        if(hours >100)
        {
        
            return [NSString stringWithFormat:@"%ihr %imin %isec",hours,minutes,remainingSeconds];
        
        }
        else if (minutes>0)
        {
            return [NSString stringWithFormat:@"%imin,%isec",minutes,remainingSeconds ];
        
        }
        else
        {
        
            return [NSString stringWithFormat:@"%isec",remainingSeconds];
        
        }
    
    }
    else {
    
        if(hours >100)
        {
            
            return [NSString stringWithFormat:@"%02i : %02i : %02i",hours,minutes,remainingSeconds];
            
        }
        else if (minutes>0)
        {
            return [NSString stringWithFormat:@"%02i : %02i",minutes,remainingSeconds ];
            
        }
        else
        {
            
            return [NSString stringWithFormat:@"%02i",remainingSeconds];
            
        }

    
    }



}

+(NSString *)stringifyAvgPaceFromDist:(float)meters overTimes:(int)seconds
{

if(seconds == 0 || meters==0)
{

    return @"0";

}

    float avgPaceSecMeters = seconds/meters ;
    float unitMultiplier;
    
    NSString *unitName;
    
    
    if(isMetric)
    {
    
    unitName = @"min/km";
        unitMultiplier = metersInKM;
    }
    else{
    
        unitName = @"min/miles";
        unitMultiplier = metersInMiles;
    }
    
    int paceMin =(int) ((avgPaceSecMeters * unitMultiplier)/60);
    int paceSec=(int)(avgPaceSecMeters * unitMultiplier -(paceMin *60));
    
    return [NSString stringWithFormat:@"%i %02i %@",paceMin,paceSec,unitName];
    
}


@end


