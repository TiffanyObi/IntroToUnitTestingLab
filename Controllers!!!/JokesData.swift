//
//  JokesData.swift
//  IntroToUnitTestingLab
//
//  Created by Tiffany Obi on 12/2/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import Foundation


struct  JokesData: Codable {
    
    let type: String
    let setup: String
    let punchline: String
    
}

extension JokesData {
    
    static func getJokes() -> [JokesData] {
        
        var allJokes = [JokesData]()
        
        guard let fileURL = Bundle.main.url(forResource: "jokesData", withExtension: "json") else {
            fatalError("cannot locate file")
        }
        
        do {
            
            let data = try Data(contentsOf: fileURL)
            
            let groupOfJokes = try JSONDecoder().decode([JokesData].self, from: data)
            
            allJokes = groupOfJokes
            
        } catch {
            fatalError("decoding error: \(error)")
        }
        
        return allJokes
    }
}
