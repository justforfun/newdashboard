//
//  DashboardViewController.m
//  Live Dashboard
//
//  Created by Luigi Lobello on 18/01/13.
//  Copyright (c) 2013 Luigi Lobello. All rights reserved.
//

#import "DashboardViewController.h"
#import "DashboardGraphViewController.h"

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
@synthesize graphIt = _graphIt;

#define START_DATE_BUTTON_ID 0
#define END_DATE_BUTTON_ID 1

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationController.title = @"Dashboard";
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

    // self.valoreData.text = strAppoggio;
  
    NSLog(@"Data %@", [dateFormatter stringFromDate:datethathasbeenselected]);
    
    /***
     *  Stampo nel bottone la data selezionata e imposto il valore
     *  della data minima o massima deldate picker per evitare che la data 
     *  di inizio sia più grande di quella di fine o che quella di fine sia 
     *  più piccola di quella di inizio
     ***/
    if (self.lastSenderId == START_DATE_BUTTON_ID) {
        // imposto la data di inizio
        self.dataInizio = datethathasbeenselected;
        NSString *strInizio = @"Inizio:";
        NSString *strTitoloBottone = [strInizio stringByAppendingString:strAppoggio];
        [self.startDate setTitle:strTitoloBottone forState:UIControlStateNormal];
        // [self.startDate setEnabled:NO];
        [sender setMinimumDate:datethathasbeenselected];
        self.valoreData.text = strTitoloBottone;
    }
    else if(self.lastSenderId == END_DATE_BUTTON_ID) {
        // imposto la data di fine
        self.dataFine = datethathasbeenselected;
        NSString *strInizio = @" Fine:";
        NSString *strTitoloBottone = [strInizio stringByAppendingString:strAppoggio];
        [self.endDate setTitle:strTitoloBottone forState:UIControlStateNormal];
        // [self.endDate setEnabled:NO];
        [sender setMaximumDate:datethathasbeenselected];
        self.valoreData.text = [self.valoreData.text stringByAppendingString:strTitoloBottone];
        [self.graphIt setEnabled:YES];

    }

    

}

- (IBAction)graphItAction:(UIButton *)sender {
    // [self performSegueWithIdentifier:@"segue graph it" sender:sender];
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"segue graph it"]) {
        
        // Get destination view
        DashboardGraphViewController *vc = segue.destinationViewController;
        
        
        // Pass the information to your destination view
        [vc setDataInizio:self.dataInizio];
        [vc setDataFine:self.dataFine];
        
    }
}



/***
 // When any of my buttons are pressed, push the next view
 - (IBAction)buttonPressed:(id)sender
 {
 [self performSegueWithIdentifier:@"segue graph it" sender:sender];
 }
 
 // This will get called too before the view appears
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 if ([[segue identifier] isEqualToString:@"segue graph it"]) {
 
 // Get destination view
 SecondView *vc = [segue destinationViewController];
 
 // Get button tag number (or do whatever you need to do here, based on your object
 NSInteger tagIndex = [(UIButton *)sender tag];
 
 // Pass the information to your destination view
 [vc setSelectedButton:tagIndex];
 }
 }
 ***/


@end
