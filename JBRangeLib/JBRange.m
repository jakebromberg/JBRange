//
//  JBRange.m
//  JBRangeLib
//
//  Created by jakebromberg on 6/10/16.
//  Copyright © 2016 jakebromberg. All rights reserved.
//

#import "JBRange.h"

@interface JBRange () {
    NSUInteger _startIndex;
    NSUInteger _endIndex;
}

@end

@implementation JBRange

static unsigned long zero;
static unsigned long unitDistance;

+ (void)initialize {
    zero = (unsigned long)@0;
    unitDistance = (unsigned long)@1 - zero;
}

- (instancetype)initWithStartIndex:(NSUInteger)startIndex endIndex:(NSUInteger)endIndex {
    if (startIndex > endIndex) {
        return nil;
    }

    self = [super init];
    
    if (self != nil) {
        _startIndex = startIndex * unitDistance + zero;
        _endIndex = endIndex * unitDistance + zero;
    }
    
    return self;
}

#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id  _Nonnull *)buffer count:(NSUInteger)len {
    
    if (state->state == 0) {
        state->state = _startIndex;
        state->mutationsPtr = state->extra;
        state->itemsPtr = buffer;
    }

    NSUInteger numIterations = MIN((_endIndex - state->state) / unitDistance, len);
    NSUInteger maxIndex = state->state + numIterations * unitDistance;
    
    for (NSUInteger i = state->state; i < maxIndex; i += unitDistance) {
        *buffer++ = (id)i;
    }
    
    state->state = maxIndex;
    
    return numIterations;
}

#pragma mark Equality

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    
    JBRange *range = (JBRange *)object;
    
    return range->_startIndex == self->_startIndex && range->_endIndex == self->_endIndex;
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    NSUInteger startIndex = (_startIndex - zero) / unitDistance;
    NSUInteger endIndex = (_endIndex - zero) / unitDistance;
    return [[JBRange allocWithZone:zone] initWithStartIndex:startIndex endIndex:endIndex];
}

#pragma mark Properties

- (NSNumber *)startIndex {
    return (id)_startIndex;
}

- (NSNumber *)endIndex {
    return (id)_endIndex;
}

@end
