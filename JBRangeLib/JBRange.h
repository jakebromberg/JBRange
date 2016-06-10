//
//  JBRange.h
//  JBRangeLib
//
//  Created by jakebromberg on 6/10/16.
//  Copyright © 2016 jakebromberg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBRange : NSObject

@property (nonatomic, readonly) NSNumber *startIndex;
@property (nonatomic, readonly) NSNumber *endIndex;

- (instancetype)initWithStartIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@end
