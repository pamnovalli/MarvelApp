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
    let service: HeroesListService
    var delegate: HeroesListViewModelDelegate?
    var filteredHero: [Hero] = []
    
    init(service: HeroesListService = HeroesListService()) {
        self.service = service
    }

    
    func loadHeroes(searchHero: String?) {
        loadingHeroes = true
        service.page = currentPage
        service.callService(heroName: searchHero) { (heroes) in
            if let heroes = heroes {
                self.heroes += heroes.data.results
                self.total = heroes.data.total
                self.delegate?.didLoadHeroes()
            }
        }
        
    }
    
}
