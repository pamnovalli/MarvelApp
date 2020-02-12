//
//  HeroDetailService.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 11/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Alamofire

class HeroDetailService {
    
    private var endpoint = Endpoint()
    private var requester = ApiRequester()
    private let parameter = "characters/"
    var characterId = 1009154
    
    
    func loadHero(onComplete: @escaping (HeroDetail?) -> Void) {
        let parameters = parameter + "\(characterId)?"
        let url = endpoint.createEndpoint(parameters: parameters)
        requester.request(url: url, onComplete: {(response) in
            guard let data = response.data, let heroResponse = try? JSONDecoder().decode(HeroDetail.self, from: data),
                heroResponse.code == 200 else {
                    onComplete(nil)
                    return 
            }
            onComplete(heroResponse)
        })
    
    }
    
}
