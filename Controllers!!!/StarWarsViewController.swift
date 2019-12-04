//
//  StarWarsViewController.swift
//  IntroToUnitTestingLab
//
//  Created by Tiffany Obi on 12/3/19.
//  Copyright © 2019 Tiffany Obi. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var movies = [StarWarsData]() {
        
        didSet {
            
            tableView.reloadData()
        }
    }
    
    
    func loadData () {
        
        guard let fileURL = Bundle.main.url(forResource: "starWarsData", withExtension: "json") else {
            fatalError("Could not locate file")
        }
        
        do{
            
        let data = try Data(contentsOf: fileURL)
            
            
            let movie = try JSONDecoder().decode(ListOfData.self, from: data)
            
            movies = movie.results
        } catch {
            fatalError("could not decode file: \(error)")
        }
}
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
        
    }

}

extension StarWarsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let starWarsCell = tableView.dequeueReusableCell(withIdentifier: "starWarsCell", for: indexPath)
        
        let movie = movies[indexPath.row]
        
        starWarsCell.textLabel?.text = movie.title
        
        return starWarsCell
    }
    
    
}
