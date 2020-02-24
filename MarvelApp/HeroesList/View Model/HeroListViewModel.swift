//
//  ViewModel.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 24/10/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import UIKit

protocol HeroesListViewModelDelegate {
    func didLoadHeroes()
}

class HeroesListViewModel {
    var currentPage = 0
    var heroes: [Hero] = []
    var total = 0
    var loadingHeroes = false
    let service = HeroesListService()
    var delegate: HeroesListViewModelDelegate?
    
    func loadHeroesList() {
        loadingHeroes = true
        
        service.loadHeroes(page: currentPage) { (heroesList) in
            if let heroesList = heroesList {
                self.heroes += heroesList.data.results
                self.total = heroesList.data.total
                self.delegate?.didLoadHeroes()
            }
            
        }
        
    }
    
}
