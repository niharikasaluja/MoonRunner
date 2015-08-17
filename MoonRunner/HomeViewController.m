//
//  HomeViewController.m
//  MoonRunner
//
//  Created by dmi on 14/08/15.
//  Copyright (c) 2015 dmi. All rights reserved.
//

#import "HomeViewController.h"
#import "NewRunViewController.h"
#import "BadgesTableViewController.h"
#import "BadgeController.h"
#import <CoreData/CoreData.h>

@interface HomeViewController ()
@property (nonatomic,strong) NSArray *runArray;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Run" inManagedObjectContext : self.managedObjectContext];

    [fetchRequest setEntity : entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"timestamp" ascending:NO];
    [fetchRequest setSortDescriptors: @[sortDescriptor]];
    self.runArray = [self.managedObjectContext executeFetchRequest : fetchRequest error:nil];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UIViewController *nextController = [segue destinationViewController];
    
    if([nextController isKindOfClass:[NewRunViewController class]] )
    {
    
        ((NewRunViewController *)nextController).managedObjectContext = self.managedObjectContext;
    
    }
    
    
    if([nextController isKindOfClass:[NewRunViewController class]])
    {
        ((NewRunViewController *)nextController).managedObjectContext = self.managedObjectContext;
    }
    
    else if ([nextController isKindOfClass:[BadgesTableViewController class]]) {
        ((BadgesTableViewController *) nextController).earnStatusArray = [[BadgeController defaultController] earnStatusesForRuns : self.runArray];
    }
}


@end
