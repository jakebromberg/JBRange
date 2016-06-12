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

@property (nonatomic, strong) JBRange *subject;

@end

@implementation JBRangeTests

- (void)setUp {
    [super setUp];
    
}

- (void)testInitialization {
    self.subject = [[JBRange alloc] initWithStartIndex:1 endIndex:2];
    
    XCTAssertEqualObjects(self.subject.startIndex, @1);
    XCTAssertEqualObjects(self.subject.endIndex, @2);
}

- (void)testEnumeration {
    NSTimeInterval time = [NSDate timeIntervalSinceReferenceDate];

    NSInteger startIndex = 1;
    NSInteger endIndex = 10000000;
    self.subject = [[JBRange alloc] initWithStartIndex:startIndex endIndex:endIndex];
    
    NSInteger expectedIndex = startIndex;
    
    for (NSNumber *index in self.subject) {
        XCTAssertEqual(expectedIndex, index.integerValue);
        expectedIndex++;
    }
    
    NSLog(@"%@", @([NSDate timeIntervalSinceReferenceDate] - time));

    XCTAssertEqual(expectedIndex - 1, endIndex);
}

@end
