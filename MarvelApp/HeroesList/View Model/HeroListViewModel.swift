//
//  ViewModel.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 24/10/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import UIKit

protocol HeroesListViewModelDelegate: AnyObject {
    func setHeroes(heroes: [Hero])
    func setTitle(_ title: String)
    func tableViewReloadData()
    func setupSearchBar(title: String)
}

final class HeroesListViewModel {
    private let service: HeroesListService
    private weak var delegate: HeroesListViewModelDelegate?
    private var currentPage = 0
    private var total = 0
    private var heroes: [Hero] = []
    private var filteredHeroes: [Hero] = []
    private var loadingHeroes = false
    
    init(service: HeroesListService = HeroesListService()) {
        self.service = service
    }
    
    func viewDidLoad(delegate: HeroesListViewModelDelegate) {
        self.delegate = delegate
        
        loadHeroes()
        delegate.setupSearchBar(title: "Search hero")
        delegate.setTitle("Marvel Heroes")
    }
    
    func willDisplay(indexPath: Int) {
        if indexPath == heroes.count - 10 && heroes.count != total && loadingHeroes == false {
            currentPage += 1
            
            loadHeroes()
        }
    }
    
    func searchBarSearchButtonClicked(inputText: String?) {
        guard let text = inputText, text.count >= 3 else {
            return
        }
        
        searchHeroes(heroName: text)
    }
    
    func searchBarCancelButtonClicked() {
        delegate?.setHeroes(heroes: heroes)
        delegate?.tableViewReloadData()
    }
    
    private func loadHeroes() {
        loadingHeroes.toggle()
        
        service.loadHeroes(currentPage: currentPage) { [weak self] heroInfo in
            let heroesData = heroInfo.data
            
            self?.total = heroesData.total
            self?.heroes += heroesData.results
            self?.delegate?.setHeroes(heroes: self?.heroes ?? [])
            self?.loadingHeroes.toggle()
            self?.delegate?.tableViewReloadData()
        }
    }
    
    private func searchHeroes(heroName: String) {
        loadingHeroes.toggle()

        service.searchHeroes(heroName: heroName) { [weak self] heroInfo in
            let heroesData = heroInfo.data
            
            self?.filteredHeroes = heroesData.results
            self?.delegate?.setHeroes(heroes: self?.filteredHeroes ?? [])
            self?.loadingHeroes.toggle()
            self?.delegate?.tableViewReloadData()
        }
    }
}
