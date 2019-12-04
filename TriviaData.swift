//
//  TriviaData.swift
//  IntroToUnitTestingLab
//
//  Created by Tiffany Obi on 12/4/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import Foundation



struct AllTriviaData: Decodable {
    let results: [Trivia]
}

struct Trivia: Decodable {
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}

extension AllTriviaData {
    
    static func getAllData(from data: Data) -> [Trivia] {
        
        var allTriviaData = [Trivia]()
        
        guard let fileURL = Bundle.main.url(forResource: "triviaData", withExtension: "json") else {
            fatalError("Could not locate url")
        }
        
        do {
            
            let data = try Data(contentsOf: fileURL)
            
            let allTrivia = try JSONDecoder().decode(AllTriviaData.self, from: data)
            
            allTriviaData = allTrivia.results
           
        } catch {
            fatalError("could not locate data")
        }
        return allTriviaData
    }
    
}
