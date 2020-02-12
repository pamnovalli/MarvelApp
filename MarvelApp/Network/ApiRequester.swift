//
//  ApiRequester.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 10/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Alamofire

class ApiRequester {
    
    func request(url: String, onComplete: @escaping (DataResponse<Any>) -> Void) {
        AF.request(url).responseJSON { (response) in
            print(response)
            onComplete(response)
        }
    }
    
}

