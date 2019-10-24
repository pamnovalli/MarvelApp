//
//  MarvelCharactersTableViewController.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 24/10/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import UIKit
import Foundation


class MarvelCharactersTableViewController: UITableViewController {
    
    
    let viewModel = MarvelCharactersViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MarvelCharacters", bundle: nil), forCellReuseIdentifier: "MarvelCharacters")
        title = "Marvel Characters"
        viewModel.delegate = self
        viewModel.loadHeroes()
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.heroes.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarvelCharacters", for: indexPath) as! MarvelCharacters
        let hero = viewModel.heroes[indexPath.row]
        cell.prepareCell(with: hero)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.heroes.count - 10 && !viewModel.loadingHeroes && viewModel.heroes.count != viewModel.total {
            viewModel.currentPage += 1
            viewModel.loadHeroes()
            
        }
    }
}
extension MarvelCharactersTableViewController: MarvelCharactersViewModelDelegate {
    func didLoadHeroes() {
        DispatchQueue.main.async {
            self.viewModel.loadingHeroes = false
            self.tableView.reloadData()
        }
    }
    
}


