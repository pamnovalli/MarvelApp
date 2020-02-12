//
//  MarvelHeroesRouter.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 09/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation


protocol HeroListRoutering {
    func navigateToHeroesDetail()
}

class HeroesListRouter: HeroListRoutering {
    
    weak var viewController: MarvelHeroesViewController?
    
    init(viewController: MarvelHeroesViewController) {
        self.viewController = viewController
    }
    
    func navigateToHeroesDetail() {
        let nextViewController = MarvelHeroesDetailViewController(nibName: "MarvelHeroesDetailViewController", bundle: Bundle.main)
        viewController?.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
