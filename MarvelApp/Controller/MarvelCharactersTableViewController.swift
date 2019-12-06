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
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredHeroes: [Character] = []
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MarvelCharacters", bundle: nil), forCellReuseIdentifier: "MarvelCharacters")
        searchController.searchResultsUpdater = self as UISearchResultsUpdating
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Hero"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        title = "Marvel Characters"
        viewModel.delegate = self
        viewModel.loadHeroesList()
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredHeroes.count
        }
        return viewModel.heroes.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarvelCharacters", for: indexPath) as! MarvelCharacters
        if isFiltering{
            let hero = filteredHeroes[indexPath.row]
              cell.prepareCell(with: hero)
        } else {
            let hero = viewModel.heroes[indexPath.row]
              cell.prepareCell(with: hero)
        }
      
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
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
            filteredHeroes = viewModel.heroes.filter { (heroes: Character) -> Bool in
            return heroes.name.lowercased().contains(searchText.lowercased())
            }
        } else {
            self.filteredHeroes = self.viewModel.heroes
        }
      
        self.tableView.reloadData()
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


extension MarvelCharactersTableViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    filterContentForSearchText(searchBar.text!)
  }
}


