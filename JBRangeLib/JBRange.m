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
    if (state->state >= _i_endIndex) {
        return 0;
    }
    
    if (state->extra[1] == 0) {
        state->extra[1] = 1;
        state->state = _i_startIndex;
    }

    state->itemsPtr = buffer;

    NSInteger numReps = len;
    
    for (; (state->state <= _i_endIndex) && (numReps > 0); state->state++) {
        *buffer++ = @(state->state);
        numReps--;
    }
    
    state->mutationsPtr = &state->extra[0];
    
    return len - numReps;
}

@end
