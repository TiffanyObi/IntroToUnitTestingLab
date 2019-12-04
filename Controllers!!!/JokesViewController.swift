//
//  ViewController.swift
//  IntroToUnitTestingLab
//
//  Created by Tiffany Obi on 12/2/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class JokesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var jokes = [JokesData]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    func loadData () {
        jokes = JokesData.getJokes()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
    }


}

extension JokesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jokeCell = tableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        
        let joke = jokes[indexPath.row]
        
        jokeCell.textLabel?.text = joke.setup
        
        return jokeCell
    }
    
    
}
