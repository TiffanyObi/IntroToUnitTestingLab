//
//  StarWarsDetailViewController.swift
//  IntroToUnitTestingLab
//
//  Created by Tiffany Obi on 12/4/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class StarWarsDetailViewController: UIViewController {
    @IBOutlet weak var openingLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var movie: StarWarsData!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       updatUI()
    }
    
    func updatUI() {
    
        textView.text = movie.opening_crawl
        
        view.backgroundColor = .cyan
        
        openingLabel.textColor = .magenta
    }
}
