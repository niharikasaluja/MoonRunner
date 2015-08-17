//
//  DetailViewController.h
//  MoonRunner
//
//  Created by dmi on 13/08/15.
//  Copyright (c) 2015 dmi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Run;
@interface DetailViewController : UIViewController
@property (strong,nonatomic) Run *run;
@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

