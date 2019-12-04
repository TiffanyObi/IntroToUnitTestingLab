//
//  StarWarsData.swift
//  IntroToUnitTestingLab
//
//  Created by Tiffany Obi on 12/3/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import Foundation

struct ListOfData: Codable {
    
    let results: [StarWarsData]
    
}

struct StarWarsData: Codable {
    let title: String
    let episode_id: Int
    let opening_crawl: String
}

extension ListOfData {
    
    static func getMovies(from data: Data) -> [StarWarsData] {
    
        var allMovies = [StarWarsData]()
        
        guard let fileURL = Bundle.main.url(forResource: "starWarsData", withExtension: "json") else { fatalError("cannot locate file") }
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            let listOfData = try JSONDecoder().decode(ListOfData.self, from: data)
            
            allMovies = listOfData.results
        }  catch {
            fatalError("decoding error: \(error)")
        }
        return allMovies
    }
}
