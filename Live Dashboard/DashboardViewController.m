//
//  DashboardViewController.m
//  Live Dashboard
//
//  Created by Luigi Lobello on 18/01/13.
//  Copyright (c) 2013 Luigi Lobello. All rights reserved.
//

#import "DashboardViewController.h"

@interface DashboardViewController ()

@end

@implementation DashboardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@synthesize valoreData = _valoreData;

- (IBAction)dataSelezionata:(UIDatePicker *)sender {
    NSDate *datethathasbeenselected = [sender date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    
    NSLocale *itLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"it_IT"];
    [dateFormatter setLocale:itLocale];
    
    /**
    NSLog(@"Date for locale %@: %@",
          [[dateFormatter locale] localeIdentifier], [dateFormatter stringFromDate:datethathasbeenselected]);
    **/
    
    self.valoreData.text = [dateFormatter stringFromDate:datethathasbeenselected];
    

}



@end
