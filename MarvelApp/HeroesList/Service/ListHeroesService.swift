//
//  MarvelApi.swift
//  MarvelApp
//
//  Created by felipecardoso on 05/07/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import UIKit

final public class HeroesListService {
    private let endpoint: Endpoint
    private let apiClient: APIClient
    private let itensLimit = 50
    
    init(endpoint: Endpoint = Endpoint(),
         apiClient: APIClient = APIClient()) {
        self.endpoint = endpoint
        self.apiClient = apiClient
    }
    
    func loadHeroes(
        currentPage: Int,
        completionHandler: @escaping (HeroInfo) -> Void
    ) {
        let offset = currentPage * itensLimit
        let parameters = "characters?" + "offset=\(offset)&limit=\(itensLimit)&"
        let url = endpoint.createEndpoint(parameters: parameters)
        
        apiClient.request(url: url) { (result: HeroInfo) in
            completionHandler(result)
        }
    }
    
    func searchHeroes(
        heroName: String,
        completionHandler: @escaping (HeroInfo) -> Void
    ) {
        let parameters = "characters?" + "nameStartsWith=\(heroName)&"
        
        let url = endpoint.createEndpoint(parameters: parameters)
        apiClient.request(url: url) { (result: HeroInfo) in
            completionHandler(result)
        }
    }
}
