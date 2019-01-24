//
//  CanonPixma.m
//  PrintSimulator
//
//  Created by Max Friman on 2019-01-18.
//  Copyright © 2019 Max Friman. All rights reserved.
//

#import "CanonPixma.h"

@implementation CanonPixma

- (id)initIsDuplex: (BOOL)isDuplex initIsColor: (BOOL)isColor {
    self = [super initIsDuplex:isDuplex initIsColor:isColor];
    if (self)
    {
        [self setPricePerPrintedPageBlack: [CurrencyConverter calculateCurrency:CurrencyConverter.getCurrency amountToConvert:0.042]];
        [self setPricePerPrintedPageColor: [CurrencyConverter calculateCurrency:CurrencyConverter.getCurrency amountToConvert:0.191]];
    }
    return self;
}

@end
