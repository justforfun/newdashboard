//
//  DashboardGraphViewController.h
//  Live Dashboard
//
//  Created by Luigi Lobello on 02/04/13.
//  Copyright (c) 2013 Luigi Lobello. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardGraphViewController : UIViewController

@property (nonatomic) NSDate *dataInizio;
@property (nonatomic) NSDate *dataFine;

@property (weak, nonatomic) IBOutlet UILabel *summary;

@end
