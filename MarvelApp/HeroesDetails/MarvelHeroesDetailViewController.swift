//
//  MarvelHeroesDetailViewController.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 09/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

class MarvelHeroesDetailViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var indexDetails = ["Comics", "Series"]
    
    let viewModel = HeroDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.delegate = self
        viewModel.loadHeroDetail()
        tableView.register(UINib(nibName: "HeroDetailCell", bundle: nil), forCellReuseIdentifier: "HeroDetailCell")
    }
    
}

extension MarvelHeroesDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //comics and series
        return 2
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(indexDetails[section])"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return viewModel.result?.comics.items.count ?? 0
        default:
            return viewModel.result?.series.items.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroDetailCell", for: indexPath) as! HeroDetailCell
        
        switch indexPath.section {
        case 0:
            if let comicItem = viewModel.result?.comics.items[indexPath.row] {
                cell.prepareCell(with: comicItem)
            }
        default:
            if let serieItem = viewModel.result?.series.items[indexPath.row] {
                cell.prepareCell(with: serieItem)
            }
        }
        
        return cell
    }
}

extension MarvelHeroesDetailViewController: UITableViewDelegate {
    
}

extension MarvelHeroesDetailViewController: HeroDetailViewModelProtocol {
    func didLoadHeroes() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


