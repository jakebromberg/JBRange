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

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(__unsafe_unretained id  _Nonnull *)buffer count:(NSUInteger)len {
    if (state->state >= _endIndex.intValue) {
        return 0;
    }
    
    if (state->extra[1] == 0) {
        state->extra[1] = 1;
        state->state = _startIndex.intValue;
    }

    state->itemsPtr = buffer;

    NSInteger numReps = len;
    
    for (; (state->state <= _endIndex.intValue) && (numReps > 0); state->state++) {
        *buffer++ = @(state->state);
        numReps--;
    }
    
    state->mutationsPtr = &state->extra[0];
    
    return len - numReps;
}

@end
