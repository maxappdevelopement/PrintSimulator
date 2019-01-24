//
//  Printer.h
//  PrintSimulator
//
//  Created by Max Friman on 2019-01-18.
//  Copyright © 2019 Max Friman. All rights reserved.
//

#import "CurrencyConverter.h"

NS_ASSUME_NONNULL_BEGIN

@interface Printer : NSObject

@property (assign) BOOL isDuplex;
@property (assign) BOOL isColor;
@property (assign) double pricePerPrintedPageBlack; //källa: https://costperpage.nz/
@property (assign) double pricePerPrintedPageColor; //källa: https://costperpage.nz/

- (int)printPages: (int) pages;
- (double)calculatePrice: (int) pages;
- (NSString *)printData: (int)pagesPrinted printData: (double)price;
- (id)initIsDuplex: (BOOL)isDuplex initIsColor: (BOOL)isColor;

@end

NS_ASSUME_NONNULL_END
