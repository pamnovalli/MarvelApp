//
//  MarvelCharactersTableViewController.swift
//  MarvelApp
//
//  Created by felipecardoso on 05/07/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import UIKit

class MarvelCharactersTableViewController: UITableViewController {
    
    var heroes: [Character] = []
    var loadingHeroes = false
    var currentPage = 0
    var total = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MarvelCharacters", bundle: nil), forCellReuseIdentifier: "MarvelCharacters")
        title = "Marvel Characters"
        loadHeroes()
    }
    
    func loadHeroes(){
        loadingHeroes = true

        MarvelApi.loadHeroes(page: currentPage) { (info) in
            if let info = info {
                self.heroes += info.data.results
                self.total = info.data.total

                DispatchQueue.main.async {
                    self.loadingHeroes = false
                    self.tableView.reloadData()
                }
            }
        }

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarvelCharacters", for: indexPath) as! MarvelCharacters
        let hero = heroes[indexPath.row]
        cell.prepareCell(with: hero)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == heroes.count - 10 && !loadingHeroes && heroes.count != total {
            currentPage += 1
            loadHeroes()
        }
    }
    
}
