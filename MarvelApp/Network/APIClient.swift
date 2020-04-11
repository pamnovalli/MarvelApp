//
//  APIClient.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 10/04/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Alamofire
import Foundation


//enum Response<Value> {
//    case success(Value)
//    case failure(Error)
//}

class APIClient {
    
    func request<T: Decodable>(
        url: String,
        completionHandler: @escaping (T) -> Void){
        AF.request(url).responseJSON { (response) in
           switch response.result {
           case .success:
               do {
                   guard let data = response.data else {return}
                   let object = try JSONDecoder().decode(T.self, from: data)
                   completionHandler(object)
               } catch {
                   return
               }
           case let .failure(error):
               print(error)
           }
        }
    }
}

