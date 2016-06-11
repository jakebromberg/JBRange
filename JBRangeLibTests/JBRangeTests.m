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
    self.subject = [[JBRange alloc] initWithStartIndex:0 endIndex:9];
    
    NSMutableSet *expectedValues = [NSMutableSet setWithArray:@[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9]];
    
    
    for (NSNumber *index in self.subject) {
        XCTAssertTrue([expectedValues containsObject:index]);
        [expectedValues removeObject:index];
    }
    
    XCTAssertEqual(expectedValues.count, 0);
}

@end
