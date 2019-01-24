//
//  ViewController.m
//  PrintSimulator
//
//  Created by Max Friman on 2019-01-18.
//  Copyright © 2019 Max Friman. All rights reserved.
//

#import "ViewController.h"
#import "Printer.h"
#import "CurrencyConverter.h"


@interface ViewController ()

{
    NSArray *printers;
}

@property (strong) NSString* printerSelectedInPickerview;
@property (assign) BOOL isDuplex;
@property (assign) BOOL isColor;

@end

@implementation ViewController

NSString *mPagesInput = @"pagesInput";
NSString *mSelectedPrinter = @"selectedPrinter";
NSString *mSelectedCurrency = @"selectedCurrency";
NSString *mSelectedSimplexDuplex = @"selectedSimplexDuplex";
NSString *mSelectedMonoColor = @"selectedMonoColor";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    printers = @[@"HPpageWidePro", @"CanonPixma", @"EpsonExpressionXP", @"CompaqIJ"];
    
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    [self.pagesInputTextField becomeFirstResponder];
    
    [self loadData];
}


//Pickerview_______________________________________________
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return printers.count;
}

- (NSString*)pickerView: (UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return printers[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [self setPrinterSelectedInPickerview:printers[row]];
}


//SegmentViews_______________________________________________

- (IBAction)segmentActionSimplexDuplex:(id)sender {
    
    if (self.segmentControlSimplexDuplex.selectedSegmentIndex == 0) {
        [self setIsDuplex:NO];
    }
    if (self.segmentControlSimplexDuplex.selectedSegmentIndex == 1) {
        [self setIsDuplex:YES];
    }
}

- (IBAction)segmentActionMonoColor:(id)sender {
    if (self.segmentControlMonoColor.selectedSegmentIndex == 0) {
        [self setIsColor:NO];
    }
    if (self.segmentControlMonoColor.selectedSegmentIndex == 1) {
        [self setIsColor:YES];
    }
}

- (IBAction)segmentActionCurrency:(id)sender {
    NSString *currency = [self.segmentControlCurrency titleForSegmentAtIndex:self.segmentControlCurrency.selectedSegmentIndex];
    if (self.segmentControlCurrency.selectedSegmentIndex == 0) {
        [CurrencyConverter setCurrency:currency];
    }
    if (self.segmentControlCurrency.selectedSegmentIndex == 1) {
        [CurrencyConverter setCurrency:currency];
    }
    if (self.segmentControlCurrency.selectedSegmentIndex == 2) {
        [CurrencyConverter setCurrency:currency];
    }
}


//Calculate_______________________________________________
- (IBAction)buttonActionCalculate:(id)sender {

    NSString *pagesInput = self.pagesInputTextField.text;
    
    Printer *printer = [[NSClassFromString([self printerSelectedInPickerview]) alloc] initIsDuplex:[self isDuplex] initIsColor:[self isColor]];
    int pagesPrinted = [printer printPages:[pagesInput intValue]];
    double price = [printer calculatePrice:[pagesInput intValue]];
    
    self.labelDisplayCalculate.text = [printer printData:pagesPrinted printData:price];
    
    [self saveData];
}


//NSUserdefaults_______________________________________________

- (void) saveData {

    int pagesInput = [self.pagesInputTextField.text intValue];
    [[NSUserDefaults standardUserDefaults] setObject:@(pagesInput) forKey:mPagesInput];
    
    NSString *selectedPrinter = [self printerSelectedInPickerview];
    [[NSUserDefaults standardUserDefaults] setObject:selectedPrinter forKey:mSelectedPrinter];
    
    long selectedCurrency = self.segmentControlCurrency.selectedSegmentIndex;
    [[NSUserDefaults standardUserDefaults] setObject:@(selectedCurrency) forKey:mSelectedCurrency];
    
    long selectedSimplexDuplex = self.segmentControlSimplexDuplex.selectedSegmentIndex;
    [[NSUserDefaults standardUserDefaults] setObject:@(selectedSimplexDuplex) forKey:mSelectedSimplexDuplex];
    
    long selectedMonoColor = self.segmentControlMonoColor.selectedSegmentIndex;
    [[NSUserDefaults standardUserDefaults] setObject:@(selectedMonoColor) forKey:mSelectedMonoColor];
}

- (void) loadData {
    
    long selectedCurrency = [[[NSUserDefaults standardUserDefaults] objectForKey:mSelectedCurrency] longValue];
    if (selectedCurrency) {
        self.segmentControlCurrency.selectedSegmentIndex = selectedCurrency;
        [CurrencyConverter setCurrency:[self.segmentControlCurrency titleForSegmentAtIndex:self.segmentControlCurrency.selectedSegmentIndex]];
    } else {
        [CurrencyConverter setCurrency:@"USD"];
    }
    
    long selectedSimplexDuplex = [[[NSUserDefaults standardUserDefaults] objectForKey:mSelectedSimplexDuplex] longValue];
    if (selectedSimplexDuplex) {
        self.segmentControlSimplexDuplex.selectedSegmentIndex = selectedSimplexDuplex;
        self.isDuplex = selectedSimplexDuplex;
    }
    
    long selectedMonoColor = [[[NSUserDefaults standardUserDefaults] objectForKey:mSelectedMonoColor] longValue];
    if (selectedMonoColor) {
        self.segmentControlMonoColor.selectedSegmentIndex = selectedMonoColor;
        self.isColor = selectedMonoColor;
    }
    
    int pagesInput = [[[NSUserDefaults standardUserDefaults] objectForKey:mPagesInput] intValue];
    
    NSUInteger index;
    NSString *selectedPrinter = [[NSUserDefaults standardUserDefaults] objectForKey:mSelectedPrinter];
    if (selectedPrinter) {
        Printer *printer = [[NSClassFromString(selectedPrinter) alloc] initIsDuplex:[self isDuplex] initIsColor:[self isColor]];
        int pagesPrinted = [printer printPages:pagesInput];
        double price = [printer calculatePrice:pagesInput];
        self.labelDisplayCalculate.text = [printer printData:pagesPrinted printData:price];
        index = [printers indexOfObject:selectedPrinter];
    } else {
        index = [printers indexOfObject:printers[0]];
    }
    [self.pickerView selectRow:index inComponent:0 animated:0];
    [self pickerView:self.pickerView didSelectRow:index inComponent:0];
    
}


@end
