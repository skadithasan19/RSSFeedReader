

//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "iService.h"
#import "Constants.h"
@interface iServiceTests : XCTestCase

@end

@implementation iServiceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testWebAPIAccess {
    // This is an iService getJsonResponse functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTestExpectation *expectation =
    [self expectationWithDescription:@"High Expectations"];
    
    [iService getJsonResponse:API success:^(NSData *data) {
        XCTAssert(data);
        [expectation fulfill];
    } failure:^(NSError *error) {
        NSLog(@"Failed to load data");
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
