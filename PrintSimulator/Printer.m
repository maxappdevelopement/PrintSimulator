//
//  Printer.m
//  PrintSimulator
//
//  Created by Max Friman on 2019-01-18.
//  Copyright © 2019 Max Friman. All rights reserved.
//

#import "Printer.h"

@implementation Printer

- (int) printPages:(int)pages {
    int pagesToPrint = pages;
    if(self.isDuplex) {
        pagesToPrint = (pages / 2) + (pages % 2);
    }
    return pagesToPrint;
}

- (double) calculatePrice:(int)pages {
    int pagesToPrint = [self printPages:pages];
    double pricePrintedPages;
    if(self.isColor) { 
        pricePrintedPages = pagesToPrint * self.pricePerPrintedPageColor;
    } else {
        pricePrintedPages = pagesToPrint * self.pricePerPrintedPageBlack;
    }
    return pricePrintedPages;
}


- (NSString *)printData: (int)pagesPrinted printData: (double)price {
    NSMutableString *printString = [NSMutableString new];
    NSString *formattedNumber = [NSString stringWithFormat:@"%.02f", price];
    NSString *printCurrency = CurrencyConverter.getCurrency;
    
    [printString appendFormat:@"Pages printed are: %@\nPrice for printed pages are: %@ %@", @(pagesPrinted), formattedNumber, printCurrency];
    return printString;
}

- (id)initIsDuplex: (BOOL)isDuplex initIsColor: (BOOL)isColor {
    if (self)
    {
        [self setIsDuplex:isDuplex];
        [self setIsColor:isColor];
    }
    return self;
}


@end
