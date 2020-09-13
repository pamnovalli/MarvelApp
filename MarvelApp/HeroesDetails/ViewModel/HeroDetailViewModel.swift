//
//  HeroDetailViewModel.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 11/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

protocol HeroDetailViewModelProtocol {
    func setComics(_ comics: [ComicsItem])
    func setSeries(_ series: [ComicsItem])
    func tableViewReloadData()
}

class HeroDetailViewModel {
    private let service: HeroDetailService
    private var delegate: HeroDetailViewModelProtocol?
    private let heroId: Int
    
    init(service: HeroDetailService = HeroDetailService(),
         heroId: Int
    ) {
        self.service = service
        self.heroId = heroId
    }
    
    func viewDidLoad(delegate: HeroDetailViewModelProtocol) {
        self.delegate = delegate
        loadHeroDetail()
    }
    
    private func loadHeroDetail() {
        service.loadHeroDetail(heroId: heroId) { [weak self] heroDetails in
            guard let result = heroDetails.data.results.first else { return }
            
            let comics = result.comics.items
            let series = result.series.items
            
            self?.delegate?.setComics(comics)
            self?.delegate?.setSeries(series)
            self?.delegate?.tableViewReloadData()
        }
    }
}
