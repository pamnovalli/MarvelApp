//
//  HeroDetailViewModel.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 11/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

protocol HeroDetailViewModelProtocol {
    func didLoadHeroes()
}

class HeroDetailViewModel {
    var result: Result?
    let service: HeroDetailService
    var delegate: HeroDetailViewModelProtocol?
    var heroId: Int = Int(0.0)
    
    init(service: HeroDetailService = HeroDetailService()) {
        self.service = service
    }
    
    func loadHeroDetail() {
        service.callService(heroId: heroId) { (heroDetails) in
            if let heroDetails = heroDetails {
                self.result = heroDetails.data.results.first
                self.delegate?.didLoadHeroes()
            }
            
        }
        
    }
    
}


