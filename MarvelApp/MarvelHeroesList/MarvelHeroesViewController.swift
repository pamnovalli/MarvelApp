//
//  MarvelHeroesViewController.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 09/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

class MarvelHeroesViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
        
    let viewModel = MarvelCharactersViewModel()
    var router: HeroesListRouter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        title = "Marvel Heroes"
        viewModel.delegate = self
        viewModel.loadHeroesList()
        router = HeroesListRouter(viewController: self)
        tableView.register(UINib(nibName: "MarvelHeroes", bundle: nil), forCellReuseIdentifier: "MarvelHeroes")
    }
    
}


extension MarvelHeroesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarvelHeroes", for: indexPath) as! MarvelHeroes
        let hero = viewModel.heroes[indexPath.row]
        cell.prepareCell(with: hero)
        return cell
        
    }
}


extension MarvelHeroesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        router?.navigateToHeroesDetail()
    }
}

extension MarvelHeroesViewController: MarvelCharactersViewModelDelegate {
    func didLoadHeroes() {
        DispatchQueue.main.async {
            self.viewModel.loadingHeroes = false
            self.tableView.reloadData()
        }
    }
    
}

