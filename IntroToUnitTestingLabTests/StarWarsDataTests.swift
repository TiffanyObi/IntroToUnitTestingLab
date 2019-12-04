//
//  StarWarsDataTests.swift
//  IntroToUnitTestingLabTests
//
//  Created by Tiffany Obi on 12/3/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import XCTest
@testable import IntroToUnitTestingLab

class StarWarsDataTests: XCTestCase {

    var filename = "starWarsData"
    var ext = "json"
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReadingDataFromStarWarsFile() {
    
        
        let data = getRawData()
        
        XCTAssertNotNil(data)
    }
    
    func testParseDataToStarWarsArray() {

        let data = getRawData()
        
        let movies = ListOfData.getMovies(from: data)
        
        XCTAssertGreaterThan(movies.count, 0, "\(movies.count) should be greater than 0")
        
    }
    
    func testFirstEpisodeID () {
        
 let data = getRawData()
 let movies = ListOfData.getMovies(from: data)
 let expectedEpisodeID = 4
 
 //act
 let firstEpisodeID = movies.first!
 //assert
        XCTAssertEqual(firstEpisodeID.episode_id, expectedEpisodeID, "\(firstEpisodeID.episode_id) should be equal to \(expectedEpisodeID)")
        
    }

}

extension StarWarsDataTests {
    
    func getRawData() -> Data {
        let data = Bundle.readRawJSONData(filename: filename, ext: ext)
        
        return data
    }
}
