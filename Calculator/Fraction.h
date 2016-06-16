//
//  Fraction.h
//  objc
//
//  Created by MF839-011 on 2016. 6. 13..
//  Copyright © 2016년 MyCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property int numerator, denominator;

- (void)print;
- (void)setTo:(int)n over:(int)d;
- (void)reduce;
- (double)converToNum;
- (NSString *)convertToString;

- (Fraction *)add:(Fraction *)f;
- (Fraction *)sub:(Fraction *)f;
- (Fraction *)mul:(Fraction *)f;
- (Fraction *)div:(Fraction *)f;

@end
