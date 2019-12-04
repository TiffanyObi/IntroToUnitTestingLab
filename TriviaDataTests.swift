//
//  TriviaDataTests.swift
//  IntroToUnitTestingLabTests
//
//  Created by Tiffany Obi on 12/3/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import XCTest
@testable import IntroToUnitTestingLab

class TriviaDataTests: XCTestCase {
 
    var filename = "triviaData"
    var ext = "json"
    
    
    func testParseDataFromTriviaDataFile () {
        
        let data = getRawData()
        
        XCTAssertNotNil(data)
    }
    
    func testParseDataToTriviaDataArray() {
        
        let data = getRawData()
        
        let triviaData = AllTriviaData.getAllData(from: data)
        
        XCTAssertGreaterThan(triviaData.count, 0, "trivia data.count: (\(triviaData.count)) should be more than 0.")
    }
    
    func testFirstTypeInDataArray() {
        
        let data = getRawData()
        let allTrivia = AllTriviaData.getAllData(from: data)
        let expectedType = "multiple"
        
        let firstType = allTrivia.first?.type ?? "Muahah"
        
        XCTAssertEqual(firstType, expectedType, "the expectedType is \(expectedType) and firstType is \(firstType)")
    }
    
}

extension TriviaDataTests {
    
    func getRawData() -> Data {
        
        let data = Bundle.readRawJSONData(filename: "triviaData", ext: "json")
        
        return data
    }
}
