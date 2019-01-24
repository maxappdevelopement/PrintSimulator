//
//  CurrencyConverter.m
//  PrintSimulator
//
//  Created by Max Friman on 2019-01-18.
//  Copyright © 2019 Max Friman. All rights reserved.
//

#import "CurrencyConverter.h"

@implementation CurrencyConverter

static NSString* currency;

+ (double) calculateCurrency: (NSString*)currency amountToConvert:(double) amount {

    NSDictionary *currencies = @{@"USD":@(1.0), @"EUR":@(0.87), @"SEK":@(9.02)};
    
    double scourceCurrency = [[currencies valueForKey:@"USD"] doubleValue];
    double targetCurrency = [[currencies valueForKey:currency] doubleValue];
    
    double rate = scourceCurrency * targetCurrency;
    double convertedCurrency = amount * rate;
    
    return convertedCurrency;
}

+ (NSString*) getCurrency
{
    return currency;
}

+ (void) setCurrency:(NSString*)newCurrency
{
    if( currency != newCurrency ) {
        currency = [newCurrency copy];
    }
}


@end
