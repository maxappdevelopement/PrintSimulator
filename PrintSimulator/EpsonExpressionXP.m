//
//  EpsonExpressionXP.m
//  PrintSimulator
//
//  Created by Max Friman on 2019-01-20.
//  Copyright © 2019 Max Friman. All rights reserved.
//

#import "EpsonExpressionXP.h"

@implementation EpsonExpressionXP

- (id)initIsDuplex: (BOOL)isDuplex initIsColor: (BOOL)isColor {
    self = [super initIsDuplex:isDuplex initIsColor:isColor];
    if (self)
    {
        [self setPricePerPrintedPageBlack: [CurrencyConverter calculateCurrency:CurrencyConverter.getCurrency amountToConvert:0.064]];
        [self setPricePerPrintedPageColor: [CurrencyConverter calculateCurrency:CurrencyConverter.getCurrency amountToConvert:0.218]]; 
        
    }
    return self;
}


@end
