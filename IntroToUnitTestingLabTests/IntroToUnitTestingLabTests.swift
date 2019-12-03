//
//  IntroToUnitTestingLabTests.swift
//  IntroToUnitTestingLabTests
//
//  Created by Tiffany Obi on 12/2/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import XCTest
@testable import IntroToUnitTestingLab

class IntroToUnitTestingLabTests: XCTestCase {

    
    var filename = "jokesData"
    var ext = "json"
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReadingDataFromJokesData() {

    //arrange
    filename = "jokesData"
    ext = "json"
        
    // act
    let data = getRawData()
        
    // assert
    XCTAssertNotNil(data)
        
    }
    
    func testParseJSONDataToUserArray () {
        
        //arrange
        filename = "jokesData"
        ext = "json"
        let data = getRawData()
        
        //act
        let jokes = JokesData.getJokes(from: data)
        
        //assert
        XCTAssertGreaterThan(jokes.count, 0, "\(jokes.count) should be greater then 0")
    }
    
    func testFirstJokeType() {
        
        // arrange
        filename = "jokesData"
        ext = "json"
        let data = getRawData()
        let jokes = JokesData.getJokes(from: data)
        let expectedType = "programming"
        
        //act
        let firstType = jokes.first!
        //assert
        XCTAssertEqual(firstType.type, expectedType, "\(firstType.type) should be equal to \(expectedType)")
    }
    
}


extension IntroToUnitTestingLabTests {
    
    func getRawData () -> Data {
        
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        return data
        
        
    }
    
    
}
