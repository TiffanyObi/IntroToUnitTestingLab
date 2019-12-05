//
//  TriviaDetailViewController.swift
//  IntroToUnitTestingLab
//
//  Created by Tiffany Obi on 12/4/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class TriviaDetailViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var wrongAnswerA: UIButton!
    
    @IBOutlet weak var displayA: UILabel!
    
        
    @IBOutlet weak var displayB: UILabel!
   
    @IBOutlet weak var wrongAnswerB: UIButton!
    
    @IBOutlet weak var displayC: UILabel!
    
    @IBOutlet weak var rightAnswerC: UIButton!
    
    @IBOutlet weak var displayD: UILabel!
    
    var trivia: Trivia!
    
    @IBOutlet weak var wrongAnswerD: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
updateUI()
    }
    
    func updateUI() {
        
        questionLabel.text = trivia.question.removingPercentEncoding
        
        displayC.text = trivia.correct_answer.removingPercentEncoding
        
        displayA.text = trivia.incorrect_answers[0].removingPercentEncoding
        
        displayB.text = trivia.incorrect_answers[1].removingPercentEncoding
        
        displayD.text = trivia.incorrect_answers[2].removingPercentEncoding
        
    }

    @IBAction func attempedToAnswer(_ sender: UIButton) {
        
        let correctTag = 2
        
        if sender.tag == correctTag {
            view.backgroundColor = .green
            questionLabel.text = " CORRECT!!!!! "
            disableButtons()
        } else {
            view.backgroundColor = .red
            questionLabel.text = " WRONG!! "
            disableButtons()
        }
    }
    
    @IBAction func revealAnswer(_ sender: UIButton) {
        
        revealCorrectAnswer()
        
        rightAnswerC.backgroundColor = .green
        
    }
    
   
    func disableButtons() {
        
        let buttons = [wrongAnswerA,wrongAnswerB,rightAnswerC,wrongAnswerD]
        
        for button in buttons {
           
            button?.isEnabled = false
            
        }
        
    }
    
    
    func revealCorrectAnswer () {
        
        let buttons = [wrongAnswerA,wrongAnswerB,rightAnswerC,wrongAnswerD]
        
        for button in buttons {
            button?.isEnabled = true
        
            questionLabel.text = "Learning is Fun!"
            
            view.backgroundColor = .white
        }
        
     }
}

