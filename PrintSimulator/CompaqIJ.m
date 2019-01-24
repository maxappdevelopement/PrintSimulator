//
//  CompaqIJ.m
//  PrintSimulator
//
//  Created by Max Friman on 2019-01-20.
//  Copyright © 2019 Max Friman. All rights reserved.
//

#import "CompaqIJ.h"

@implementation CompaqIJ

- (id)initIsDuplex: (BOOL)isDuplex initIsColor: (BOOL)isColor {
    self = [super initIsDuplex:isDuplex initIsColor:isColor];
    if (self)
    {
        [self setPricePerPrintedPageBlack: [CurrencyConverter calculateCurrency:CurrencyConverter.getCurrency amountToConvert:0.183]];
        [self setPricePerPrintedPageColor: [CurrencyConverter calculateCurrency:CurrencyConverter.getCurrency amountToConvert:0.561]];
    }
    return self;
}

- (NSString *)printData: (int)pagesPrinted printData: (double)price {
    NSString *alreadyPrinted = [super printData:pagesPrinted printData:price];
    NSMutableString *printString = [NSMutableString new];
    self.qualityEnhancer = [QualityEnhancerDevice new];
    NSString *addQuality = [self.qualityEnhancer enhanceQuality];
    [printString appendFormat:@"%@ %@", alreadyPrinted, addQuality];
    return printString;
}


@end
