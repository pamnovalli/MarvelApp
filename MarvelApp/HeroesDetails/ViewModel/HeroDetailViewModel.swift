//
//  HeroDetailViewModel.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 11/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation


protocol HeroDetailViewModelProtocol {
    func didLoadHeroes()
}

class HeroDetailViewModel {
    
    var results: [Result] = []
    
    
     var delegate: HeroDetailViewModelProtocol?
     let service = HeroDetailService()
    
    func loadHeroDetail() {
        
        service.loadHero { (heroDetails) in
            if let heroDetails = heroDetails {
                self.results = heroDetails.data.results
            }
        }
        
    }
    
}
