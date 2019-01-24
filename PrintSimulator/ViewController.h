//
//  ViewController.h
//  PrintSimulator
//
//  Created by Max Friman on 2019-01-18.
//  Copyright © 2019 Max Friman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelChoosePrinter;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControlSimplexDuplex;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControlMonoColor;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControlCurrency;

@property (weak, nonatomic) IBOutlet UITextField *pagesInputTextField;
@property (strong, nonatomic) IBOutlet UILabel *labelDisplayCalculate;

- (IBAction)segmentActionSimplexDuplex:(id)sender;
- (IBAction)segmentActionMonoColor:(id)sender;
- (IBAction)segmentActionCurrency:(id)sender;
- (IBAction)buttonActionCalculate:(id)sender;

@end

