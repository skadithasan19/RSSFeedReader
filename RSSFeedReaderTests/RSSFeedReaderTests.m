
//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NewsOperationManager.h"
@interface RSSFeedReaderTests : XCTestCase

@end

@implementation RSSFeedReaderTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testClearAllData {
    XCTAssertTrue([NewsOperationManager clearExistingData]);
}

- (void)testFetchCount {
    NSArray *contents = [[NewsOperationManager alloc] fetchExistingFeed];
    XCTAssertGreaterThanOrEqual([contents count] > 0, [contents count]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
