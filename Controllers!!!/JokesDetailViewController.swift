//
//  JokesDetailViewController.swift
//  IntroToUnitTestingLab
//
//  Created by Tiffany Obi on 12/4/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class JokesDetailViewController: UIViewController {

    
    @IBOutlet weak var punchlineView: UITextView!
    
    var joke: JokesData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    func updateUI() {
        view.backgroundColor = .yellow
        punchlineView.text = joke.punchline
    }

}
