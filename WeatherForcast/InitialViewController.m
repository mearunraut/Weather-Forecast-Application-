//
//  InitialViewController.m
//  WeatherForcast
//
//  Created by Arun Raut on 1/20/15.
//  Copyright (c) 2015 Arun Raut. All rights reserved.
//

#import "InitialViewController.h"
#import "ViewController.h"
@interface InitialViewController ()

@end

@implementation InitialViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       
               
        ViewController *destinationViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        destinationViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        [self presentViewController:destinationViewController animated:YES completion:nil];
       
    });
}


@end
