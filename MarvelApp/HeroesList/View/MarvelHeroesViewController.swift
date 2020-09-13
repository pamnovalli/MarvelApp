//
//  MarvelHeroesViewController.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 09/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

protocol MarvelHeroesViewControllerDelegate: AnyObject {
    func didSelectRowAt(selectedHeroId: Int)
}

final class MarvelHeroesViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private let viewModel: HeroesListViewModel
    private var heroes: [Hero] = []
    weak var delegate: MarvelHeroesViewControllerDelegate?
    
    init(viewModel: HeroesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad(delegate: self)
        
        tableView.register(UINib(nibName: "MarvelHeroCell", bundle: nil), forCellReuseIdentifier: "MarvelHeroCell")
    }
}

extension MarvelHeroesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarvelHeroCell", for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        
        (cell as? MarvelHeroCell)?.prepareCell(with: heroes[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.willDisplay(indexPath: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? MarvelHeroCell)?.reuse()
    }
}

extension MarvelHeroesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        delegate?.didSelectRowAt(selectedHeroId: heroes[indexPath.row].id)
    }
}

extension MarvelHeroesViewController: HeroesListViewModelDelegate {
    func setupSearchBar(title: String) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = title
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func tableViewReloadData() {
        tableView.reloadData()
    }
    
    func setHeroes(heroes: [Hero]) {
        self.heroes = heroes
    }
    
    func setTitle(_ title: String) {
        self.title = title
    }
}

extension MarvelHeroesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchBarSearchButtonClicked(inputText: searchBar.text )
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchBarCancelButtonClicked()
    }
}
