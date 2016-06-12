//
//  JBRangeTests.m
//  JBRangeLib
//
//  Created by jakebromberg on 6/10/16.
//  Copyright © 2016 jakebromberg. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JBRange.h"

@interface JBRangeTests : XCTestCase

@end

@implementation JBRangeTests

- (void)testInitialization {
    JBRange *subject = [[JBRange alloc] initWithStartIndex:1 endIndex:2];
    
    XCTAssertEqualObjects(subject.startIndex, @1);
    XCTAssertEqualObjects(subject.endIndex, @2);
}

- (void)testEnumeration {
    NSTimeInterval time = [NSDate timeIntervalSinceReferenceDate];

    NSInteger startIndex = 1;
    NSInteger endIndex = 10000000;
    JBRange *subject = [[JBRange alloc] initWithStartIndex:startIndex endIndex:endIndex];
    
    NSInteger expectedIndex = startIndex;
    
    for (NSNumber *index in subject) {
        XCTAssertEqual(expectedIndex, index.integerValue);
        expectedIndex++;
    }
    
    NSLog(@"%@", @([NSDate timeIntervalSinceReferenceDate] - time));

    XCTAssertEqual(expectedIndex - 1, endIndex);
}

- (void)testEquality {
    JBRange *subject = [[JBRange alloc] initWithStartIndex:0 endIndex:123];
    JBRange *shouldEqualSubject = [[JBRange alloc] initWithStartIndex:0 endIndex:123];
    JBRange *shouldNotEqualSubject = [[JBRange alloc] initWithStartIndex:0 endIndex:999];
    
    XCTAssertEqualObjects(subject, shouldEqualSubject);
    XCTAssertNotEqualObjects(subject, shouldNotEqualSubject);
    
    NSObject *reallyShouldNotEqualSubject = [[NSObject alloc] init];
    XCTAssertNotEqualObjects(subject, reallyShouldNotEqualSubject);
}

- (void)testCopying {
    JBRange *subject = [[JBRange alloc] initWithStartIndex:0 endIndex:123];
    JBRange *copy = [subject copy];
    
    XCTAssertEqualObjects(subject, copy);
}

@end
