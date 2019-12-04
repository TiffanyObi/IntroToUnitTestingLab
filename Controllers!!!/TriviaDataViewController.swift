//
//  TriviaDataViewController.swift
//  IntroToUnitTestingLab
//
//  Created by Tiffany Obi on 12/4/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class TriviaDataViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var allTrivia = [Trivia]()
    
    
    
    func loadData() {
        
        guard let fileURL = Bundle.main.url(forResource: "triviaData", withExtension: "json") else {
            fatalError("could not locate file")
        }
        
        do{
            
        
        let data = try Data(contentsOf: fileURL)
        
            let trivias = try JSONDecoder().decode(AllTriviaData.self, from: data)
        
            allTrivia = trivias.results
       
        } catch {
            fatalError("could not decode data: \(error)")
            
        }
        welcomeLabel.textColor = .purple
        
}
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        loadData()
    }
    

}

extension TriviaDataViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allTrivia.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let triviaCell = tableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        
        let trivia = allTrivia[indexPath.row]
        
        triviaCell.textLabel?.text = trivia.category.removingPercentEncoding
        
        return triviaCell
    }
    
   
}


