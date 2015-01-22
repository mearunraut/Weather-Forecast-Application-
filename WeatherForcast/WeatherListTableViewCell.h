//
//  WeatherListTableViewCell.h
//  WeatherForcast
//
//  Created by Arun Raut on 1/20/15.
//  Copyright (c) 2015 Arun Raut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateofWeather;
@property (weak, nonatomic) IBOutlet UILabel *daytype;
@property (weak, nonatomic) IBOutlet UILabel *weatherCondition;


@end
