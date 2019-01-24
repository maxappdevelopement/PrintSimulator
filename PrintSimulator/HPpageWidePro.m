//
//  HPpageWidePro.m
//  PrintSimulator
//
//  Created by Max Friman on 2019-01-18.
//  Copyright © 2019 Max Friman. All rights reserved.
//

#import "HPpageWidePro.h"

@implementation HPpageWidePro

- (id)initIsDuplex: (BOOL)isDuplex initIsColor: (BOOL)isColor {
    self = [super init];
    if (self)
    {
        [self setPricePerPrintedPageBlack: [CurrencyConverter calculateCurrency:CurrencyConverter.getCurrency amountToConvert:0.019]];
        [self setPricePerPrintedPageColor: [CurrencyConverter calculateCurrency:CurrencyConverter.getCurrency amountToConvert:0.096]]; 
    }
    return self;
}

@end
