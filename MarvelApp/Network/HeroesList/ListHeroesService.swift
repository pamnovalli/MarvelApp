//
//  MarvelApi.swift
//  MarvelApp
//
//  Created by felipecardoso on 05/07/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import Alamofire

public class HeroesListService {
    
    private let endpoint = Endpoint()
    private let requester = ApiRequester()
    private let parameter = "characters?"
    private let limit = 50
    
    
    func loadHeroes(page: Int, onComplete: @escaping (HeroInfo?) -> Void) {
        let offset = page * limit
        let parameters = parameter + "offset=\(offset)&limit=\(limit)&"
        let url = endpoint.createEndpoint(parameters: parameters)
        requester.request(url: url, onComplete: {(response) in
            guard let data = response.data, let heroesResponse = try? JSONDecoder().decode(HeroInfo.self, from: data),
                heroesResponse.code == 200 else {
                    onComplete(nil)
                    return
            }
            onComplete(heroesResponse)
        })
    }
    
    func loadHero(heroName: String, onComplete: @escaping (HeroInfo?) -> Void) {
        let parameters = parameter + "nameStartsWith=\(heroName)&"
        let url = endpoint.createEndpoint(parameters: parameters)
        print(url)
        requester.request(url: url, onComplete: {(response) in
            guard let data = response.data, let heroesResponse = try? JSONDecoder().decode(HeroInfo.self, from: data) else {
                    onComplete(nil)
                    return
            }
            onComplete(heroesResponse)
        })
    }
    
}
