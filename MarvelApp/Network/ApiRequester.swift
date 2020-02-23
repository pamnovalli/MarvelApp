//
//  ApiRequester.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 10/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Alamofire

class ApiRequester {
    
    func request(url: String, onComplete: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(url).responseJSON { (response) in
            if let status = response.response?.statusCode {
                switch (status) {
                case 200:
                      onComplete(response)
                default:
                    print("error with response status: \(status)")
                    return
                }
            }

        }
    }
    
}

