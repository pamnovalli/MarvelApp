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
    
    var filteredHeroes: [Hero] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    let viewModel = MarvelCharactersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = "Marvel Heroes"
        viewModel.delegate = self
        viewModel.loadHeroesList()
        tableView.register(UINib(nibName: "MarvelHeroes", bundle: nil), forCellReuseIdentifier: "MarvelHeroes")
    }
    
}


extension MarvelHeroesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredHeroes.count
        }
        return viewModel.heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarvelHeroes", for: indexPath) as! MarvelHeroes
        if isFiltering{
            let hero = filteredHeroes[indexPath.row]
            cell.prepareCell(with: hero)
        } else {
            let hero = viewModel.heroes[indexPath.row]
            cell.prepareCell(with: hero)
        }
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.heroes.count - 10 && !viewModel.loadingHeroes && viewModel.heroes.count != viewModel.total {
            viewModel.currentPage += 1
            viewModel.loadHeroesList()
            
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText:String){
        filterContentForSearchText(searchText)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        if searchText != " " {
            viewModel.loadHero(name: searchText)
            filteredHeroes = viewModel.heroes.filter { (heroes: Hero) -> Bool in
                return heroes.name.lowercased().contains(searchText.lowercased())
            }
        } else {
            self.filteredHeroes = self.viewModel.heroes
        }
        
        self.tableView.reloadData()
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



extension MarvelHeroesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}


