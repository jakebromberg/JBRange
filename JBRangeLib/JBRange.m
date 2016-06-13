//
//  JBRange.m
//  JBRangeLib
//
//  Created by jakebromberg on 6/10/16.
//  Copyright © 2016 jakebromberg. All rights reserved.
//

#import "JBRange.h"

@interface JBRange ()

@property (nonatomic, assign) NSInteger i_startIndex;
@property (nonatomic, assign) NSInteger i_endIndex;

@end

@implementation JBRange

static unsigned long zero;
static unsigned long unitDistance;

- (instancetype)initWithStartIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex {
    if (startIndex > endIndex) {
        return nil;
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        zero = (unsigned long)(__bridge void *)(@0);
        unitDistance = (unsigned long)(__bridge void *)(@1) - zero;
    });

    self = [super init];
    
    if (self != nil) {
        _i_startIndex = startIndex * unitDistance + zero;
        _i_endIndex = endIndex * unitDistance + zero;
    }
    
    return self;
}

#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id  _Nonnull *)buffer count:(NSUInteger)len {
    
    if (state->extra[1] == 0) {
        state->extra[1] = 1;
        state->state = _i_startIndex;
        state->mutationsPtr = state->extra;
        state->itemsPtr = buffer;
    }
    
    if (_i_endIndex <= state->state) {
        return 0;
    }

    NSInteger numIterations = MIN(_i_endIndex - state->state, len);
    NSInteger maxIndex = state->state + numIterations * unitDistance;
    
    for (NSInteger i = state->state; i < maxIndex; i += unitDistance) {
        *buffer++ = (id _Nonnull)i;
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
    
    return range->_i_startIndex == self->_i_startIndex && range->_i_endIndex == self->_i_endIndex;
}

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    NSInteger startIndex = (_i_startIndex - zero) / unitDistance;
    NSInteger endIndex = (_i_endIndex - zero) / unitDistance;
    return [[JBRange allocWithZone:zone] initWithStartIndex:startIndex endIndex:endIndex];
}

#pragma mark Properties

- (NSNumber *)startIndex {
    return (id)_i_startIndex;
}

- (NSNumber *)endIndex {
    return (id)_i_endIndex;
}

@end
