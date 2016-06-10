//
//  JBRange.m
//  JBRangeLib
//
//  Created by jakebromberg on 6/10/16.
//  Copyright © 2016 jakebromberg. All rights reserved.
//

#import "JBRange.h"

@implementation JBRange

- (instancetype)initWithStartIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex {
    self = [super init];
    
    if (self != nil) {
        _startIndex = @(startIndex);
        _endIndex = @(endIndex);
    }
    
    return self;
}

@end
