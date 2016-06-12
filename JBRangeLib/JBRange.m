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

- (NSNumber *)startIndex {
    return @(_i_startIndex);
}

- (NSNumber *)endIndex {
    return @(_i_endIndex);
}

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id  _Nonnull *)buffer count:(NSUInteger)len {
    if (state->extra[1] == 0) {
        state->extra[1] = 1;
        state->state = _i_startIndex;
        state->mutationsPtr = &state->extra[0];
    }
    
    state->itemsPtr = buffer;

    NSInteger numIterations = MIN(_i_endIndex - state->state + 1, len);
    NSInteger maxIndex = numIterations + state->state;
    
    for (; state->state < maxIndex; state->state++) {
        *buffer++ = @(state->state);
    }
    
    return numIterations;
}

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    
    JBRange *range = (JBRange *)object;
    
    return range.startIndex == self.startIndex && range.endIndex == self.endIndex;
}

- (id)copyWithZone:(NSZone *)zone {
    return [[JBRange allocWithZone:zone] initWithStartIndex:_i_startIndex endIndex:_i_endIndex];
}

@end
