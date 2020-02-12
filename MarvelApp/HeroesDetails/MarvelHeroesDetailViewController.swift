//
//  MarvelHeroesDetailViewController.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 09/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

class MarvelHeroesDetailViewController: UIViewController {
    
    let viewModel = HeroDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }

}

extension MarvelHeroesDetailViewController: HeroDetailViewModelProtocol {
    func didLoadHeroes() {
        
    }
    
    
}
