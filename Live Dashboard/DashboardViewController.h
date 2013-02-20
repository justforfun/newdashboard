//
//  DashboardViewController.h
//  Live Dashboard
//
//  Created by Luigi Lobello on 18/01/13.
//  Copyright (c) 2013 Luigi Lobello. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *valoreData;


@property (weak, nonatomic) IBOutlet UIDatePicker *dataDesiderata;


@property (weak, nonatomic) IBOutlet UIButton *startDate;

@end
