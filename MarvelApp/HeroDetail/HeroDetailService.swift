//
//  HeroDetailService.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 11/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Alamofire

public class HeroDetailService {
    
    private var endpoint = Endpoint()
    private var requester = ApiRequester()
    private let parameter = "characters/"
    
    func loadHero(heroId: Int, onComplete: @escaping (HeroDetail?) -> Void) {
        let parameters = parameter + "\(heroId)?"
        let url = endpoint.createEndpoint(parameters: parameters)
        requester.request(url: url, onComplete: {(response) in
 
            guard let data = response.data, let heroResponse = try? JSONDecoder().decode(HeroDetail.self, from: data) else {
                    onComplete(nil)
                    return
            }
            onComplete(heroResponse)
        })
        
    }
    
}

