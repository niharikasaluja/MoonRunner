//
//  Badge.h
//  MoonRunner
//
//  Created by dmi on 17/08/15.
//  Copyright (c) 2015 dmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Badge : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *imageName;
@property (nonatomic,strong) NSString *information;
@property float distance;

@end
