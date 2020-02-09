//
//  ViewModel.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 24/10/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import UIKit

protocol MarvelCharactersViewModelDelegate {
    func didLoadHeroes()
   
}


class MarvelCharactersViewModel {
   
    
    var heroes: [Hero] = []
    var currentPage = 0
    var name: String = ""
    var total = 0
    var loadingHeroes = false
    let marvelApi = MarvelApi()
    
    var delegate: MarvelCharactersViewModelDelegate?
    
    func loadHeroesList(){
        loadingHeroes = true

        marvelApi.loadHeroesList(page: currentPage) { (info) in
               if let info = info {
                   self.heroes += info.data.results
                   self.total = info.data.total
                   self.delegate?.didLoadHeroes()
               }
           }
       }
    
    func loadHero(name: String){
    loadingHeroes = true

    marvelApi.loadHero(heroName: name) { (info) in
           if let info = info {
               self.heroes += info.data.results
               self.total = info.data.total
               self.delegate?.didLoadHeroes()
           }
       }
   }
}
