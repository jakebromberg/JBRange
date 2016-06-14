//
//  JBRange.h
//  JBRangeLib
//
//  Created by jakebromberg on 6/10/16.
//  Copyright © 2016 jakebromberg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JBRange : NSObject <NSFastEnumeration, NSCopying>

@property (nonatomic, readonly) NSNumber *startIndex;
@property (nonatomic, readonly) NSNumber *endIndex;

- (nullable instancetype)initWithStartIndex:(NSUInteger)startIndex endIndex:(NSUInteger)endIndex NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
