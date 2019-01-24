//
//  CompaqIJ.h
//  PrintSimulator
//
//  Created by Max Friman on 2019-01-20.
//  Copyright © 2019 Max Friman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Printer.h"
#import "QualityEnhancerDevice.h"

NS_ASSUME_NONNULL_BEGIN

@interface CompaqIJ : Printer

@property (strong) QualityEnhancerDevice *qualityEnhancer;

- (NSString *)printData: (int)pagesPrinted printData: (double)price;

@end

NS_ASSUME_NONNULL_END
