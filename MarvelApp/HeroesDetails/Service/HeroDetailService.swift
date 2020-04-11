//
//  HeroDetailService.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 11/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Alamofire

public class HeroDetailService {
    
    private let apiClient: APIClient
    private let endpoint: Endpoint
    private let parameter = "characters/"
    
    init(apiClient: APIClient = APIClient(), endpoint: Endpoint = Endpoint()) {
        self.apiClient = apiClient
        self.endpoint = endpoint
    }
    
    func callService(heroId: Int, completionHandler: @escaping (HeroDetail?) -> Void) {
        let url = endpoint.createEndpoint(parameters: parameter + "\(heroId)?")
        apiClient.request(url: url, completionHandler: {  (value: HeroDetail) in
            completionHandler(value)
        })
        
    }
    
}

