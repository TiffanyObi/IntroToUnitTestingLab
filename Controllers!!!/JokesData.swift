//
//  JokesData.swift
//  IntroToUnitTestingLab
//
//  Created by Tiffany Obi on 12/2/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import Foundation

//struct GroupOfJokes: Codable {
//    let jokes : [JokesData]
//}

struct  JokesData: Codable {
    
    let type: String
    let setup: String
    let punchline: String
    
}

extension JokesData {
    
    static func getJokes(from data: Data) -> [JokesData] {
        
        var allJokes = [JokesData]()
        
        do {
            let groupOfJokes = try JSONDecoder().decode([JokesData].self, from: data)
            allJokes = groupOfJokes
        } catch {
            fatalError("decoding error: \(error)")
        }
        
        return allJokes
    }
}
