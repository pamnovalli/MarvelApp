//
//  MarvelHeroesRouter.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 09/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation


protocol HeroesListCoordinatorProtocol {
    func navigateToHeroesDetail(selectedHeroId: Int)
}

class HeroesListCoordinator: HeroesListCoordinatorProtocol {

    
    weak var viewController: MarvelHeroesViewController?
    
    init(viewController: MarvelHeroesViewController) {
        self.viewController = viewController
    }
    
    func navigateToHeroesDetail(selectedHeroId: Int) {
        let nextViewController = MarvelHeroesDetailViewController(nibName: "MarvelHeroesDetailViewController", bundle: Bundle.main)
        nextViewController.viewModel.heroId = selectedHeroId
        viewController?.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
