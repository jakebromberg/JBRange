//
//  JBRange.m
//  JBRangeLib
//
//  Created by jakebromberg on 6/10/16.
//  Copyright © 2016 jakebromberg. All rights reserved.
//

#import "JBRange.h"

@interface JBRange ()

@property (nonatomic, strong) NSMutableArray *indexes;

@end

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
    return [self.indexes countByEnumeratingWithState:state objects:buffer count:len];
}


- (NSArray *)indexes {
    if (!_indexes) {
        _indexes = [NSMutableArray array];
        
        for(NSInteger index = _startIndex.intValue; index <= _endIndex.intValue; index++) {
            [_indexes addObject:@(index)];
        }
    }
    
    return _indexes;
}

@end
