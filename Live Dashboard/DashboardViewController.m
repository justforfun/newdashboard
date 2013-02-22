//
//  DashboardViewController.m
//  Live Dashboard
//
//  Created by Luigi Lobello on 18/01/13.
//  Copyright (c) 2013 Luigi Lobello. All rights reserved.
//

#import "DashboardViewController.h"

@interface DashboardViewController ()
/***
 *  Proprietà necessarie per impostare l'intervallo di date per cui è richeista la generazione del garfico
 ***/
@property (nonatomic) NSDate *dataInizio;
@property (nonatomic) NSDate *dataFine;

/***
 *  viene memorizzato l'ultimo bottone di selezione data (inizio o fine)che è stato toccato dall'utente
 ***/
@property (nonatomic) int lastSenderId;

@end

@implementation DashboardViewController

@synthesize valoreData = _valoreData;
@synthesize startDate = _startDate;
@synthesize dataDesiderata = _dataDesiderata;
@synthesize lastSenderId = _lastSenderId;
@synthesize dataInizio = _dataInizio;
@synthesize dataFine = _dataFine;

#define START_DATE_BUTTON_ID 0
#define END_DATE_BUTTON_ID 1

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
- (void) setDataDesiderata:(UIDatePicker *)dataDesiderata
{
    _dataDesiderata = dataDesiderata;
    
/***
 Occorre disabilitare il Date Picker sino a quando non viene toccato uno dei bottoni di selezione della data di inizio o fine
[self.dataDesiderata setDate:[NSDate date]];
***/
 [self.dataDesiderata setEnabled:NO];


}

- (IBAction)buttonDateTouched:(id)sender {
    /***
     Viene riabilitato il Date Picker
     [self.dataDesiderata setDate:[NSDate date]];
     
     ***/
    [self.dataDesiderata setEnabled:YES];
     self.lastSenderId = [sender tag];
     NSLog(@"Last Sender: %i",self.lastSenderId);

}

/***
- (IBAction)startDateTouched:(id)sender {

 Viene riabilitato il Date Picker
    [self.dataDesiderata setDate:[NSDate date]];
 [self.dataDesiderata setEnabled:YES];


    
    self.lastSenderId = [sender tag];
    NSLog(@"Last Sender: %i",
          self.lastSenderId);
    
    
        }
  ***/

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
    
     ***/

    NSString * strAppoggio = [dateFormatter stringFromDate:datethathasbeenselected];
    NSString *strInizio = @"Inizio:";
    NSString *strTitoloBottone = [strInizio stringByAppendingString:strAppoggio];
    self.valoreData.text = [dateFormatter stringFromDate:datethathasbeenselected];
  
    NSLog(@"Data %@", [dateFormatter stringFromDate:datethathasbeenselected]);
    
    if (self.lastSenderId == START_DATE_BUTTON_ID) {
        self.dataInizio = datethathasbeenselected;
        self.startDate.titleLabel.text = @"Inizio %@", [dateFormatter stringFromDate:datethathasbeenselected];
        [self.startDate setTitle:strTitoloBottone forState:UIControlStateNormal];

    }
    else if(self.lastSenderId == END_DATE_BUTTON_ID) {
        self.dataFine = datethathasbeenselected;
        self.endDate.titleLabel.text = @"Fine %@", [dateFormatter stringFromDate:datethathasbeenselected];
        [self.endDate setTitle:strTitoloBottone forState:UIControlStateNormal];

    }


}



@end
