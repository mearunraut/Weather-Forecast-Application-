//
//  WeatherViewController.h
//  WeatherForcast
//
//  Created by Arun Raut on 1/20/15.
//  Copyright (c) 2015 Arun Raut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

- (IBAction)backtoHome:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *weatherListTable;
- (IBAction)kelvinToCelsius:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *selectType;
@property (weak,nonatomic) NSString *nameofCity;
@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak,nonatomic) NSMutableArray *tempDetail;

@end
