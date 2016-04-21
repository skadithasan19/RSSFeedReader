

//  Copyright © 2016 Md Adit Hasan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XMLParser.h"
#import "Constants.h"
@interface XMLParserTests : XCTestCase <XMLParserResultDelegate>
{
    XMLParser *xml;
}
@end

@implementation XMLParserTests

- (void)setUp {
    [super setUp];
    
    xml = [[XMLParser alloc] init];
    xml.delegate = self;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void)XMLResultReturn:(NSArray *)contents {

    XCTAssertGreaterThanOrEqual([contents count] > 0, [contents count]);
}


- (void)testExample {

    [xml loadNewsFromAPI:API];
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
