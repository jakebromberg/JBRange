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

- (instancetype)initWithStartIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex {
    if (startIndex > endIndex) {
        return nil;
    }
    
    self = [super init];
    
    if (self != nil) {
        _i_startIndex = startIndex;
        _i_endIndex = endIndex;
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
    

    NSInteger numIterations = MIN(_i_endIndex - state->state + 1, len);
    NSInteger maxIndex = numIterations + state->state;
    
    for (; state->state < maxIndex; state->state++) {
        *buffer++ = @(state->state);
    }
    
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
    return [[JBRange allocWithZone:zone] initWithStartIndex:_i_startIndex endIndex:_i_endIndex];
}

#pragma mark Properties

- (NSNumber *)startIndex {
    return @(_i_startIndex);
}

- (NSNumber *)endIndex {
    return @(_i_endIndex);
}

@end
