//
//  ViewModel.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 24/10/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import Foundation
import UIKit

protocol MarvelCharactersViewModelDelegate {
    func didLoadHeroes()
   
}


class MarvelCharactersViewModel {
   
    
    var heroes: [Character] = []
    var currentPage = 0
    var total = 0
    var loadingHeroes = false
    let marvelApi = MarvelApi()
    
    var delegate: MarvelCharactersViewModelDelegate?
    
    func loadHeroes(){
        loadingHeroes = true

        marvelApi.loadHeroes(page: currentPage) { (info) in
               if let info = info {
                   self.heroes += info.data.results
                   self.total = info.data.total
                   self.delegate?.didLoadHeroes()
               }
           }
       }
    
       
}
