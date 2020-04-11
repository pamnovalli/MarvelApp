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
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        tableView.dataSource = self
        tableView.delegate = self
        title = "Marvel Heroes"
        viewModel.delegate = self
        coordinator = HeroesListCoordinator(viewController: self)
        tableView.register(UINib(nibName: "MarvelHeroCell", bundle: nil), forCellReuseIdentifier: "MarvelHeroCell")
        searchController.searchResultsUpdater = self as UISearchResultsUpdating
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Heros"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadHeroes(searchHero: nil)
    }
    
}



extension MarvelHeroesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return viewModel.filteredHero.count
        }
        return viewModel.heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarvelHeroCell", for: indexPath) as! MarvelHeroCell
        let hero: Hero
        if isFiltering {
            hero = viewModel.filteredHero[indexPath.row]
        } else {
            hero = viewModel.heroes[indexPath.row]
        }
        cell.prepareCell(with: hero)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.heroes.count - 10 && !viewModel.loadingHeroes && viewModel.heroes.count != viewModel.total {
            viewModel.currentPage += 1
            viewModel.loadHeroes(searchHero: nil)

        }
    }
    
}

extension MarvelHeroesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selectedHeroId: Int
        if isFiltering {
            selectedHeroId = viewModel.filteredHero[indexPath.row].id
        } else {
            selectedHeroId = viewModel.heroes[indexPath.row].id
        }
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

extension MarvelHeroesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchHero = searchController.searchBar.text!
    }
    
}

extension MarvelHeroesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchHero = searchBar.text!
        if !searchHero.isEmpty && searchHero.count >= 3 {
            viewModel.loadHeroes(searchHero: searchHero)
        }
        tableView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tableView.reloadData()
    }
    
}
