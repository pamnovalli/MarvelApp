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
    
    private var viewModel = HeroesListViewModel()
    var coordinator: HeroesListCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        tableView.dataSource = self
        tableView.delegate = self
        title = "Marvel Heroes"
        viewModel.delegate = self
        viewModel.loadHeroesList()
        coordinator = HeroesListCoordinator(viewController: self)
        tableView.register(UINib(nibName: "MarvelHeroCell", bundle: nil), forCellReuseIdentifier: "MarvelHeroCell")
    }
    
}

extension MarvelHeroesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarvelHeroCell", for: indexPath) as! MarvelHeroCell
        let hero = viewModel.heroes[indexPath.row]
        cell.prepareCell(with: hero)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.heroes.count - 10 && !viewModel.loadingHeroes && viewModel.heroes.count != viewModel.total {
            viewModel.currentPage += 1
            viewModel.loadHeroesList()
            if indexPath.row == viewModel.heroes.count - 10 && !viewModel.loadingHeroes && viewModel.heroes.count != viewModel.total {
                viewModel.currentPage += 1
                viewModel.loadHeroesList()
                
            }
        }
    }
    
}

extension MarvelHeroesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selectedHeroId = viewModel.heroes[indexPath.row].id
        coordinator?.navigateToHeroesDetail(selectedHeroId: selectedHeroId)
    }
}

extension MarvelHeroesViewController: HeroesListViewModelDelegate {
    func didLoadHeroes() {
        DispatchQueue.main.async {
            self.viewModel.loadingHeroes = false
            self.tableView.reloadData()
        }
    }
    
}

