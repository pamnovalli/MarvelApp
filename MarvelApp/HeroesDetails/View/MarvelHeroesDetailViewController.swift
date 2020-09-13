//
//  MarvelHeroesDetailViewController.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 09/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

final class MarvelHeroesDetailViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private var indexDetails = ["Comics", "Series"]
    private var comics: [ComicsItem] = []
    private var series: [ComicsItem] = []
    private let viewModel: HeroDetailViewModel
    
    init(viewModel: HeroDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad(delegate: self)
        
        tableView.register(UINib(nibName: "HeroDetailCell", bundle: nil), forCellReuseIdentifier: "HeroDetailCell")
    }
}

extension MarvelHeroesDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return indexDetails.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(indexDetails[section])"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return comics.count
        } else {
            return series.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroDetailCell", for: indexPath)
        
        if indexPath.section == 0 {
            (cell as? HeroDetailCell)?.prepareCell(with: comics[indexPath.row])
        } else {
            (cell as? HeroDetailCell)?.prepareCell(with: series[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? HeroDetailCell)?.reuse()
    }
}

extension MarvelHeroesDetailViewController: HeroDetailViewModelProtocol {
    func setComics(_ comics: [ComicsItem]) {
         self.comics = comics
    }
    
    func setSeries(_ series: [ComicsItem]) {
        self.series = series
    }
    
    func tableViewReloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
