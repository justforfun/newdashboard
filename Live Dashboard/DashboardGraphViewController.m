//
//  DashboardGraphViewController.m
//  Live Dashboard
//
//  Created by Luigi Lobello on 02/04/13.
//  Copyright (c) 2013 Luigi Lobello. All rights reserved.
//

#import "DashboardGraphViewController.h"

@interface DashboardGraphViewController ()

@end

@implementation DashboardGraphViewController

@synthesize dataInizio = _dataInizio;
@synthesize dataFine = _dataFine;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
 
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
     [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
     
     
     NSLocale *itLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"it_IT"];
     [dateFormatter setLocale:itLocale];
     

     NSLog(@"Date for locale %@: %@",
     [[dateFormatter locale] localeIdentifier], [dateFormatter stringFromDate:self.dataInizio]);
     
    
    NSString * strDataInizio = [dateFormatter stringFromDate:self.dataInizio];
    NSString * strDataFine= [dateFormatter stringFromDate:self.dataFine];
    
    self.summary.text = strDataInizio;
    self.summary.text = [self.summary.text stringByAppendingString:strDataFine];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
