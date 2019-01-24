//
//  CurrencyConverter.h
//  PrintSimulator
//
//  Created by Max Friman on 2019-01-18.
//  Copyright © 2019 Max Friman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CurrencyConverter : NSObject

+ (NSString*) getCurrency;
+ (void) setCurrency:(NSString*)newCurrency;
+ (double) calculateCurrency: (NSString*)currency amountToConvert:(double) amount;

@end

NS_ASSUME_NONNULL_END
