//
//  MarvelApi.swift
//  MarvelApp
//
//  Created by felipecardoso on 05/07/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import Alamofire
import UIKit

public class HeroesListService {

    private let endpoint: Endpoint
    private let apiClient: APIClient
    private let itensLimit = 50
    var page: Int = 0
    
    init(endpoint: Endpoint = Endpoint(), apiClient: APIClient = APIClient()) {
        self.endpoint = endpoint
        self.apiClient = apiClient
    }
    
    func createdParameters(heroName: String?) -> String {
        if heroName != nil {
            return "characters?" + "nameStartsWith=\(String(describing: heroName))&"
        } else {
            let offset = page * 50
            return "characters?" + "offset=\(offset)&limit=\(itensLimit)&"
        }
    }
    
    func callService(heroName: String?, completionHandler: @escaping (HeroInfo?) -> Void) {
        let parameters = createdParameters(heroName: heroName)
        let url = endpoint.createEndpoint(parameters: parameters)
        apiClient.request(url: url) { (value: HeroInfo) in
            completionHandler(value)
        }
    }
    
}
