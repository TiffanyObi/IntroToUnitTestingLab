//
//  Bundle+Extensions.swift
//  IntroToUnitTestingLab
//
//  Created by Tiffany Obi on 12/3/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import Foundation

extension Bundle {
    
    class func readRawJSONData(filename: String, ext: String) -> Data {
        
        
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ext) else {
            fatalError(" resource file name \(filename) not found")
        }
        var data: Data!
        
        do {
            data = try Data.init(contentsOf: fileURL)
        } catch {
            fatalError("contents not found \(error)")
        }
        
        return data
    }
    
}
