//
//  MarvelApi.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 06/06/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelApi {
    
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static private let privatekey = "823484589a8ece6a7c4d611f1819c1d5f279df1f"
    static private let publickey = "c4d937ea79bb222dd20310db8e5ab83c"
    static private let limit = 50
    
    
    class func loadHeroes(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void) {
        let offset = page * limit
        let startsWith: String
        
        if let name = name, !name.isEmpty {
            startsWith = "nameStartWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = ""
        }
    
        let url = basePath + "offset=\(offset)&limit=\(limit)&" + startsWith + getCredentials()
        print(url)
        AF.request(url).responseJSON { (response) in
            guard let data = response.data,
                let marvelInfo = try? JSONDecoder().decode(MarvelInfo.self, from: data),
                marvelInfo.code == 200 else {
                    onComplete(nil)
                return
            }
            onComplete(marvelInfo)
        }
        
    }
    
    private class func getCredentials() -> String {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privatekey+publickey).lowercased()
        return "ts=\(ts)&apikey=\(publickey)&hash=\(hash)"
    }

}


